import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final  String value;
  final String name;

  const CardWidget({Key? key, required this.value, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.43,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: Color(0xffe7e7e7),
          width: 1,
        ),
        color: Colors.white,
      ),
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: [
          Text(
            "$value",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xff523291),
              fontSize: 14,
              fontFamily: "Inter",
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "$name",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xff666666),
              fontSize: 14,
              fontFamily: "Inter",
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
