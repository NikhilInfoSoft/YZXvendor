import 'package:flutter/material.dart';

class OrderShortingWidget extends StatelessWidget {
  final bool isSelected;
  final String text;

  const OrderShortingWidget(
      {Key? key, this.isSelected = false, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      margin: EdgeInsets.only(right: 10),
      alignment: Alignment.center,
      decoration: isSelected
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Color(0xff523291),
                width: 1,
              ),
              color: Color(0xff523291),
            )
          : BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Color(0xffe7e7e7),
                width: 1,
              ),
              color: Colors.white,
            ),
      padding: const EdgeInsets.only(top: 4, bottom: 5, left: 20, right: 20),
      child: Text(
        "$text",
        style: TextStyle(
          color: isSelected ? Colors.white : Color(0xff929292),
          fontSize: 12,
          fontFamily: "Mulish",
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
