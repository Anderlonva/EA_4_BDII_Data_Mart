--Las consultas se realizaron a traves del acceso a tablas, excepto las siguientes dos consultas.

--Script para consulta de Pedido
SELECT [ID_detalle_pedido]
      ,[ID_detalle_pedido_O]
	  ,pd.[ID_pedido]
      ,[fecha_pedido]
      ,upper(pd.[estado]) estado 
      ,isnull([comentarios],'N/A') comentarios
      ,[ID_cliente]
      ,[cantidad]
      ,[precio_unidad]
  FROM [Staging_Jardineria].[dbo].[DestinoTbDetallePedido_ST] dp,[Staging_Jardineria].[dbo].[DestinoTbPedido_ST] pd
  WHERE dp.[ID_pedido] = pd.[ID_pedido]

--Script para consulta de facventas 

SELECT dp.[ID_detalle_pedido],pd.[ID_pedido], pr.[ID_producto], [ID_cliente], dt.[Id_tiempo]
  ,dp.[cantidad],dp.[precio_unidad],dp.[precio_unidad]*dp.[cantidad] AS total_venta
  FROM [Staging_Jardineria].[dbo].[DestinoTbPedido_ST] pd
  INNER JOIN [Staging_Jardineria].[dbo].[DestinoTbDetallePedido_ST] dp
  ON pd.[ID_pedido] = dp.ID_pedido
  INNER JOIN [Staging_Jardineria].[dbo].[DestinoTbProducto_ST] pr
  ON pr.[ID_producto]=dp.[ID_producto]
  INNER JOIN [Staging_Jardineria].[dbo].[DimTiempo] dt
  ON pd.[fecha_pedido]=dt.[fecha_pedido]
