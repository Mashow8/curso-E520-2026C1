
# cargar librerias --------------------------------------------------------
library(tidyverse)




# cargar datos ------------------------------------------------------------


#vuelos_2025

  anac_2025 <-
    read_csv2(
      file = 'Tareas/tarea 5/202512-informe-ministerio-actualizado-dic-final.csv')


#aeropuertos
  
aeropuertos <-
  read_csv(file = 'Tareas/tarea 5/iata-icao.csv')

#clima 
##para las columnas usar esto ojito......
##revisar si podemos encontrar una relacion entre nombre 
##de estacion meteorologica y codigo de aeropuerto
##select es para borrar como para senalar una columna especifica.


#clima <-
#  read_fwf(file = 'Tareas/tarea 5/registro_temperatura365d_smn.txt', 
#           col_positions = fwf_widths(c(8,1,5,1,5,200), c('fecha','x','tmax', 'y',',tmin','nombre'))
#           ,skip=3
#           ) |> select(-x,-y)


clima <-
  read_table(file = 'Tareas/tarea 5/registro_temperatura365d_smn.txt') 


# analisis de datos -------------------------------------------------------

glimpse(anac_2025)
anac_2025 <-
  anac_2025 |>
  mutate(
    #fecha=lubridate:: ('fecha UTC'),
    #hora=lubridate::  ('hora UTC'),
   
    tipo_vuelo=factor(`Clase de Vuelo (todos los vuelos)`),
    clasif_vuelo=factor(`Clasificacion Vuelo`),
    tipo_movimiento=factor(`Tipo de Movimiento`),
    aeropuerto= factor(`Aeropuerto`),
    origen_destino= factor(`Origen / Destino`),
    aerolinea=factor(`Aerolinea Nombre`),
    aeronave=factor(`Aeronave`),
    calidad_dato= factor(`Calidad dato`)
  ) ##como hacer para eliminar las columnas viejas



glimpse(anac_2025)

summary(anac_2025)
glimpse(anac_2025)
 

#explorar aeropuertos

glimpse(aeropuertos)

#explorar clima 

glimpse(clima)






