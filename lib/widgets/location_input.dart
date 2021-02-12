import 'package:flutter/material.dart';

class LocationInput extends StatefulWidget {
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _previewImageUrl;

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
              onPressed: null,
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
