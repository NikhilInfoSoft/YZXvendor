import 'package:flutter/material.dart';
import 'package:xyx_vendor/common/app_colors.dart';
import 'package:xyx_vendor/common/widget/app_droupdown_widget.dart';
import 'package:xyx_vendor/common/widget/app_edit_text_widget.dart';
import 'package:xyx_vendor/common/widget/app_scaffold.dart';

class ShippingConfigurationScreen extends StatefulWidget {
  const ShippingConfigurationScreen({Key? key}) : super(key: key);

  @override
  _ShippingConfigurationScreenState createState() =>
      _ShippingConfigurationScreenState();
}

class _ShippingConfigurationScreenState
    extends State<ShippingConfigurationScreen> {
  bool isDisable = false;
  bool isEnableCourier = false;
  bool isLocalPickup = false;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: Text(
          "Shipping Configuration",
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
          padding: EdgeInsets.all(20),
          shrinkWrap: true,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Local Delivery by Delivery Boys",
                      style: TextStyle(
                        color: Color(0xff111823),
                        fontSize: 12,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      "If disabled, also disables shop on User App.",
                      style: TextStyle(
                        color: Color(0xffde0000),
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
                Spacer(),
                Switch(
                  value: isDisable,
                  onChanged: (value) {
                    setState(() {
                      isDisable = !isDisable;
                    });
                  },
                  activeColor: AppColors.primary,
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Enable Courier Delivery",
                  style: TextStyle(
                    color: Color(0xff111823),
                    fontSize: 12,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Spacer(),
                Switch(
                  value: isEnableCourier,
                  onChanged: (value) {
                    setState(() {
                      isEnableCourier = !isEnableCourier;
                    });
                  },
                  activeColor: AppColors.primary,
                ),
              ],
            ),
            Text(
              "Locations for Delivery",
              style: TextStyle(
                color: Color(0xff666666),
                fontSize: 12,
                fontFamily: "Inter",
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Country",
                      style: TextStyle(
                        color: Color(0xff666666),
                        fontSize: 12,
                      ),
                    ),
                    AppDropDownWidget(hint: "India", list: ["India", "US"])
                  ],
                )),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "State",
                      style: TextStyle(
                        color: Color(0xff666666),
                        fontSize: 12,
                      ),
                    ),
                    AppDropDownWidget(
                        hint: "Gujarat", list: ["Gujarat", "MP", "UP"])
                  ],
                )),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Delivery Charge",
              style: TextStyle(
                color: Color(0xff666666),
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            AppEditTextField(
              hintStyle: "Enter here",
            ),
            Row(
              children: [
                Text(
                  "Local Pickup",
                  style: TextStyle(
                    color: Color(0xff111823),
                    fontSize: 12,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Spacer(),
                Switch(
                  value: isLocalPickup,
                  onChanged: (value) {
                    setState(() {
                      isLocalPickup = !isLocalPickup;
                    });
                  },
                  activeColor: AppColors.primary,
                ),
              ],
            ),
            Text(
              "Free Shipping Beyond",
              style: TextStyle(
                color: Color(0xff666666),
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            AppEditTextField(
              hintStyle: "Enter Amount",
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 312,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xff523291),
              ),
              alignment: Alignment.center,
              child: Text(
                "SAVE SHIPPING SETTINGS",
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
