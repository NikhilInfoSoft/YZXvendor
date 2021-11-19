import 'package:flutter/material.dart';

class ShareStoreDialog extends StatefulWidget {
  const ShareStoreDialog({Key? key}) : super(key: key);

  @override
  _ShareStoreDialogState createState() => _ShareStoreDialogState();
}

class _ShareStoreDialogState extends State<ShareStoreDialog> {
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
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(
                "Share Store URL",
                style: TextStyle(
                  color: Color(0xff252733),
                  fontSize: 20,
                  fontFamily: "Mulish",
                  fontWeight: FontWeight.w700,
                ),
              ),
              Spacer(),
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: FlutterLogo(size: 24),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Text(
            "Hello!\n\nWe are now available on ZyX for you, please visit: (store URL)\n\nIf you have any questions about your orders, please call us on (phone number of store) and we would be happy to help you.\n\nThank you\nStore Name",
            style: TextStyle(
              color: Color(0xff252733),
              fontSize: 16,
              fontFamily: "Mulish",
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10,),
          Container(
            width: 268,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(0xff523291),
            ),
            padding: const EdgeInsets.only(top: 16, bottom: 15, ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                Text(
                  "Copy & Share",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
