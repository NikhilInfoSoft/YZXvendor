import 'package:flutter/material.dart';
import 'package:xyx_vendor/common/widget/app_scaffold.dart';

class PayOutDetailsScreen extends StatefulWidget {
  const PayOutDetailsScreen({Key? key}) : super(key: key);

  @override
  _PayOutDetailsScreenState createState() => _PayOutDetailsScreenState();
}

class _PayOutDetailsScreenState extends State<PayOutDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: Text(
          "Payout Detail",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: "Inter",
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      child: Container(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          children: [
            Row(
              children: [
                Text(
                  "Payment Date",
                  style: TextStyle(
                    color: Color(0xff666666),
                    fontSize: 12,
                  ),
                ),
                Spacer(),
                Text(
                  "Status",
                  style: TextStyle(
                    color: Color(0xff666666),
                    fontSize: 12,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Text(
                  "01-Aug-2021, 11.25 AM",
                  style: TextStyle(
                    color: Color(0xff252733),
                    fontSize: 14,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w500,
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
            Container(
              padding: EdgeInsets.only(top: 25, bottom: 10),
              child: Text(
                "Payment Amount",
                style: TextStyle(
                  color: Color(0xff666666),
                  fontSize: 12,
                ),
              ),
            ),
            Text(
              "400",
              style: TextStyle(
                color: Color(0xff252733),
                fontSize: 14,
                fontFamily: "Inter",
                fontWeight: FontWeight.w700,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 25, bottom: 10),
              child: Text(
                "Payment Method",
                style: TextStyle(
                  color: Color(0xff666666),
                  fontSize: 12,
                ),
              ),
            ),
            Text(
              "UPI Payment",
              style: TextStyle(
                color: Color(0xff252733),
                fontSize: 14,
                fontFamily: "Inter",
                fontWeight: FontWeight.w500,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 25, bottom: 10),
              child: Text(
                "Admin Comments",
                style: TextStyle(
                  color: Color(0xff666666),
                  fontSize: 12,
                ),
              ),
            ),
            Text(
              "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.",
              style: TextStyle(
                color: Color(0xff252733),
                fontSize: 14,
                fontFamily: "Inter",
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
