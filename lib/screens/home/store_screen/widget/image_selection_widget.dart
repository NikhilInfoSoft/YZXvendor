import 'package:flutter/material.dart';

class ImageSelectionWidget extends StatelessWidget {
  final String imageSize;
  final String title;

  const ImageSelectionWidget(
      {Key? key, required this.imageSize, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Color(0xff111823),
                width: 1,
              ),
              color: Color(0xffe5e5e5),
            ),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 38,
                  height: 36,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.asset("assets/icon/image.png"),
                ),
                SizedBox(height: 5),
                Text(
                  imageSize,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff111823),
                    fontSize: 10,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: TextStyle(
              color: Color(0xff111823),
              fontSize: 12,
              fontFamily: "Inter",
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
