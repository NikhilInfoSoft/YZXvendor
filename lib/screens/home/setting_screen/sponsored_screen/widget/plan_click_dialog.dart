import 'package:flutter/material.dart';
import 'package:xyx_vendor/screens/home/setting_screen/sponsored_screen/payment_screen/payment_screen.dart';

class PlanClickDialog extends StatefulWidget {
  const PlanClickDialog({Key? key}) : super(key: key);

  @override
  _PlanClickDialogState createState() => _PlanClickDialogState();
}

class _PlanClickDialogState extends State<PlanClickDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Color(0xffe7e7e7),
          width: 1,
        ),
        color: Colors.white,
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20)
          .copyWith(bottom: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Purchase Plan",
            style: TextStyle(
              color: Color(0xff252733),
              fontSize: 20,
              fontFamily: "Mulish",
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Purchase with Balance in account, or Raise Request to Upgrade",
            style: TextStyle(
              color: Color(0xff252733),
              fontSize: 14,
              fontFamily: "Mulish",
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              //
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PaymentScreen(),
                ),
              );
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xff523291),
              ),
              alignment: Alignment.center,
              child: Text(
                "Purchase with Balance",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              //
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PaymentScreen(),
                ),
              );
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              alignment: Alignment.center,
              child: Text(
                "Raise Request to Upgrade",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff523291),
                  fontSize: 16,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
