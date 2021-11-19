import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:xyx_vendor/common/app_colors.dart';
import 'package:xyx_vendor/common/widget/app_edit_text_widget.dart';

class ImageSourceMenuWidget extends StatefulWidget {
  const ImageSourceMenuWidget({Key? key}) : super(key: key);

  @override
  _ImageSourceMenuWidgetState createState() => _ImageSourceMenuWidgetState();
}

class _ImageSourceMenuWidgetState extends State<ImageSourceMenuWidget> {
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
              Navigator.pop(context, ImageSource.camera);
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Camera",
                style: TextStyle(
                  color: Color(0xff252733),
                  fontSize: 16,
                  fontFamily: "Mulish",
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context, ImageSource.gallery);
            },
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Gallery",
                  style: TextStyle(
                    color: Color(0xff523291),
                    fontSize: 16,
                    fontFamily: "Mulish",
                    fontWeight: FontWeight.w700,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
