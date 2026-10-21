exec sp_describe_first_result_set @tqsl = N'select * from  stage.view_disponibilidadefatTESTE'

CREATE TABLE disponibilidadeFatTESTE (
    
    ID INT IDENTITY(1,1),
    OrigemId VARCHAR(200),
    Origem VARCHAR(30),
    DtBase DATE,
    IdUnidade INT,
    IdPatrimonio INT,
    TAG VARCHAR(15),
    IdEquipamento INT,
    NumeroOM VARCHAR(10),
    PesoOM VARCHAR(50),
    DataAberturaOM DATE,
    DataPrevEntregaOM DATE,
    Contrato VARCHAR(50),
    Almoxarifado VARCHAR(50),
    Propriedade VARCHAR(50),
    StatusOperacional VARCHAR(21),
    StatusGerencial VARCHAR(21),
    ValorReposicao FLOAT,
    StatusParque VARCHAR(21),

    CONSTRAINT PK_disponibilidadeFatTESTE PRIMARY KEY (Id),
    CONSTRAINT UQ_disponibilidadeFatTESTE_CARGA UNIQUE (OrigemId)
)