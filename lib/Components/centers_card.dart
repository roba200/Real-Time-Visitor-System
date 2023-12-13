import 'package:flutter/material.dart';

class CentersCard extends StatelessWidget {
  final String centerImage;
  final String title;

  const CentersCard(
      {super.key, required this.centerImage, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            color: Colors.red,
            child: Image.asset('assets/images/sample.png'),
            height: 100,
            width: 100,
          ),
          Text("fdsfd"),
          Text("fddggfdggggggggggg")
        ],
      ),
    );
  }
}
