import 'package:device_native_features/providers/great_places.dart';
import 'package:device_native_features/screens/add_place_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
              Navigator.pushNamed(context, AddPlaceScreen.routeName);
            }
          )
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen:  false).fetchAndSetPlaces(),
        builder: (ctx, snapshot) => snapshot.connectionState == ConnectionState.waiting ? Center(child: CircularProgressIndicator(),) :
        Consumer<GreatPlaces>(
          builder: (ctx, greatPlace, ch){
            return greatPlace.items.length <= 0 ? ch :
            ListView.builder(
              itemCount: greatPlace.items.length,
              itemBuilder: (ctx, i) => ListTile(
                leading: CircleAvatar(
                  backgroundImage: FileImage(greatPlace.items[i].image),
                ),
                title: Text(greatPlace.items[i].title),
              )
            );
          },
          child: Center(
            child: Text('Got no Place yet, start adding some!'),
          ),
        ),
      ),
    );
  }
}
