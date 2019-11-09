import 'package:flutter/material.dart';
import 'screens/locations/locations.dart';
import 'screens/location_detail/location_detail.dart';
import 'routing_constants.dart';
import 'undefined_view.dart';

const String LocationRoute = '/';
const String LocationDetailRoute = '/location_detail';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LocationRoute:
      return MaterialPageRoute(builder: (context) => Locations());
    case LocationDetailRoute:
      final Map<String, dynamic> arguments = settings.arguments;
      return MaterialPageRoute(builder: (context) => LocationDetail(arguments['id']));
    default:
      return MaterialPageRoute(builder: (context) => UndefinedView(name: settings.name));
  }
}