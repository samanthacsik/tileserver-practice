ui <- fluidPage(
  
  tags$head(
    tags$script(src = "https://unpkg.com/leaflet.vectorgrid@latest/dist/Leaflet.VectorGrid.bundled.js")
  ),
  leafletOutput(outputId = "map_output")
  
)