import 'package:flutter/material.dart';
import 'package:xyx_vendor/common/widget/app_scaffold.dart';
import 'package:xyx_vendor/screens/home/order_screen/widget/order_shorting_widget.dart';

import 'widget/order_item_widget.dart';
import 'widget/share_store_dialog.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _OrderDesign();
  }
}

class _OrderDesign extends StatefulWidget {
  const _OrderDesign({Key? key}) : super(key: key);

  @override
  _OrderDesignState createState() => _OrderDesignState();
}

class _OrderDesignState extends State<_OrderDesign> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: Text(
          "Orders",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: "Inter",
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: (){
              showDialog(context: context, builder: (context){
                return Dialog(
                  backgroundColor: Colors.transparent,
                  child: ShareStoreDialog(),
                );
              });
            },
            child: Image.asset(
              "assets/icon/share.png",
              height: 24,
              width: 24,
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 10),
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            height: 24,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  OrderShortingWidget(
                    text: "All",
                    isSelected: true,
                  ),
                  OrderShortingWidget(text: "Pending"),
                  OrderShortingWidget(text: "Accepted"),
                  OrderShortingWidget(text: "Shipped"),
                  OrderShortingWidget(text: "Delivered"),
                  OrderShortingWidget(text: "Rejected"),
                  OrderShortingWidget(text: "Cancelled"),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: Color(0xffe7e7e7),
                    width: 1,
                  ),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 19,
                  top: 4,
                  bottom: 5,
                ),
                child: Text(
                  "Filter",
                  style: TextStyle(
                    color: Color(0xff929292),
                    fontSize: 12,
                    fontFamily: "Mulish",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(width: 5),
              Container(
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
            ],
          ),
          SizedBox(
            height: 20,
          ),
          OrderItemWidget(orderStatus: OrderStatus.Pending),
          OrderItemWidget(orderStatus: OrderStatus.Accepted),
          OrderItemWidget(orderStatus: OrderStatus.Shipped),
          OrderItemWidget(orderStatus: OrderStatus.Delivered),
        ],
      ),
    );
  }
}
