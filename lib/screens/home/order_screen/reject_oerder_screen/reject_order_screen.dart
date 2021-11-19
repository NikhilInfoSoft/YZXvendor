import 'package:flutter/material.dart';
import 'package:xyx_vendor/common/app_colors.dart';
import 'package:xyx_vendor/common/widget/app_scaffold.dart';

class RejectOrderScreen extends StatefulWidget {
  const RejectOrderScreen({Key? key}) : super(key: key);

  @override
  _RejectOrderScreenState createState() => _RejectOrderScreenState();
}

class _RejectOrderScreenState extends State<RejectOrderScreen> {
  String selectedRadio="";
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: Text(
          "Reject Order",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: "Inter",
            fontWeight: FontWeight.w600,
          ),
        )
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Please select reason for rejecting order",
              style: TextStyle(
                color: Color(0xff666666),
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Radio(
                  value: selectedRadio,
                  groupValue: "test",
                  activeColor: AppColors.primary,
                  onChanged: (value) {
                    setState(() {
                      selectedRadio = "test";
                    });
                  },
                ),
                Text(
                  "Store Closed",
                  style: TextStyle(
                    color: Color(0xff666666),
                    fontSize: 14,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Radio(
                  value: selectedRadio,
                  groupValue: "test1",
                  activeColor: AppColors.primary,
                  onChanged: (value) {
                    setState(() {
                      selectedRadio = "test1";
                    });
                  },
                ),
                Text(
                  "Item not Available",
                  style: TextStyle(
                    color: Color(0xff666666),
                    fontSize: 14,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Radio(
                  value: selectedRadio,
                  groupValue: "test2",
                  activeColor: AppColors.primary,
                  onChanged: (value) {
                    setState(() {
                      selectedRadio = "test2";
                    });
                  },
                ),
                Text(
                  "Client Informed",
                  style: TextStyle(
                    color: Color(0xff666666),
                    fontSize: 14,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xffe9e9eb),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Cancel",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff252733),
                        fontSize: 16,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xff523291),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "REJECT",
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
              ],
            )
          ],
        ),
      ),
    );
  }
}
