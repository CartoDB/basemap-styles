# Mobile SDK Styles

Vector map style sources for mobile-sdk

Copyright CartoDB Inc, 2017

## Style editing

* Experimental: use https://github.com/CartoDB/mobile-style-editor mobile app for tablets (iPad or Android) to view and edit styles
* You can also edit CSS files within zip file with any text editor
* No web-based editor 
* Warning: good ol' CartoCSS editors like CARTO Builder or Mapbox Studio Classic etc **do not support** some mobile SDK extended parameters and will reject the CSS

## Using as custom style in app
* Android Java sample. For other platforms/languages the SDK API usage is same, and style package is same.

```java

 // 1. Create a style set from the file and style
 BinaryData styleAsset = AssetUtils.loadAsset("cartostyles-custom.zip");
 ZippedAssetPackage assetPackage = new ZippedAssetPackage(styleAsset);
 CompiledStyleSet styleSet = new CompiledStyleSet(assetPackage, "voyager");

 // 2. Create datasource and style decoder
 CartoOnlineTileDataSource source = new CartoOnlineTileDataSource("carto.streets");
 MBVectorTileDecoder decoder = new MBVectorTileDecoder(styleSet);
 VectorTileLayer mapLayer = new VectorTileLayer(source, decoder);

 // 3. Add the layer finally to your MapView
 mapView.getLayers().add(mapLayer);
```

## Updating bundled style in SDK

1. cleanup style files.
2. zip the folder
3. test the zip file with mobile SDK, as custom style
4. copy to https://github.com/CartoDB/mobile-sdk/tree/master/assets
5. generate assets using https://github.com/CartoDB/mobile-sdk/blob/master/scripts/generate-assets.sh script
6. recompile mobile SDK

## Updating style in server
1. Copy files to Azure Storage account, rewrite existing files. You may want to create snapshot and delete old ones to avoid garbage.
2. Clean Fastly CDN cache for all style assets. In style folder try this line
`find * -type f -exec curl -X PURGE -o /dev/null http://mobile-api.carto.com/styles/carto.streets/v1/{} \;`