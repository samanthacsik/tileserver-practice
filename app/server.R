server <- function(input, output){
  
  output$map_output <- renderLeaflet({
    
    leaflet() |> 
      addProviderTiles(providers$OpenStreetMap) |> 
      setView(lng = -98.5795, lat = 39.8283, zoom = 3)
    
})
  
}