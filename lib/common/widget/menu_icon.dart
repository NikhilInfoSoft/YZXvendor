import 'package:flutter/material.dart';

class ThreeDotWidget extends StatefulWidget {
  const ThreeDotWidget({Key? key}) : super(key: key);

  @override
  _ThreeDotWidgetState createState() => _ThreeDotWidgetState();
}

class _ThreeDotWidgetState extends State<ThreeDotWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for(var index in [1,2,3])
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(0xffc4c4c4),
            ),
            margin: EdgeInsets.symmetric(vertical: 1),
            height: 5,
            width: 5,
          ),
        ],
      ),
    );
  }
}
