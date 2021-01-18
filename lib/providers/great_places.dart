import 'dart:io';

import 'package:device_native_features/helpers/db_helpers.dart';
import 'package:device_native_features/models/place.dart';
import 'package:flutter/material.dart';

class GreatPlaces extends ChangeNotifier{
  List<Place> _items = [];

  List<Place> get items{
    return _items;
  }

  void addPlace(String pickedTitle, File pickedImage) {
    final newPlace = Place(id: DateTime.now().toString(), title: pickedTitle, location: null, image: pickedImage);
    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert('user_places', {'id': newPlace.id, 'title': newPlace.title, 'image': newPlace.image.path});
  }

  Future<void> fetchAndSetPlaces() async{
    final dataList = await DBHelper.get('user_places');
    _items = dataList.map((e) => Place(id: e['id'], title: e['title'], location: null, image: File(e['image']))).toList();
    notifyListeners();
  }
}