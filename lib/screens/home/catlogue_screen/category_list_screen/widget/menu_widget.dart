import 'package:flutter/material.dart';
import 'package:xyx_vendor/common/app_colors.dart';
import 'package:xyx_vendor/common/widget/app_edit_text_widget.dart';
import 'package:xyx_vendor/screens/home/category/add_category.dart';

class MenuWidget extends StatefulWidget {
  final String? id;
  final bool category;
  final Map? data;
  const MenuWidget({
    Key? key,
    this.id,
    this.category = true,
    this.data,
  }) : super(key: key);

  @override
  _MenuWidgetState createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
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
                "Options",
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
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              if (widget.category) {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddCategoryScreen(
                      edit: true,
                      id: widget.id ?? '',
                      data: widget.data ?? {},
                    ),
                  ),
                );
              }
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Edit",
                style: TextStyle(
                  color: Color(0xff252733),
                  fontSize: 16,
                  fontFamily: "Mulish",
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Delete",
                style: TextStyle(
                  color: Color(0xff523291),
                  fontSize: 16,
                  fontFamily: "Mulish",
                  fontWeight: FontWeight.w700,
                ),
              )),
        ],
      ),
    );
  }
}
