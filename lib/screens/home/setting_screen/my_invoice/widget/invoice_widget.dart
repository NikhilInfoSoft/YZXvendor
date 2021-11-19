import 'package:flutter/material.dart';

import '../invoice_detail_screen.dart';

class InvoiceWidget extends StatelessWidget {
  const InvoiceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => InvoiceDetailsScreen(),
          ),
        );
      },
      child: Container(
        height: 96,
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: Color(0xffe7e7e7),
            width: 1,
          ),
          color: Colors.white,
        ),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Text(
                  "Sponsored",
                  style: TextStyle(
                    color: Color(0xff666666),
                    fontSize: 14,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Spacer(),
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.asset(
                      "assets/icon/setting_icon/document-upload.png"),
                ),
              ],
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
            Row(
              children: [
                Text(
                  "599.00",
                  style: TextStyle(
                    color: Color(0xff252733),
                    fontSize: 14,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Spacer(),
                Container(
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
              ],
            )
          ],
        ),
      ),
    );
  }
}
