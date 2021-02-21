import 'package:flutter/foundation.dart';

import 'dbmodel.dart';
import 'db.dart';
//import '../helpers/location_helper.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  Place findById(String id) {
    return _items.firstWhere((place) => place.id == id);
  }

  Future<void> addPlace(
    String number,
    String name,
    String type,
  ) async {
    // final address = await LocationHelper.getPlaceAddress(
    //     pickedLocation.latitude, pickedLocation.longitude);

    final newPlace = Place(
      id: DateTime.now().toString(),
      number: number,
      name: name,
      type: type,
    );
    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert('user_places', {
      'id': newPlace.id,
      'number': newPlace.number,
      'name': newPlace.name,
      'type': newPlace.type,
    });
  }

  Future<void> fetchAndSetPlaces() async {
    final dataList = await DBHelper.getData('user_places');
    _items = dataList
        .map(
          (item) => Place(
            id: item['id'],
            number: item['number'],
            name: item['name'],
            type: item['type'],
          ),
        )
        .toList();
    notifyListeners();
  }
}
