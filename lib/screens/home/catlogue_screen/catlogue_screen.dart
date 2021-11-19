import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xyx_vendor/common/widget/app_scaffold.dart';

import 'category_list_screen/category_list_screen.dart';
import 'product_list_screen/product_list_screen.dart';

class CatlogueScreen extends StatefulWidget {
  const CatlogueScreen({Key? key}) : super(key: key);

  @override
  _CatlogueScreenState createState() => _CatlogueScreenState();
}

class _CatlogueScreenState extends State<CatlogueScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: AppScaffold(
        appBar: AppBar(
          bottom: TabBar(
            indicatorColor: Color(0xffe1cefd),
            indicatorWeight: 4,
            labelStyle: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: "Inter",
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelStyle: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: "Inter",
              fontWeight: FontWeight.w600,
            ),
            tabs: [
              Tab(text: "Products"),
              Tab(text: "Categories"),
            ],
          ),
          title: Text(
            "Catalogue",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: "Inter",
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: FlutterLogo(size: 24),
            ),
          ],
        ),
        child: TabBarView(
          children: [
            ProductListScreen(),
            CategoryListScreen(),
          ],
        ),
      ),
    );
  }
}
