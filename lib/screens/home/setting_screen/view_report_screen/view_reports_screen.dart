import 'package:flutter/material.dart';
import 'package:xyx_vendor/common/widget/app_scaffold.dart';
import 'package:xyx_vendor/screens/home/order_screen/widget/order_item_widget.dart';

class ViewReportsScreen extends StatefulWidget {
  const ViewReportsScreen({Key? key}) : super(key: key);

  @override
  _ViewReportsScreenState createState() => _ViewReportsScreenState();
}

class _ViewReportsScreenState extends State<ViewReportsScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: Text(
          "View Reports",
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
          padding: EdgeInsets.all(20),
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: Color(0xffe7e7e7),
                      width: 1,
                    ),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Start Date",
                        style: TextStyle(
                          color: Color(0xff929292),
                          fontSize: 12,
                          fontFamily: "Mulish",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Image.asset(
                        "assets/icon/calendar.png",
                        height: 20,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: Color(0xffe7e7e7),
                      width: 1,
                    ),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "End Date",
                        style: TextStyle(
                          color: Color(0xff929292),
                          fontSize: 12,
                          fontFamily: "Mulish",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Image.asset(
                        "assets/icon/calendar.png",
                        height: 20,
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Color(0xfff7f3ff),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Column(
                      children: [
                        Text(
                          "280",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xff252733),
                            fontSize: 16,
                            fontFamily: "Mulish",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Total Orders",
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
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Color(0xfffff3f3),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Column(
                      children: [
                        Text(
                          "280",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xff252733),
                            fontSize: 16,
                            fontFamily: "Mulish",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Total Commission",
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
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "All Transactions",
              style: TextStyle(
                color: Color(0xff666666),
                fontSize: 14,
                fontFamily: "Inter",
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            itemWidget(),
            itemWidget(),
            itemWidget(),
            itemWidget(),
            itemWidget(),
            itemWidget(),
          ],
        ),
      ),
    );
  }

  Widget itemWidget() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Color(0xffe7e7e7),
          width: 1,
        ),
        color: Colors.white,
      ),
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(
                "#254682",
                style: TextStyle(
                  color: Color(0xff252733),
                  fontSize: 14,
                  fontFamily: "Mulish",
                  fontWeight: FontWeight.w700,
                ),
              ),
              Spacer(),
              pendingStatus(),
            ],
          ),
          Text(
            "01-Aug-2021, 11.25 AM",
            style: TextStyle(
              color: Color(0xff929292),
              fontSize: 12,
              fontFamily: "Mulish",
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "1050.00",
            style: TextStyle(
              color: Color(0xff523291),
              fontSize: 16,
              fontFamily: "Mulish",
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
    );
  }
}
