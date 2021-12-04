import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:xyx_vendor/common/widget/app_scaffold.dart';
import 'package:xyx_vendor/controller/httpController.dart';
import 'package:xyx_vendor/controller/shared_data.dart';
import 'package:xyx_vendor/controller/url.dart';

class InvoiceDetailsScreen extends StatefulWidget {
  const InvoiceDetailsScreen({Key? key, this.invoiceNumber}) : super(key: key);
  final String? invoiceNumber;
  @override
  _InvoiceDetailsScreenState createState() => _InvoiceDetailsScreenState();
}

class _InvoiceDetailsScreenState extends State<InvoiceDetailsScreen> {
  bool _progressVisible = false;
  Map invoiceDetail = {};

  getInvoiceDetail(String invoiceNumber) async {
    print(invoiceNumber);
    try {
      setState(() {
        _progressVisible = true;
      });
      Map user = await SharedData().getUser();
      Map data = await HttpController().post(getVendorInvoiceDetail, {
        'vendorId': user['id'].toString(),
        'vendorToken': user['token'].toString(),
        'invoiceNumber': invoiceNumber,
      });
     
      if (data.isNotEmpty) {
        print(data);
        if (data['response'] != null) {
          invoiceDetail = data['response'][0];
        }
      }
      setState(() {
        _progressVisible = false;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    if (widget.invoiceNumber != null) {
      getInvoiceDetail(widget.invoiceNumber!);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(invoiceDetail);
    return AppScaffold(
      progress: _progressVisible,
      appBar: AppBar(
        title: Text(
          "My Invoices Detail",
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
              color: Color(0xfff9f5ff),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              alignment: Alignment.center,
              child: Text(
                "Invoice No. : ${invoiceDetail['invoiceNumber']}",
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xff252733),
                  fontSize: 12,
                  fontFamily: "Mulish",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20)
                  .copyWith(bottom: 10),
              child: Text(
                "Invoice items",
                style: TextStyle(
                  color: Color(0xff929292),
                  fontSize: 12,
                  fontFamily: "Mulish",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Sponsored Plan",
                        style: TextStyle(
                          color: Color(0xff252733),
                          fontSize: 14,
                          fontFamily: "Mulish",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "780.00",
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
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "05/08/2021, 02:20 PM",
                    style: TextStyle(
                      color: Color(0xff929292),
                      fontSize: 12,
                      fontFamily: "Mulish",
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Domain Registration",
                        style: TextStyle(
                          color: Color(0xff252733),
                          fontSize: 14,
                          fontFamily: "Mulish",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "699.00",
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
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "05/08/2021, 02:20 PM",
                    style: TextStyle(
                      color: Color(0xff929292),
                      fontSize: 12,
                      fontFamily: "Mulish",
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Container(
              height: 152,
              color: Color(0xfffafafa),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Text(
                        "Order Total",
                        style: TextStyle(
                          color: Color(0xff252733),
                          fontSize: 14,
                          fontFamily: "Mulish",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "780.00",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xff252733),
                          fontSize: 14,
                          fontFamily: "Mulish",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Order Total",
                        style: TextStyle(
                          color: Color(0xff252733),
                          fontSize: 14,
                          fontFamily: "Mulish",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "780.00",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xff252733),
                          fontSize: 14,
                          fontFamily: "Mulish",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Order Total",
                        style: TextStyle(
                          color: Color(0xff252733),
                          fontSize: 14,
                          fontFamily: "Mulish",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "780.00",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xff252733),
                          fontSize: 14,
                          fontFamily: "Mulish",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  Row(
                    children: [
                      Text(
                        "Order Total",
                        style: TextStyle(
                          color: Color(0xff252733),
                          fontSize: 14,
                          fontFamily: "Mulish",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "880.00",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xff252733),
                          fontSize: 16,
                          fontFamily: "Mulish",
                          fontWeight: FontWeight.w800,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xff523291),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 20),
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
          ],
        ),
      ),
    );
  }
}
