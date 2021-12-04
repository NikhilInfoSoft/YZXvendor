import 'package:flutter/material.dart';

import 'plan_click_dialog.dart';

class PlanCardWidget extends StatefulWidget {
  const PlanCardWidget({Key? key,this.data}) : super(key: key);
final Map? data;
  @override
  _PlanCardWidgetState createState() => _PlanCardWidgetState();
}

class _PlanCardWidgetState extends State<PlanCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 148,
      height: 197,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: Color(0xffe7e7e7),
          width: 1,
        ),
        color: Colors.white,
      ),
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 148,
            height: 58,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4),
                topRight: Radius.circular(4),
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xffcf198c),
                  Color(0xff602f90),
                  Color(0xff523291)
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Sponsored Plan',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 12,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '${widget.data!['price'].toString()}.00',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Text(
            widget.data!['description'],
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xff666666),
              fontSize: 12,
            ),
          ),
          GestureDetector(
            onTap: () {
              openDialog();
            },
            child: Container(
              width: 73,
              height: 24,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Color(0xff523291),
              ),
              alignment: Alignment.center,
              child: Text(
                "BUY NOW",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void openDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            child: PlanClickDialog(),
          );
        });
  }
}
