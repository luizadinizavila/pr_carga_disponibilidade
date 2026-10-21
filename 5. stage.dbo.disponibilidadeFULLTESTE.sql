exec sp_describe_first_result_set @tqsl = N'select * from  stage.view_disponibilidadeTESTEINC'

CREATE TABLE disponibilidadeFULLTESTE (
    
    ID INT IDENTITY(1,1),
    Dt_Base DATETIME,
    OrigemId VARCHAR(200),
    Origem VARCHAR(30),
    TAG VARCHAR(15),
    cd_equipto INT,
    OM VARCHAR(10),
    Peso_om VARCHAR(50),
    abertura_om DATETIME,
    prev_entrega_om DATETIME,
    Contrato VARCHAR(50),
    nm_almox VARCHAR(50),
    propiedade VARCHAR(50),
    cd_pessoa_prop CHAR(10),
    fl_equipto VARCHAR(50),
    [Status] VARCHAR(21),
    status_tratado VARCHAR(21),
    Quantidade FLOAT,
    valor_reposicao FLOAT,
    Unidade VARCHAR(10),
    Indenizacao FLOAT,

    CONSTRAINT PK_disponibilidadeFULLTESTE PRIMARY KEY (Id),
    CONSTRAINT UQ_disponibilidadeFULLTESTE_CARGA UNIQUE (OrigemId)
)