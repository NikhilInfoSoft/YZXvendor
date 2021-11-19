import 'package:flutter/material.dart';
import 'package:xyx_vendor/screens/home/setting_screen/sponsored_screen/widget/plan_click_dialog.dart';

class InvoicesCardWidget extends StatefulWidget {
  const InvoicesCardWidget({Key? key}) : super(key: key);

  @override
  _InvoicesCardWidgetState createState() => _InvoicesCardWidgetState();
}

class _InvoicesCardWidgetState extends State<InvoicesCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 148,
      height: 122,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Basic",
            style: TextStyle(
              color: Color(0xff666666),
              fontSize: 14,
              fontFamily: "Inter",
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            "01-Aug-2021",
            style: TextStyle(
              color: Color(0xff666666),
              fontSize: 12,
              fontFamily: "Inter",
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            "599.00",
            style: TextStyle(
              color: Color(0xff252733),
              fontSize: 14,
              fontFamily: "Inter",
              fontWeight: FontWeight.w500,
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
                "PAY NOW",
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
