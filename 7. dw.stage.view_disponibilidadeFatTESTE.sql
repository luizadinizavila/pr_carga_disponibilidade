CREATE OR ALTER VIEW stage.view_disponibilidadefatTESTE   
AS    
SELECT    
     D.OrigemId    
    ,D.Origem    
    ,D.dt_base                                                         AS DtBase    
    ,U.UnidadeUnificadaid                                              AS IdUnidade    
    ,P.cd_patrimonio                                                   AS IdPatrimonio    
    ,LTRIM(RTRIM(D.tag))                                               AS Tag    
    ,D.cd_equipto                                                      AS IdEquipamento    
    ,CASE    
        WHEN LTRIM(RTRIM(D.OM)) IN ('', '0') THEN NULL    
        ELSE LTRIM(RTRIM(D.OM))    
     END                                                               AS NumeroOM    
    ,ISNULL(NULLIF(LTRIM(RTRIM(D.Peso_om)), ''), 'Sem Classificação')  AS PesoOM    
    ,TRY_CONVERT(date, D.abertura_om)              AS DataAberturaOM    
    ,TRY_CONVERT(date, D.prev_entrega_om)         AS DataPrevEntregaOM    
    ,IIF(C.numero = '', NULL, C.numero)                                AS Contrato    
    ,LTRIM(RTRIM(D.nm_almox))                                          AS Almoxarifado    
    ,CASE LTRIM(RTRIM(D.propiedade))    
        WHEN 'Propio' THEN 'Próprio'    
        ELSE LTRIM(RTRIM(D.propiedade))    
     END                                                               AS Propriedade    
    ,LTRIM(RTRIM(D.[Status]))                                          AS StatusOperacional    
    ,LTRIM(RTRIM(D.status_tratado))                                    AS StatusGerencial    
    ,D.valor_reposicao                                                 AS ValorReposicao    
    ,CASE    
        WHEN ZC.[Status] LIKE '%ZONA-CINZENTA%'    
            THEN 'ZONA-CINZENTA'    
        WHEN ZC.[Status] LIKE '%LOCADO-EMPRESTIMO%'    
            THEN 'LOCADO-EMPRESTIMO'    
        ELSE LTRIM(RTRIM(D.[Status]))    
     END                                                               AS StatusParque    
FROM stage.dbo.disponibilidadeFULL D    
LEFT JOIN patrimon P    
       ON LTRIM(RTRIM(P.nr_patrimonio)) COLLATE DATABASE_DEFAULT = LTRIM(RTRIM(D.TAG)) COLLATE DATABASE_DEFAULT    
LEFT JOIN dbo.Unidade U    
       ON U.Apelido COLLATE DATABASE_DEFAULT = D.Unidade COLLATE DATABASE_DEFAULT    
LEFT JOIN (    
            -- 1 linha por contrato; tira os zeros à esquerda: 'CAJ.000120/14' -> 'CAJ.120/14'    
            SELECT DISTINCT    
                   T.Numero  AS numero    
                  ,N.Chave   AS NumeroNormalizado    
            FROM Contrato CT    
            CROSS APPLY (SELECT LTRIM(RTRIM(CT.numero)) AS Numero) T    
            CROSS APPLY (SELECT CHARINDEX('.', T.Numero) AS Ponto    
                               ,CHARINDEX('/', T.Numero) AS Barra) X    
            CROSS APPLY (SELECT CASE WHEN X.Ponto > 0 AND X.Barra > X.Ponto + 1    
                                     THEN LEFT(T.Numero, X.Ponto)    
                                        + CAST(TRY_CAST(SUBSTRING(T.Numero, X.Ponto + 1, X.Barra - X.Ponto - 1) AS int) AS varchar(10))    
                                        + SUBSTRING(T.Numero, X.Barra, 10)    
                                END AS Chave) N    
          ) C    
       ON C.NumeroNormalizado COLLATE DATABASE_DEFAULT = LTRIM(RTRIM(D.contrato)) COLLATE DATABASE_DEFAULT    
LEFT JOIN stage.dbo.disponibilidadeZCFULL ZC    
       ON ZC.dt_base = D.dt_base    
      AND ZC.TAG COLLATE DATABASE_DEFAULT = D.TAG COLLATE DATABASE_DEFAULT