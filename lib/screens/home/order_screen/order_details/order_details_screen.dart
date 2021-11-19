import 'package:flutter/material.dart';
import 'package:xyx_vendor/common/widget/app_scaffold.dart';
import 'package:xyx_vendor/screens/home/order_screen/assign_driver_screen/assign_driver_screen.dart';
import 'package:xyx_vendor/screens/home/order_screen/reject_oerder_screen/reject_order_screen.dart';
import 'package:xyx_vendor/screens/home/order_screen/widget/order_item_widget.dart';

class OrderDetailsScreen extends StatelessWidget {
  final OrderStatus orderStatus;

  const OrderDetailsScreen({Key? key, required this.orderStatus})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _OrderDetailsDesign();
  }
}

class _OrderDetailsDesign extends StatefulWidget {
  const _OrderDetailsDesign({Key? key}) : super(key: key);

  @override
  _OrderDetailsDesignState createState() => _OrderDetailsDesignState();
}

class _OrderDetailsDesignState extends State<_OrderDetailsDesign> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: Text(
          "Orders Detail",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: "Inter",
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            margin: EdgeInsets.only(right: 10),
            child: Image.asset("assets/icon/printer.png"),
          ),
        ],
      ),
      child: Container(
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              color: Color(0xffff9900).withOpacity(0.1),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  Text(
                    "Pending",
                    style: TextStyle(
                      color: Color(0xffff9900),
                      fontSize: 14,
                      fontFamily: "Mulish",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "Order No. : #254682",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xff252733),
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
              color: Color(0xfff9f5ff),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Order Type",
                    style: TextStyle(
                      color: Color(0xff252733),
                      fontSize: 12,
                      fontFamily: "Mulish",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Delivery",
                    style: TextStyle(
                      color: Color(0xff523291),
                      fontSize: 16,
                      fontFamily: "Mulish",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Color(0xfffafafa),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Color(0xffe7e7e7),
                        width: 1,
                      ),
                    ),
                    child: FlutterLogo(size: 40),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Jacob Jones",
                        style: TextStyle(
                          color: Color(0xff252733),
                          fontSize: 14,
                          fontFamily: "Mulish",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "05/08/2021, 02:20 PM",
                        style: TextStyle(
                          color: Color(0xff929292),
                          fontSize: 12,
                          fontFamily: "Mulish",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(
                            "Mob No.  : +91 1234567897",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Color(0xff252733),
                              fontSize: 12,
                              fontFamily: "Mulish",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Spacer(),
                          Container(
                            height: 24,
                            width: 24,
                            child: Image.asset("assets/icon/call.png"),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      RichText(
                        text: TextSpan(
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "Mulish",
                                fontWeight: FontWeight.w600,
                                color: Color(0xff929292)),
                            children: [
                              TextSpan(text: "Order Source: "),
                              TextSpan(
                                text: "User App",
                                style: TextStyle(color: Color(0xff252733)),
                              ),
                            ]),
                      ),
                    ],
                  ))
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Order Items",
                    style: TextStyle(
                      color: Color(0xff252733),
                      fontSize: 12,
                      fontFamily: "Mulish",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        "Food Item",
                        style: TextStyle(
                          color: Color(0xff252733),
                          fontSize: 14,
                          fontFamily: "Mulish",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "80.00",
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
                  Divider(
                    height: 1,
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "Grocery Item",
                        style: TextStyle(
                          color: Color(0xff252733),
                          fontSize: 14,
                          fontFamily: "Mulish",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "210.00",
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
                    "1 Ltr",
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
                  Divider(
                    height: 1,
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "Ecommerce Item",
                        style: TextStyle(
                          color: Color(0xff252733),
                          fontSize: 14,
                          fontFamily: "Mulish",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "390.00",
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
                    "Size - M                Color - Blue",
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
                  Divider(
                    height: 1,
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "Pharmacy Item",
                        style: TextStyle(
                          color: Color(0xff252733),
                          fontSize: 14,
                          fontFamily: "Mulish",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "100.00",
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
                    height: 15,
                  ),
                  Container(
                    width: 211,
                    height: 286,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Color(0xffe7e7e7),
                        width: 1,
                      ),
                    ),
                    child: Image.asset("assets/icon/bill.png"),
                  ),
                ],
              ),
            ),
            Container(
              color: Color(0xfffafafa),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Delivery to",
                    style: TextStyle(
                      color: Color(0xff252733),
                      fontSize: 12,
                      fontFamily: "Mulish",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Jacob Jones",
                    style: TextStyle(
                      color: Color(0xff252733),
                      fontSize: 16,
                      fontFamily: "Mulish",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "4517 Washington Ave. Manchester, Kentucky 39495",
                    style: TextStyle(
                      color: Color(0xff929292),
                      fontSize: 12,
                      fontFamily: "Mulish",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              color: Color(0xfffafafa),
              child: Column(
                mainAxisSize: MainAxisSize.min,
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
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "Taxes & Charges",
                        style: TextStyle(
                          color: Color(0xff252733),
                          fontSize: 14,
                          fontFamily: "Mulish",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "80.00",
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
                  Row(
                    children: [
                      Text(
                        "Delivery Charges",
                        style: TextStyle(
                          color: Color(0xff252733),
                          fontSize: 14,
                          fontFamily: "Mulish",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "20.00",
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
                  Divider(
                    thickness: 1,
                    height: 1,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "Total Price",
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
                          fontSize: 14,
                          fontFamily: "Mulish",
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Color(0xfffafafa),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Payment Method",
                    style: TextStyle(
                      color: Color(0xff252733),
                      fontSize: 12,
                      fontFamily: "Mulish",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Paid : Using UPI",
                    style: TextStyle(
                      color: Color(0xff252733),
                      fontSize: 14,
                      fontFamily: "Mulish",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AssignDriverScreen(),
                          ),
                        );
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xff523291),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "Accept Order",
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
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RejectOrderScreen(),
                          ),
                        );
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xffe9e9eb),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "Reject Order",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xff252733),
                            fontSize: 16,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
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
