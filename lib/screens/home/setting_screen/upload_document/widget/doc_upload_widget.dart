import 'package:flutter/material.dart';

class DocUploadWidget extends StatelessWidget {
  final String title;

  const DocUploadWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: Color(0xffe7e7e7),
          width: 1,
        ),
        color: Colors.white,
      ),
      padding: EdgeInsets.symmetric(
        vertical: 20,
      ),
      child: Column(
        children: [
          Image.asset(
            "assets/icon/setting_icon/document-upload.png",
            height: 40,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
           title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xff666666),
              fontSize: 12,
              fontFamily: "Inter",
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
