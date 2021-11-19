import 'package:flutter/material.dart';
import 'package:xyx_vendor/common/app_colors.dart';
import 'package:xyx_vendor/common/widget/menu_icon.dart';
import 'package:xyx_vendor/screens/authantication/splash_screen/splash_screen.dart';
import 'package:xyx_vendor/screens/home/product/add_product/add_product_acreen.dart';
import 'package:xyx_vendor/screens/home/product/add_product/add_product_form_acreen.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  bool isInStock = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerRight,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: Color(0xffe7e7e7),
                  width: 1,
                ),
                color: Colors.white,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 5),
                  Text(
                    "Sort by",
                    style: TextStyle(
                      color: Color(0xff929292),
                      fontSize: 12,
                      fontFamily: "Mulish",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 5),
                  Container(
                    child: Icon(Icons.arrow_drop_down),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Color(0xffe7e7e7),
                width: 1,
              ),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: FlutterLogo(size: 70),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Bread Toast",
                          style: TextStyle(
                            color: Color(0xff252733),
                            fontSize: 16,
                            fontFamily: "Mulish",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.share,
                            color: Color(0xffc4c4c4),
                          ),
                        ),
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ThreeDotWidget(),
                        ),
                      ],
                    ),
                    Text(
                      "110/-",
                      style: TextStyle(
                        color: Color(0xff252733),
                        fontSize: 12,
                        fontFamily: "Mulish",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "In Stock",
                          style: TextStyle(
                            color: Color(0xff00992a),
                            fontSize: 12,
                            fontFamily: "Mulish",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Spacer(),
                        Switch(
                          value: isInStock,
                          onChanged: (value) {
                            setState(() {
                              isInStock = !isInStock;
                            });
                          },
                          activeColor: AppColors.primary,
                        ),
                      ],
                    )
                  ],
                ))
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddProductFormScreen(),
                  ),
                );
              },
              child: widgetList['AddNewProductWidget'],
            ),
          ),
        ],
      ),
    );
  }
}
