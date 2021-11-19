import 'package:flutter/material.dart';
import 'package:xyx_vendor/common/app_colors.dart';

class LanguageWidget extends StatelessWidget {
  final String name;
  final String icon;
  final bool isSelected;

  const LanguageWidget(
      {Key? key,
      required this.name,
      required this.icon,
      this.isSelected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: Color(0xffe7e7e7),
          width: 1,
        ),
        color: Colors.white,
      ),
      padding: const EdgeInsets.only(left: 12, right: 11, top: 10, bottom: 10),
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: Color(0xffe7e7e7),
                width: 1,
              ),
            ),
            child: Image.asset(icon),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            name,
            style: TextStyle(
              color: Color(0xff666666),
              fontSize: 14,
              fontFamily: "Inter",
              fontWeight: FontWeight.w500,
            ),
          ),
          Spacer(),
          if (isSelected) ...{
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: AppColors.primary,
                  width: 2,
                ),
              ),
              width: 24,
              height: 24,
              child: Checkbox(
                value: true,
                onChanged: (value) {},
                side: BorderSide(
                  color: Colors.grey,
                  width: 1.5,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3),
                ),
                tristate: false,
                activeColor: Colors.transparent,
                checkColor: AppColors.primary,
              ),
            )
          }
        ],
      ),
    );
  }
}
