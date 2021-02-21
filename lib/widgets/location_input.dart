import 'package:device_native_features/helpers/location_helper.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _previewImageUrl;

  Future<void> _getUserCurrentLocation() async{
    final locData = await Location().getLocation();
    final staticMapImageUrl = LocationHelper.generateLocationPreviewImage(
      latitude: locData.latitude,
      longitude: locData.longitude
    );

    setState(() {
      _previewImageUrl = staticMapImageUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey
            )
          ),
          child: _previewImageUrl == null ? Text("No location choosen yet", textAlign: TextAlign.center,) :
          Image.network(
            _previewImageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton.icon(
              onPressed: _getUserCurrentLocation,
              icon: Icon(Icons.location_on, size: 18,),
              label: Text("Current location"),
              textColor: Colors.blue,
            ),
            FlatButton.icon(
              onPressed: null,
              icon: Icon(Icons.map, size: 18,),
              label: Text("Select on Map"),
              textColor: Colors.blue,
            ),
          ],
        )
      ],
    );
  }
}
