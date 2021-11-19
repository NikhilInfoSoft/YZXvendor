import 'package:flutter/material.dart';
import 'package:xyx_vendor/screens/home/setting_screen/payout/payout_details_screen.dart';

class PayoutItemWidget extends StatelessWidget {
  const PayoutItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PayOutDetailsScreen(),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Color(0xffe7e7e7),
            width: 1,
          ),
          color: Colors.white,
        ),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: EdgeInsets.symmetric(vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text(
                  "01-Aug-2021, 11.25 AM",
                  style: TextStyle(
                    color: Color(0xff929292),
                    fontSize: 12,
                    fontFamily: "Mulish",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Spacer(),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Color(0xff00992a).withOpacity(0.2),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Text(
                    "Approved",
                    style: TextStyle(
                      color: Color(0xff00992a),
                      fontSize: 12,
                      fontFamily: "Mulish",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "1050.00",
              style: TextStyle(
                color: Color(0xff00992a),
                fontSize: 16,
                fontFamily: "Mulish",
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
