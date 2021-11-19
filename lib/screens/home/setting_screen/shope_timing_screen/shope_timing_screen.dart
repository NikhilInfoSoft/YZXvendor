import 'package:flutter/material.dart';
import 'package:xyx_vendor/common/widget/app_scaffold.dart';

import 'widget/shop_timing_item_widget.dart';

class ShopTimingScreen extends StatefulWidget {
  const ShopTimingScreen({Key? key}) : super(key: key);

  @override
  _ShopTimingScreenState createState() => _ShopTimingScreenState();
}

class _ShopTimingScreenState extends State<ShopTimingScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: Text(
          "Shop Timings",
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
            ShopTimingItemWidget(),
            ShopTimingItemWidget(),

            SizedBox(height: 40,),
            Container(
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
          ],
        ),
      ),
    );
  }
}
