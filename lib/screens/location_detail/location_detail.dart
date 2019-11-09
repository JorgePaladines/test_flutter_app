import 'package:flutter/material.dart';
import 'image_banner.dart';
import 'text_section.dart';
import '../../models/location.dart';


class LocationDetail extends StatelessWidget{
  final int _locationID;

  LocationDetail(this._locationID);

  @override
  Widget build(BuildContext context){
    final location = Location.fetchByID(_locationID);

    return Scaffold(
      appBar: AppBar(
        title: Text(location.name),
      ),
      /*
      Desde LayoutBuilder hasta antes de Column, todos esos Widgets son para que si el contenido no cabe dentro
      de la pantalla del dispositivo, pueda hacerse scroll para mostrar lo que no alcanza
      */
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints){
          return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[ImageBanner(location.imagePath),
                    ]..addAll(textSections(location))
                ),
              ),
          );
        },
      )
    );
  }

  List<Widget> textSections(Location location) {
    return location.facts
        .map((fact) => TextSection(fact.title, fact.text))
        .toList();
  }
}