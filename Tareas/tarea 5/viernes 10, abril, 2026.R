install.packages("nycflights13")
options(repos = c(CRAN = "https://cloud.r-project.org"))
install.packages("nycflights13")

#cargar librerias
library(tidyverse)
library(nycflights13)

#vemos estructura de datos en flights
flights
glimpse("flights")

flights$year
flights[[1]]

flights[duplicated(flights), ]

airports
planes
airlines
weather

# buscamos los vuelos en flights cuyo destino es IAH
flights |>
  filter(dest == "IAH") |> 
  group_by(year, month, day) |> 
  summarize(
    arr_delay = mean(arr_delay, na.rm = TRUE)
      )

# Flights that departed on January 1
flights |> 
  filter(month == 1 & day == 1)

flights |> 
  filter(dep_delay > 120)

library(tidyverse)
library(nycflights13)

R.version.string

library(dplyr)
dplyr::filter(flights, dep_delay > 120)

flights |> 
  filter(month == 1 & day == 1)

flights |> 
  filter(month == 1 | month == 2)

flights |> 
  filter(month %in% c(1, 2))

jan1 <- flights |> 
  filter(month == 1 & day == 1)

flights |> 
  filter(month = 1)

flights |>
  filter(month == 1 & day == 1)

flights |> 
  filter(month == 1 | 2)

flights |> 
  arrange(year, month, day, dep_time)

flights |> 
  arrange(desc(dep_delay))

flights |> 
  distinct()

flights |> 
  distinct(origin, dest)

flights |> 
  distinct(origin, dest, .keep_all = TRUE)

flights |>
  count(origin, dest, sort = TRUE)

planes |> 
  count(tailnum) |> 
  filter(n > 1)

weather |> 
  count(time_hour, origin) |> 
  filter(n > 1)

planes |> 
  filter(is.na(tailnum))

weather |> 
  filter(is.na(time_hour) | is.na(origin))

flights |> 
  count(time_hour, carrier, flight) |> 
  filter(n > 1)

airports |>
  count(alt, lat) |> 
  filter(n > 1)

flights2 <- flights |> 
  mutate(id = row_number(), .before = 1)

top_dest <- flights2 |>
  count(dest, sort = TRUE) |>
  head(10)

airports |>
  semi_join(flights, join_by(faa == dest)) |>
  ggplot(aes(x = lon, y = lat)) +
  borders("state") +
  geom_point() +
  coord_quickmap()

x <- tribble(
  ~key, ~val_x,
  1, "x1",
  2, "x2",
  3, "x3"
)
y <- tribble(
  ~key, ~val_y,
  1, "y1",
  2, "y2",
  4, "y3"
)


anac_2020 <-
  read_csv2(
    file = 'Tareas/tarea 4/202012-informe-ministerio-actualizado-dic-final.csv')

anac_2021 <-
  read_csv2(
    file = 'Tareas/tarea 4/202112-informe-ministerio-actualizado-dic-final.csv')

anac_2022 <-
  read_csv2(
    file = 'Tareas/tarea 4/202212-informe-ministerio-actualizado-dic-final.csv')

anac_2023 <-
  read_csv2(
    file = 'Tareas/tarea 4/202312-informe-ministerio-actualizado-dic.csv')

anac_2024 <-
  read_csv2(
    file = 'Tareas/tarea 4/202412-informe-ministerio-actualizado-dic-final.csv')

anac_2025 <-
  read_csv2(
    file = 'Tareas/tarea 4/202512-informe-ministerio-actualizado-dic-final.csv')

library(dplyr)

glimpse(anac_total)
anac_total <- bind_rows(
  anac_2020,
  anac_2021,
  anac_2022,
  anac_2023,
  anac_2024,
  anac_2025
)

library(dplyr)
library(lubridate)

anac_total <- anac_total |>
  mutate(
    fecha = dmy(`Fecha UTC`),
    año = year(fecha),
    mes = month(fecha)
  )

#1_pregunta

mensual <- anac_total |>
  group_by(año, mes) |>
  summarise(pasajeros = sum(Pasajeros, na.rm = TRUE)) |>
  ungroup()

mensual <- mensual |>
  mutate(fecha = as.Date(paste(año, mes, "01", sep = "-")))

library(ggplot2)

ggplot(mensual, aes(x = fecha, y = pasajeros)) +
  geom_line() +
  labs(title = "Tráfico aéreo mensual (2019–2025)")

#Que observamos en la pandemia?

mensual |>
  filter(año %in% c(2019, 2020, 2021))
#podemos revisar aqui y en el grafico como en el 2020 que fue el pico de la enfermedad hay muchisimo menos vuelos de lo normal y hay una caida 
#gigante podria ser por todas las restricciones que habia en ese tiempo y por ende una vez que filtramos los anos de la pandemia se ve que hay 
#menos personas tomando vuelos.



#2_pregunta

pre_pandemia <- mensual |>
  filter(año == 2019) |>
  summarise(prom = mean(pasajeros)) |>
  pull(prom)

mensual <- mensual |>
  mutate(recuperado = pasajeros >= pre_pandemia)

mensual |>
  filter(recuperado == TRUE)
#aca igual podemos ver que alrededor de 2023 hacia adelante se ve un incremento gradual y todo se ve por la quita de restricciones a nivel global
#tardaria alrededor de 2-3 anos para recuperarse

#3_pregunta

tipo_vuelo <- anac_total |>
  group_by(año, `Clasificación Vuelo`) |>
  summarise(pasajeros = sum(Pasajeros, na.rm = TRUE)) |>
  group_by(año) |>
  mutate(prop = pasajeros / sum(pasajeros))

ggplot(tipo_vuelo, aes(x = año, y = prop, fill = `Clasificación Vuelo`)) +
  geom_col()


#hasta aqui vemos que lo domestico domina prepandemia, cae en 2023 pero va subiendo y aun asi pasados los anos no vuelve lo internacional al mismo
#nivel que antes y va en incremento los internacionales ya que los domesticos dominan

aerolineas <- anac_total |>
  group_by(año, `Aerolinea Nombre`) |>
  summarise(pasajeros = sum(Pasajeros, na.rm = TRUE))

destinos <- anac_total |>
  group_by(año, `Origen / Destino`) |>
  summarise(pasajeros = sum(Pasajeros, na.rm = TRUE))








































