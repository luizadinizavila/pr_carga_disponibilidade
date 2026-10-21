CREATE   VIEW stage.view_disponibilidadeTESTEINC   
AS   
select *  from OPENQUERY ( [AGECLUSQL01\SISLOC] ,  
'SELECT   DISTINCT     D.dt_base, CONCAT(d.contrato, '' | '', d.unidade, '' | '', D.cd_equipto, '' | '', CAST(d.dt_base AS DATE), ''|'', d.Tag, ''|'', OM) as OrigemId  
, Origem = ''DISPONIBILIDADE_PATRIMONIO''  
, D.TAG  
, D.cd_equipto  
, D.OM  
, D.Peso_om  
, D.abertura_om  
, D.prev_entrega_om  
, D.Contrato  
, D.nm_almox  
, D.propiedade  
, D.cd_pessoa_prop  
, D.fl_equipto  
, D.[Status]  
, D.status_tratado  
, D.Quantidade  
, D.valor_reposicao  
, Unidade  
, Indenizacao FROM [insix_reports].[dbo].[DISPONIBILIDADE_PATRIMONIO] D with(nolock)  
 WHERE   D.dt_base >=  DATEADD(DAY,-2,GETDATE()) and d.tag != ''-'' '  )   
  
  