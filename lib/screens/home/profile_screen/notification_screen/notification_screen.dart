import 'package:flutter/material.dart';
import 'package:xyx_vendor/common/widget/app_scaffold.dart';
import 'package:xyx_vendor/screens/home/profile_screen/notification_screen/widget/notification_item_widget.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: Text(
          "Notifications",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: "Inter",
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      child: Container(
          child: ListView.separated(
              itemBuilder: (context,index){
                return NotificationItemWidget();
              },
              separatorBuilder: (context,index){
                return Divider(
                  thickness: 1,
                  height: 1,
                );
              },
              itemCount: 20)
      ),
    );
  }


}
