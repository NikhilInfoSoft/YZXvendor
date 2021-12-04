import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:xyx_vendor/common/widget/app_droupdown_widget.dart';
import 'package:xyx_vendor/common/widget/app_edit_text_widget.dart';
import 'package:xyx_vendor/common/widget/app_scaffold.dart';
import 'package:xyx_vendor/controller/httpController.dart';
import 'package:xyx_vendor/controller/shared_data.dart';
import 'package:xyx_vendor/controller/url.dart';
import 'package:http/http.dart' as http;

class RequestPayOutScreen extends StatefulWidget {
  const RequestPayOutScreen({Key? key}) : super(key: key);

  @override
  _RequestPayOutScreenState createState() => _RequestPayOutScreenState();
}

class _RequestPayOutScreenState extends State<RequestPayOutScreen> {
  bool _progressVisible = false;
  TextEditingController _amountController = TextEditingController();
  TextEditingController _commissionController = TextEditingController();
  List<String> paymentList = ["HDFC Bank", "jonxyz@hdfc.com"];
  String paymentMethod = '';
  _createPayout() async {
    try {
      var amount = _amountController.text;
      var commission = _commissionController.text;

      if (amount == '' || commission == '' || paymentMethod == '') {
        Fluttertoast.showToast(msg: 'Please fill all the fields..!!');
        return;
      }

      setState(() {
        _progressVisible = true;
      });
      Map user = await SharedData().getUser();
      // http.Response res= await http.post(Uri.parse(getVendorPayoutUrl),body: {
      //   'token': '\$2y\$10\$r.vc8Xw4WmAMXnB0uX3uo.mjqqAiJzKmZgYmxEkHxcY7CWau.HGuu',
      //   'vendorId': user['id'].toString(),
      //   'requestAmount': amount,
      //   'totalCommission': commission,
      //   'paymentMethod': paymentMethod,
      // });
      Map data = await HttpController().post(getVendorPayoutUrl, {
        'token':
            '\$2y\$10\$r.vc8Xw4WmAMXnB0uX3uo.mjqqAiJzKmZgYmxEkHxcY7CWau.HGuu',
        'vendorId': user['id'].toString(),
        'requestAmount': amount,
        'totalCommission': commission,
        'paymentMethod': paymentMethod,
      });

      setState(() {
        _progressVisible = false;
      });
      // Map data = json.decode(res.body);
      print(data);
// print(json.decode(res.body));
      if (data.isNotEmpty) {
        _amountController.text = '';
        _commissionController.text = '';
        paymentMethod = '';
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    paymentMethod = paymentList[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      progress: _progressVisible,
      appBar: AppBar(
        title: Text(
          "Request Payout",
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
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          shrinkWrap: true,
          children: [
            Row(
              children: [
                Text(
                  "Available Balance",
                  style: TextStyle(
                    color: Color(0xff252733),
                    fontSize: 14,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Spacer(),
                Text(
                  "497.05",
                  style: TextStyle(
                    color: Color(0xff252733),
                    fontSize: 20,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
            Container(
              child: Text(
                "Enter Amount",
                style: TextStyle(
                  color: Color(0xff666666),
                  fontSize: 12,
                ),
              ),
              padding: EdgeInsets.only(top: 15, bottom: 10),
            ),
            AppEditTextField(
              controller: _amountController,
              hintStyle: "400",
            ),
            Container(
              child: Text(
                "Enter Commission Amount",
                style: TextStyle(
                  color: Color(0xff666666),
                  fontSize: 12,
                ),
              ),
              padding: EdgeInsets.only(top: 15, bottom: 10),
            ),
            AppEditTextField(
              controller: _commissionController,
              hintStyle: "40",
            ),
            Container(
              child: Text(
                "Payment Method",
                style: TextStyle(
                  color: Color(0xff666666),
                  fontSize: 12,
                ),
              ),
              padding: EdgeInsets.only(top: 15, bottom: 10),
            ),
            AppDropDownWidget(
              changeChosen: (choosenPaymentMethod) {
                setState(() {
                  paymentMethod = choosenPaymentMethod;
                });
              },
              list: paymentList,
              hint: "Select",
            ),
            SizedBox(
              height: 60,
            ),
            GestureDetector(
              onTap: _createPayout,
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0xff523291),
                ),
                alignment: Alignment.center,
                child: Text(
                  "REQUEST PAYOUT",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
