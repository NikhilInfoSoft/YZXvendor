import 'package:flutter/material.dart';
import 'package:xyx_vendor/screens/home/setting_screen/close_store_screen/close_store_screen.dart';
import 'package:xyx_vendor/screens/home/setting_screen/close_store_screen/widget/close_success_store_dialog.dart';

class CloseStoreDialog extends StatefulWidget {
  const CloseStoreDialog({Key? key}) : super(key: key);

  @override
  _CloseStoreDialogState createState() => _CloseStoreDialogState();
}

class _CloseStoreDialogState extends State<CloseStoreDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Color(0xffe7e7e7),
          width: 1,
        ),
        color: Colors.white,
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Close Store",
            style: TextStyle(
              color: Color(0xff252733),
              fontSize: 20,
              fontFamily: "Mulish",
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Do you want to close your store? Your store is still visible in search but shown as closed so no more orders can be placed.",
            style: TextStyle(
              color: Color(0xff252733),
              fontSize: 14,
              fontFamily: "Mulish",
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xffe9e9eb),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "No",
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
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context, true);
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xff523291),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Yes",
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
              ),
            ],
          )
        ],
      ),
    );
  }
}
