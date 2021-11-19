import 'package:flutter/material.dart';

import 'notification_detail_dialog.dart';

class NotificationItemWidget extends StatelessWidget {
  const NotificationItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                backgroundColor: Colors.transparent,
                child: NotificationDetailsDialog(),
              );
            });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 40,
              height: 40,
              margin: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: FlutterLogo(size: 40),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        "Lorem ipsum dolor ",
                        style: TextStyle(
                          color: Color(0xff252733),
                          fontSize: 14,
                          fontFamily: "Mulish",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "02 June 1:30",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xffcccccc),
                          fontSize: 14,
                          fontFamily: "Mulish",
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiu.",
                    style: TextStyle(
                      color: Color(0xff666666),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
