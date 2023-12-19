library(leaflet)

# Загрузите ваш датасет
grocery_data <- read.csv("D:/University/DataAn/Test/Grocery_Stores.csv")

# Убедитесь, что ваши данные не содержат пропущенных значений
grocery_data <- na.omit(grocery_data)

# Создание карты
map <- leaflet(grocery_data) %>%
  addTiles() %>%  # Добавление базового слоя карты
  addMarkers(~Better_Long, ~Better_Lat, popup = ~Company)

# Отображение карты
map
