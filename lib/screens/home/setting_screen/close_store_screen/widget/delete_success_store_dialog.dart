import 'package:flutter/material.dart';

class DeleteStoreSuccessDialog extends StatefulWidget {
  const DeleteStoreSuccessDialog({Key? key}) : super(key: key);

  @override
  _DeleteStoreSuccessDialogState createState() =>
      _DeleteStoreSuccessDialogState();
}

class _DeleteStoreSuccessDialogState extends State<DeleteStoreSuccessDialog> {
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
            "Delete Store",
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
            "Your store status is changed to deleted. Thank you for using Zyx services.",
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
          GestureDetector(
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
                "Close",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff252733),
                  fontSize: 16,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
