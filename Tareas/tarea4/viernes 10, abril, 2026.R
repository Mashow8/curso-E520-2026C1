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
  filter(month == 1)

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









































































