select *  from OPENQUERY ( [AGECLUSQL01\SISLOC] ,  
'SELECT   
count(*)
FROM [insix_reports].[dbo].[DISPONIBILIDADE_PATRIMONIO] D with(nolock)  
WHERE   D.dt_base >=  ''2025-01-01'' and d.tag != ''-'' '  )   

select *  from OPENQUERY ( [AGECLUSQL01\SISLOC] ,  
'SELECT   
count(*)
FROM [insix_reports].[dbo].[DISPONIBILIDADE_PATRIMONIO_ZC] D with(nolock)')   
  
select *  from OPENQUERY ( [AGECLUSQL01\SISLOC] ,  
'SELECT   
count(*)
FROM [dbsislocsalvador].[dbo].[patrimon] D with(nolock)  ')   
  
  select *  from OPENQUERY ( [AGECLUSQL01\SISLOC] ,  
'SELECT   
count(*)
FROM [dbsislocsalvador].[dbo].[unidade] D with(nolock)  ')   
