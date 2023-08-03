import 'package:flutter/material.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';

class ChooseMapPage extends StatefulWidget {
  const ChooseMapPage({super.key});

  @override
  State<ChooseMapPage> createState() => _ChooseMapPageState();
}

class _ChooseMapPageState extends State<ChooseMapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OpenStreetMapSearchAndPick(
        center: LatLong(-47, -54),
        buttonColor: Color(0xFF000670),
        buttonText: 'Pilih Lokasi',
        onPicked: (pickedData) {
          print(pickedData.latLong.latitude);
          print(pickedData.latLong.longitude);
          print(pickedData.address);
        },
      ),
    );
  }
}
