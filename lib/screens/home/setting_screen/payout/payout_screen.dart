import 'package:flutter/material.dart';
import 'package:xyx_vendor/common/widget/app_scaffold.dart';
import 'package:xyx_vendor/screens/home/setting_screen/payout/request_payout_screen.dart';

import 'widget/payout_item_widget.dart';

class PayOutScreen extends StatefulWidget {
  const PayOutScreen({Key? key}) : super(key: key);

  @override
  _PayOutScreenState createState() => _PayOutScreenState();
}

class _PayOutScreenState extends State<PayOutScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Payout",
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
          children: [
            Stack(
              children: [
                Container(
                  height: 100,
                  margin: EdgeInsets.only(bottom: 40),
                  decoration: BoxDecoration(
                    color: Color(0xff523291),
                  ),
                ),
                Positioned(
                  bottom: 15,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 105,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xfff8f5ff),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/icon/empty-wallet.png",
                          height: 50,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "My Balance",
                              style: TextStyle(
                                color: Color(0xff252733),
                                fontSize: 14,
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 12),
                            Text(
                              "497.05",
                              style: TextStyle(
                                color: Color(0xff252733),
                                fontSize: 20,
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 35,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RequestPayOutScreen(),
                        ),
                      );
                    },
                    child: Container(
                      height: 36,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xff523291),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      alignment: Alignment.center,
                      child: Text(
                        "REQUEST PAYOUT",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "All Payout Transactions",
                    style: TextStyle(
                      color: Color(0xff666666),
                      fontSize: 14,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  PayoutItemWidget(),
                  PayoutItemWidget(),
                  PayoutItemWidget(),
                  PayoutItemWidget(),
                  PayoutItemWidget(),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Color(0xffe7e7e7),
                        width: 1,
                      ),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                                color: Color(0xffde0000).withOpacity(0.2),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Text(
                                "Reject",
                                style: TextStyle(
                                  color: Color(0xffde0000),
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
                          "150.00",
                          style: TextStyle(
                            color: Color(0xffde0000),
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
