import 'package:flutter/material.dart';

class FlutterFormIcon extends StatelessWidget {
  const FlutterFormIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60.0),
      child: Center(
        // ignore: sized_box_for_whitespace
        child: Container(
            width: 200,
            height: 150,
            child: Image.asset('asset/flutter_logo.jpeg')),
      ),
    );
  }
}
