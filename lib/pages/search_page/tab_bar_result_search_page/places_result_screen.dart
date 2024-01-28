import 'package:clone_instagram/data/data.dart';
import 'package:flutter/material.dart';

class PlacesResultScreen extends StatefulWidget {
  const PlacesResultScreen({super.key});

  @override
  State<PlacesResultScreen> createState() => _PlacesResultScreenState();
}

class _PlacesResultScreenState extends State<PlacesResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.separated(
        itemCount: DataPlaces.listPlaces.length,
        itemBuilder: (context, index) {
          return _itemPlace(DataPlaces.listPlaces[index]);
        },
        separatorBuilder: (context, index) {
          return const Divider(
            height: 16.0,
            color: Colors.transparent,
          );
        },
      ),
    );
  }

  Widget _itemPlace(String place) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(16.0),
          margin: const EdgeInsets.only(right: 16.0),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
              shape: BoxShape.circle
          ),
          child: const Icon(
            Icons.place_outlined,
            color: Colors.black,
            size: 28,
          ),
        ),
        Expanded(
            child: Text(
              place,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500
              ),
            )
        ),
      ],
    );
  }
}
