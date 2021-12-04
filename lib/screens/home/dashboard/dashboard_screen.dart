import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xyx_vendor/common/app_colors.dart';
import 'package:xyx_vendor/common/widget/app_scaffold.dart';
import 'package:xyx_vendor/screens/home/home_screen/widget/card_widget.dart';
import 'package:xyx_vendor/screens/home/order_screen/widget/order_item_widget.dart';
import 'package:xyx_vendor/screens/home/order_screen/widget/order_shorting_widget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Stack(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 2.0, horizontal: 16.0),
            child: Container(
              width: 360,
              height: 178,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xffcf198c),
                    Color(0xff602f90),
                    Color(0xff523291)
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                // width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Container(
                        width: 61,
                        height: 49,
                        child: FlutterLogo(size: 49),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Welcome!\nNewland Store",
                      style: TextStyle(
                        color: Color(0xffe5e5e5),
                        fontSize: 24,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 120,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.black,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Color(0xffb6aeae),
                          width: 1,
                        ),
                      ),
                      child: FlutterLogo(size: 120),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          "Overview",
                          style: TextStyle(
                            color: Color(0xff111823),
                            fontSize: 16,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Spacer(),
                        Text(
                          "Year",
                          style: TextStyle(
                            color: Color(0xff929292),
                            fontSize: 12,
                            fontFamily: "Mulish",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      runSpacing: 10,
                      spacing: 10,
                      children: [
                        CardWidget(
                          name: "Sales Value",
                          value: "\$880",
                        ),
                        CardWidget(
                          name: "Pending Orders",
                          value: "8",
                        ),
                        CardWidget(
                          name: "Total Sales",
                          value: "\$20240",
                        ),
                        CardWidget(
                          name: "Pending Orders",
                          value: "8",
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Text(
                          "Active Orders",
                          style: TextStyle(
                            color: Color(0xff111823),
                            fontSize: 16,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Spacer(),
                        Text(
                          "View All",
                          style: TextStyle(
                            color: Color(0xff523291),
                            fontSize: 14,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        OrderShortingWidget(
                          text: "Pending",
                          isSelected: true,
                        ),
                        OrderShortingWidget(text: "Accepted"),
                        OrderShortingWidget(text: "Shipped"),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    OrderItemWidget(orderStatus: OrderStatus.Pending),
                    OrderItemWidget(orderStatus: OrderStatus.Accepted),
                    OrderItemWidget(orderStatus: OrderStatus.Shipped),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
