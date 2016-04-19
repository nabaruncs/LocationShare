var LOCATIONSHARE = LOCATIONSHARE || {};

$(function() {
  OPENLAYER.initMap();
  OPENLAYER.addMarker([45.8167, 15.9833]);
});

LOCATIONSHARE.PinLocations = {
  pin: function(locations) {
    for (location in locations) {
      OPENLAYER.addMarker(location)
    }
  }
};

OPENLAYER = {
  addMarker: function(location) {
    var map = L.map('map').setView(location, 10);
    var mbUrl = 'https://{s}.tiles.mapbox.com/v3/{id}/{z}/{x}/{y}.png';
    L.tileLayer(mbUrl, {id: 'examples.map-i875mjb7'}).addTo(map);
    var marker = L.marker(location).bindPopup("Zagreb").addTo(map);
  },

  initMap: function() {
    var iconFeature = new ol.Feature({
      geometry: new ol.geom.Point(ol.proj.transform([15.9833, 45.8167], 'EPSG:4326', 'EPSG:3857')),
      name: 'Zagreb',
    });

    var iconStyle = new ol.style.Style({
      image: new ol.style.Icon(/** @type {olx.style.IconOptions} */ ({
        anchor: [0.5, 46],
        anchorXUnits: 'fraction',
        anchorYUnits: 'pixels',
        opacity: 0.75,
        src: 'http://ol3js.org/en/master/examples/data/icon.png'
      }))
    });
    iconFeature.setStyle(iconStyle);

    var vectorSource = new ol.source.Vector({
      features: [iconFeature]
    });

    var vectorLayer = new ol.layer.Vector({
      source: vectorSource
    });

    var map = new ol.Map({
      target: document.getElementById('map'),
      layers: [
        new ol.layer.Tile({
          source: new ol.source.OSM()
        }),
        vectorLayer
      ],
      controls: ol.control.defaults(),
      view: new ol.View({
        center: ol.proj.transform([15.9833, 45.8167], 'EPSG:4326', 'EPSG:3857'),
        zoom: 10
      })
    });

    var element = document.getElementById('popup');
    var popup = new ol.Overlay({
      element: element,
      positioning: 'bottom-center',
      stopEvent: false
    });
    map.addOverlay(popup);

    map.on('click', function(evt) {
      var feature = map.forEachFeatureAtPixel(evt.pixel,
                                              function(feature, layer) {
                                                return feature;
                                              });
      if (feature) {
        var geometry = feature.getGeometry();
        var coord = geometry.$.get(url,
                                   values,
                                   function(data){

                                   }
                                  );Coordinates();
        popup.setPosition(coord);
        $(element).popover({
          'placement': 'top',
          'html': true,
          'content': feature.get('name')
        });
        $(element).popover('show');
      } else {
        $(element).popover('destroy');
      }
    });

    map.on('pointermove', function(e) {
      if (e.dragging) {
        $(element).popover('destroy');
        return;
      }

      var pixel = map.getEventPixel(e.originalEvent);
      var hit = map.hasFeatureAtPixel(pixel);
      map.getTarget().style.cursor = hit ? 'pointer' : '';
    });
  }
}
