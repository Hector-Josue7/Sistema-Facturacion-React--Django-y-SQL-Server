-- consulta a mostrar en la primera tabla de la pantalla de facturacion
select A.codigo_articulo, A.descripcion, A.precio_unitario_de_venta, A.dias_vida_util, B.nombre as marca, C.cantidad_en_bodega FROM tbl_marcas B 
INNER JOIN tbl_articulos A ON B.codigo_marca = A.codigo_marca 
INNER JOIN tbl_inventarios C ON A.codigo_articulo = C.codigo_articulo 


select A.codigo_articulo, A.descripcion, A.precio_unitario_de_venta, A.dias_vida_util, B.nombre as marca, C.cantidad_en_bodega FROM tbl_marcas B 
INNER JOIN tbl_articulos A ON B.codigo_marca = A.codigo_marca 
INNER JOIN tbl_inventarios C ON A.codigo_articulo = C.codigo_articulo ORDER BY A.descripcion


select A.codigo_articulo, A.descripcion, A.precio_unitario_de_venta, A.dias_vida_util, B.nombre as marca, C.cantidad_en_bodega FROM tbl_marcas B 
INNER JOIN tbl_articulos A ON B.codigo_marca = A.codigo_marca 
INNER JOIN tbl_inventarios C ON A.codigo_articulo = C.codigo_articulo
WHERE A.descripcion = 'Palitos de papa con salsa pequeños'


select A.codigo_articulo, A.descripcion, A.precio_unitario_de_venta, A.dias_vida_util, B.nombre as marca, C.cantidad_en_bodega FROM tbl_marcas B 
INNER JOIN tbl_articulos A ON B.codigo_marca = A.codigo_marca 
INNER JOIN tbl_inventarios C ON A.codigo_articulo = C.codigo_articulo
WHERE A.descripcion LIKE 'p%'

