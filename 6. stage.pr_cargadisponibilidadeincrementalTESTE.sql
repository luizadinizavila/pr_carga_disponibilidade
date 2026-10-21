CREATE OR ALTER PROCEDURE pr_CargaDisponibilidadeIncrementalTESTE   
AS    
BEGIN    


DECLARE @Janela DATE = DATEADD(DAY, -2, GETDATE());

DECLARE @FiltroDisp VARCHAR(200) =
        CONCAT('dt_base >= ''', @Janela, '''');


EXEC pr_carga @Origem = 'stage.view_disponibilidadeTESTEinc',
              @Destino = 'disponibilidadeFULLTESTE',
              @Tipo = 'upsert_semdel',
              @FILTRO = @FiltroDisp;  
END