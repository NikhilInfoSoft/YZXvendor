import 'package:flutter/material.dart';
import 'package:xyx_vendor/common/widget/app_droupdown_widget.dart';
import 'package:xyx_vendor/common/widget/app_edit_text_widget.dart';

class ShopTimingItemWidget extends StatefulWidget {
  const ShopTimingItemWidget({Key? key}) : super(key: key);

  @override
  _ShopTimingItemWidgetState createState() => _ShopTimingItemWidgetState();
}

class _ShopTimingItemWidgetState extends State<ShopTimingItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10).copyWith(bottom: 20),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Select Day",
                style: TextStyle(
                  color: Color(0xff666666),
                  fontSize: 12,
                ),
              ),
              Spacer(),
              Text(
                "Add Slot",
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xff523291),
                  fontSize: 14,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          AppDropDownWidget(
            hint: "Monday",
            list: ["Monday","Tuesday","Wednesday"],
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Open Time",
                      style: TextStyle(
                        color: Color(0xff666666),
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 10,),
                    AppEditTextField(
                      hintStyle: "10.00 AM",
                      suffixIcon: Icon(Icons.alarm),
                    )
                  ],
                ),
              ),
              SizedBox(width: 10,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Close Time",
                      style: TextStyle(
                        color: Color(0xff666666),
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 10,),
                    AppEditTextField(
                      hintStyle: "10.00 AM",
                      suffixIcon: Icon(Icons.alarm),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
