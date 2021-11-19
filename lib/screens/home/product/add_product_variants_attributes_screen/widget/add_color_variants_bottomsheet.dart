import 'package:flutter/material.dart';
import 'package:xyx_vendor/common/app_colors.dart';
import 'package:xyx_vendor/common/widget/app_edit_text_widget.dart';

class AddColorVariants extends StatefulWidget {
  const AddColorVariants({Key? key}) : super(key: key);

  @override
  _AddColorVariantsState createState() => _AddColorVariantsState();
}

class _AddColorVariantsState extends State<AddColorVariants> {

  List<Color> _list = [
    Color(0xfff80101),
    Color(0xff003a9e),
    Color(0xff064bff),
    Color(0xffd500a7),
    Color(0xff95ff00),
    Color(0xffffe600),
    Color(0xff00ffae),
    Color(0xffff8400),
    Color(0xff5397e2),
    Color(0xff611c1c),
    Color(0xff357d99),
    Color(0xff3f532e),
    Color(0xff678d0d),
    Color(0xff96de93),
    Color(0xffd891ec),
    Color(0xff485b63),
    Color(0xff774be5),
  ];


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
                "Add Other Variant",
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
          Wrap(
            children: [
              for(var model in _list)
              Container(
                width: 32,
                height: 32,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17),
                  color: model,
                ),
              )
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
