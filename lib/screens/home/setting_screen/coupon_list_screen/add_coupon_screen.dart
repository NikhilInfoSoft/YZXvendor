import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:xyx_vendor/common/widget/app_droupdown_widget.dart';
import 'package:xyx_vendor/common/widget/app_edit_text_widget.dart';
import 'package:xyx_vendor/common/widget/app_scaffold.dart';
import 'package:xyx_vendor/controller/httpController.dart';
import 'package:xyx_vendor/controller/shared_data.dart';
import 'package:xyx_vendor/controller/url.dart';

class AddCouponScreen extends StatefulWidget {
  const AddCouponScreen({Key? key}) : super(key: key);

  @override
  _AddCouponScreenState createState() => _AddCouponScreenState();
}

class _AddCouponScreenState extends State<AddCouponScreen> {
  bool _progressVisible = false;
  String _type = 'Fixed Amount';
  String _options = 'Unlimited for all user';
  TextEditingController _name = TextEditingController();
  TextEditingController _discount = TextEditingController();
  TextEditingController _minOrder = TextEditingController();
  TextEditingController _expiration = TextEditingController();

  _create() async {
    try {
      var name = _name.text;
      var discount = _discount.text;
      var minOrder = _minOrder.text;
      var expire = _expiration.text;

      if (name == '' || discount == '' || minOrder == '' || expire == '') {
        Fluttertoast.showToast(msg: 'Please fill all the fields..!!');
        return;
      }

      expire = DateFormat('yyyy-mm-dd').format(
        DateFormat('dd/MM/yyyy').parse(expire),
      );
      setState(() {
        _progressVisible = true;
      });
      Map user = await SharedData().getUser();
      Map data = await HttpController().post(addCouponUrl, {
        'vendorId': user['id'].toString(),
        'vendorToken': user['token'].toString(),
        'couponName': name,
        'couponType': _type,
        'couponDiscount': discount,
        'couponMinimumOrder': minOrder,
        'couponExpired': expire,
        'couponOption': _options,
      });
      setState(() {
        _progressVisible = false;
      });

      if (data.isNotEmpty) {
        setState(() {
          _name.text = '';
          _discount.text = '';
          _minOrder.text = '';
          _expiration.text = '';
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      progress: _progressVisible,
      appBar: AppBar(
        title: Text(
          "Add Coupon",
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
            Container(
              padding: EdgeInsets.only(top: 15, bottom: 10),
              child: Text(
                "Voucher Name",
                style: TextStyle(
                  color: Color(0xff666666),
                  fontSize: 12,
                ),
              ),
            ),
            AppEditTextField(
              hintStyle: "Enter here ",
              controller: _name,
            ),
            Container(
              padding: EdgeInsets.only(top: 15, bottom: 10),
              child: Text(
                "Type",
                style: TextStyle(
                  color: Color(0xff666666),
                  fontSize: 12,
                ),
              ),
            ),
            AppDropDownWidget(
              hint: "Enter here ",
              list: ["Fixed Amount", "Percentage (%)"],
              changeChosen: (value) {
                setState(() {
                  _type = value;
                });
              },
            ),
            Container(
              padding: EdgeInsets.only(top: 15, bottom: 10),
              child: Text(
                "Discount",
                style: TextStyle(
                  color: Color(0xff666666),
                  fontSize: 12,
                ),
              ),
            ),
            AppEditTextField(
              hintStyle: "Enter here ",
              controller: _discount,
              keyboard: TextInputType.number,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 15, bottom: 10),
                        child: Text(
                          "Minimum Order",
                          style: TextStyle(
                            color: Color(0xff666666),
                            fontSize: 12,
                          ),
                        ),
                      ),
                      AppEditTextField(
                        hintStyle: "Enter here ",
                        controller: _minOrder,
                        keyboard: TextInputType.number,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 15, bottom: 10),
                        child: Text(
                          "Expiration",
                          style: TextStyle(
                            color: Color(0xff666666),
                            fontSize: 12,
                          ),
                        ),
                      ),
                      AppEditTextField(
                        hintStyle: "Enter here ",
                        controller: _expiration,
                        keyboard: TextInputType.number,
                        dateSelector: true,
                        onDateChange: (value) {
                          setState(() {
                            _expiration.text =
                                DateFormat('dd/MM/yyyy').format(value);
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 15, bottom: 10),
              child: Text(
                "Voucher options",
                style: TextStyle(
                  color: Color(0xff666666),
                  fontSize: 12,
                ),
              ),
            ),
            AppDropDownWidget(
              hint: "Unlimited for all user",
              list: [
                "Unlimited for all user",
                "Use only once",
                "Once per user",
                "Once for new user first order",
                "Custom limited per user"
              ],
              changeChosen: (value) {
                setState(() {
                  _options = value;
                });
              },
            ),
            Container(
              padding: EdgeInsets.only(top: 15, bottom: 10),
              child: Text(
                "Status",
                style: TextStyle(
                  color: Color(0xff666666),
                  fontSize: 12,
                ),
              ),
            ),
            AppDropDownWidget(
              hint: "Publish",
              list: ["Publish", "Un-Publish"],
            ),
            SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: _create,
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0xff523291),
                ),
                alignment: Alignment.center,
                child: Text(
                  "SAVE",
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
