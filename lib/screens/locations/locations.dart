import 'package:flutter/material.dart';
import '../../models/location.dart';
import '../../router.dart';

class Locations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final locations = Location.fetchAll();

    return Scaffold(
      appBar: AppBar(
        title: Text('Locations'),
      ),
      body: ListView(
        children: locations
            .map((location) =>
            GestureDetector(
                onTap: () => _onLocationTap(context, location.id),
                child: Container(child: Text(location.name))
            )).toList(),
      ),
    );
  }

  //Lo que indica la ruta de esta pantalla
  //LocationDetailRoute fue inicializada en app.dart como constante global
  //const LocationDetailRoute = '/location_detail';
  _onLocationTap(BuildContext context, int locationID) {
    Navigator.pushNamed(context, LocationDetailRoute,
        arguments: {"id": locationID});
  }
}