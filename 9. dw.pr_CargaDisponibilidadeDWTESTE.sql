CREATE OR ALTER PROCEDURE pr_CargaDisponibilidadeDWTESTE 
AS    
BEGIN    

EXEC pr_carga @Origem = 'stage.view_disponibilidadeFatTESTE',
              @Destino = 'disponibilidadeFatTESTE',
              @Tipo = 'upsert' 
END