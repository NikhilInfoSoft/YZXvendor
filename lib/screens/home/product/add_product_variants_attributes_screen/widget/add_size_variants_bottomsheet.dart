import 'package:flutter/material.dart';
import 'package:xyx_vendor/common/app_colors.dart';
import 'package:xyx_vendor/common/widget/app_edit_text_widget.dart';

class AddSizeVariants extends StatefulWidget {
  const AddSizeVariants({Key? key}) : super(key: key);

  @override
  _AddSizeVariantsState createState() => _AddSizeVariantsState();
}

class _AddSizeVariantsState extends State<AddSizeVariants> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Add Size",
                style: TextStyle(
                  color: Color(0xff252733),
                  fontSize: 20,
                  fontFamily: "Mulish",
                  fontWeight: FontWeight.w700,
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  "assets/icon/close_circle.png",
                  height: 24,
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Size 1",
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
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Price",
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
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Discounted Price",
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
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xff523291),
              ),
              alignment: Alignment.center,
              child: Text(
                "Save".toUpperCase(),
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
    );
  }
}
