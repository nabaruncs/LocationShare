$(function() {
  OPENLAYER.initMap();
});

OPENLAYER = {
  initMap: function() {
    var vectorSource = new ol.source.Vector({
      //create empty vector
    });

    var locations = $('.map').data('location');
    for (var i=0; i < locations.length; i++){
      var latitude = locations[i][0];
      var longitude = locations[i][1];

      var iconFeature = new ol.Feature({
        geometry: new
        ol.geom.Point(ol.proj.transform([longitude, latitude], 'EPSG:4326',   'EPSG:3857')),
        name: 'Location ' + i
        });
        
        vectorSource.addFeature(iconFeature);
    }

    var iconStyle = new ol.style.Style({
      image: new ol.style.Icon(({
        anchor: [0.5, 46],
        anchorXUnits: 'fraction',
        anchorYUnits: 'pixels',
        opacity: 0.75,
        src: 'http://openlayers.org/en/v3.9.0/examples/data/icon.png'
      }))
    });

    var vectorLayer = new ol.layer.Vector({
      source: vectorSource,
      style: iconStyle
    });

    var map = new ol.Map({
      layers: [new ol.layer.Tile({ source: new ol.source.OSM() }), vectorLayer],
      target: document.getElementById('map'),
      view: new ol.View({
        center: [0, 0],
        zoom: 3
      })
    });
  }
}
