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

