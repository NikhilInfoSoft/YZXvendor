import 'package:flutter/material.dart';

class CloseStoreSuccessDialog extends StatefulWidget {
  const CloseStoreSuccessDialog({Key? key}) : super(key: key);

  @override
  _CloseStoreSuccessDialogState createState() => _CloseStoreSuccessDialogState();
}

class _CloseStoreSuccessDialogState extends State<CloseStoreSuccessDialog> {
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
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
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
          SizedBox(height: 20,),
          Text(
            "Your Store Status is changed to Closed. You can anytime activate your store from this screen.",
            style: TextStyle(
              color: Color(0xff252733),
              fontSize: 14,
              fontFamily: "Mulish",
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 40,),
          GestureDetector(
            onTap: (){
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
