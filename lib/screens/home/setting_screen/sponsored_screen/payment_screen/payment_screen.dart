import 'package:flutter/material.dart';
import 'package:xyx_vendor/common/widget/app_edit_text_widget.dart';
import 'package:xyx_vendor/common/widget/app_scaffold.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: Text(
          "Payment",
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
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              color: Color(0xfff9f5ff),
              child: Row(
                children: [
                  Text(
                    "Featured Plan",
                    style: TextStyle(
                      color: Color(0xff252733),
                      fontSize: 14,
                      fontFamily: "Mulish",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "599/-",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xff252733),
                      fontSize: 14,
                      fontFamily: "Mulish",
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 15, bottom: 10),
                    child: Text(
                      "Card Number",
                      style: TextStyle(
                        color: Color(0xff666666),
                        fontSize: 12,
                      ),
                    ),
                  ),
                  AppEditTextField(
                    hintStyle: "Enter here",
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 15, bottom: 10),
                              child: Text(
                                "Expiry Date",
                                style: TextStyle(
                                  color: Color(0xff666666),
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            AppEditTextField(
                              hintStyle: "MM/YY",
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 15, bottom: 10),
                              child: Text(
                                "CVV",
                                style: TextStyle(
                                  color: Color(0xff666666),
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            AppEditTextField(
                              hintStyle: "Enter here",
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15, bottom: 10),
                    child: Text(
                      "Card Holder Name",
                      style: TextStyle(
                        color: Color(0xff666666),
                        fontSize: 12,
                      ),
                    ),
                  ),
                  AppEditTextField(
                    hintStyle: "Enter here",
                  ),
                  SizedBox(height: 30),
                  Container(
                    width: 312,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xff523291),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "PAY NOW",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  Text(
                    "Subscription/Featured Upgrade Successful",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff00992a),
                      fontSize: 16,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 50),
                  Center(
                    child: Text(
                      "Payment Failed",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xffde0000),
                        fontSize: 14,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Text(
                      "Click to try again",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff523291),
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
