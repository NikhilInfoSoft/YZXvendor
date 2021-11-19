import 'package:flutter/material.dart';

class NotificationDetailsDialog extends StatefulWidget {
  const NotificationDetailsDialog({Key? key}) : super(key: key);

  @override
  _NotificationDetailsDialogState createState() =>
      _NotificationDetailsDialogState();
}

class _NotificationDetailsDialogState extends State<NotificationDetailsDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Color(0xffe7e7e7),
          width: 1,
        ),
        color: Colors.white,
      ),
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Notification Detail",
            style: TextStyle(
              color: Color(0xff252733),
              fontSize: 20,
              fontFamily: "Mulish",
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 25,),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: FlutterLogo(size: 24),
          ),
          SizedBox(height: 20,),
          Text(
            "Lorem ipsum dolor ",
            style: TextStyle(
              color: Color(0xff252733),
              fontSize: 14,
              fontFamily: "Mulish",
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10,),
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,",
            style: TextStyle(
              color: Color(0xff666666),
              fontSize: 14,
            ),
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xffe9e9eb),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Back",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff252733),
                      fontSize: 16,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20,),
              Expanded(
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xff523291),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Dismiss",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
