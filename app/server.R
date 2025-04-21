server <- function(input, output){

  # server.R
  output$map_output <- renderLeaflet({
    leaflet() %>%
      addTiles() %>%
      htmlwidgets::onRender("
      function(el, x) {
        var map = this;
        
        // Check if VectorGrid is available
        if (typeof L.vectorGrid === 'undefined') {
          console.error('VectorGrid plugin not loaded');
          return;
        }
        
        // Create the vector grid layer
        var pbfLayer = L.vectorGrid.protobuf('http://localhost:3000/data/usa_low/{z}/{x}/{y}.pbf', {
          vectorTileLayerStyles: {
            blocks: {
              weight: 1,
              color: '#007AFF',
              opacity: 0.6,
              fill: true,
              fillColor: '#007AFF',
              fillOpacity: 0.6
            }
          },
          interactive: true,
          rendererFactory: L.canvas.tile
        }).addTo(map);
      }
    ") %>%
      setView(lng = -98.5795, lat = 39.8283, zoom = 5)
  })  


}