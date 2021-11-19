import 'package:flutter/material.dart';
import 'package:xyx_vendor/common/app_colors.dart';

class StoreProgressWidget extends StatelessWidget {
  final int index;

  const StoreProgressWidget({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 80, vertical: 20),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: index == 1
                  ? Color(0xff666666)
                  : index > 1
                      ? Color(0xffcf198c)
                      : Color(0xffc4c4c4),
            ),
          ),
          Expanded(
            child: Container(
              height: 4,
              color:index > 1
                  ? Color(0xffcf198c)
                  : Color(0xffc4c4c4),
            ),
          ),
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: index == 2
                  ? Color(0xff666666)
                  : index > 2
                  ? Color(0xffcf198c)
                  :Color(0xffc4c4c4),
            ),
          ),
          Expanded(
            child: Container(
              height: 4,
              color: index > 2
                  ? Color(0xffcf198c)
                  :Color(0xffc4c4c4),
            ),
          ),
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: index == 3
                  ? Color(0xff666666)
                  : index > 3
                  ? Color(0xffcf198c)
                  :Color(0xffc4c4c4),
            ),
          ),
        ],
      ),
    );
  }
}
