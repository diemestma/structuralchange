# structuralchange
Paquete de R para generar indicadores de cambio estructural. 

## Contenido
Por el momento, se puede descargar el R Script con la función para calcular la matriz de Ventajas Comparativas Reveladas (RCA, por sus siglas en inglés): [rca.R](/rca.R). Esta función permite calcular la RCA a partir de cualquier objeto de clase *data.frame* o *tibble* que contenga tres columnas. La primera columna debe presentar los **nombres o códigos de las localidades** a estudiar; la segunda columna, información de los **códigos del flujo** a estudiar (e.g., SIC para empleo o HS para exportaciones); la tercera columna, información de la **cantidad del flujo** para todos los pares localidad-flujo. [^1]

[^1]: Nota: para la construcción de esta función nos apoyamos, principalmente, de dos fuentes: **1)** Mealy, P., Farmer, J. D. & Teytelboym, A. (2019). Interpreting economic complexity. *Science Advances*. 5(1). https://doi.org/10.1126/sciadv.aau1705; **2)** la función *balassa_index* del paquete [economiccomplexity](https://github.com/pachadotdev/economiccomplexity/tree/master)
