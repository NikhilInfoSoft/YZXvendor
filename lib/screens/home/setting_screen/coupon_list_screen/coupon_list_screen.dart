import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:xyx_vendor/common/widget/app_scaffold.dart';
import 'package:xyx_vendor/common/widget/menu_icon.dart';
import 'package:xyx_vendor/controller/httpController.dart';
import 'package:xyx_vendor/controller/shared_data.dart';
import 'package:xyx_vendor/controller/url.dart';

import 'add_coupon_screen.dart';

class CouponListScreen extends StatefulWidget {
  const CouponListScreen({Key? key}) : super(key: key);

  @override
  _CouponListScreenState createState() => _CouponListScreenState();
}

class _CouponListScreenState extends State<CouponListScreen> {
  bool _progressVisible = false;
  List _couponList = [];

  _data() async {
    try {
      _couponList.clear();
      setState(() {
        _progressVisible = true;
      });
      Map user = await SharedData().getUser();
      Map data = await HttpController().get(couponsListUrl, body: {
        'vendorId': user['id'].toString(),
        'vendorToken': user['token'].toString(),
      });
      setState(() {
        _progressVisible = false;
      });

      if (data.isNotEmpty) {
        _couponList = data['response'];
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _data();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      progress: _progressVisible,
      appBar: AppBar(
        title: Text(
          "Coupon List",
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
            ListView(
              shrinkWrap: true,
              children: List.generate(_couponList.length, (index) {
                return itemWidget(
                  _couponList[index]['couponName'].toString(),
                  _couponList[index]['couponMinimumOrder'].toString(),
                  _couponList[index]['couponExpired'].toString(),
                  _couponList[index]['couponDiscount'].toString(),
                );
              }),
            ),
            SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddCouponScreen(),
                  ),
                );
                _data();
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0xff523291),
                ),
                alignment: Alignment.center,
                child: Text(
                  "ADD NEW COUPON",
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
        ),
      ),
    );
  }

  Widget itemWidget(
    String name,
    String minOrder,
    String expire,
    String discount,
  ) {
    return Container(
      height: 94,
      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Color(0xffe7e7e7),
          width: 1,
        ),
        color: Colors.white,
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                name,
                style: TextStyle(
                  color: Color(0xff252733),
                  fontSize: 16,
                  fontFamily: "Mulish",
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                "Minimum order : ₹ $minOrder",
                style: TextStyle(
                  color: Color(0xff929292),
                  fontSize: 12,
                  fontFamily: "Mulish",
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Text(
                    "Exp Date : " +
                        DateFormat('dd MM yyyy').format(
                          DateTime.parse(expire),
                        ),
                    style: TextStyle(
                      color: Color(0xff929292),
                      fontSize: 12,
                      fontFamily: "Mulish",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(),
                  Text(
                    discount + "% OFF",
                    style: TextStyle(
                      color: Color(0xff523291),
                      fontSize: 16,
                      fontFamily: "Mulish",
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              )
            ],
          ),
          Positioned(
            right: 0,
            top: 10,
            child: ThreeDotWidget(),
          ),
        ],
      ),
    );
  }
}
