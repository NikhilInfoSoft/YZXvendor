import 'package:flutter/material.dart';
import 'package:xyx_vendor/common/widget/app_scaffold.dart';

class QrCodeScreen extends StatefulWidget {
  const QrCodeScreen({Key? key}) : super(key: key);

  @override
  _QrCodeScreenState createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: Text(
          "QR Code",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: "Inter",
            fontWeight: FontWeight.w600,
          ),
        ),
        elevation: 0,
      ),
      child: Container(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                  color: Color(0xff523291),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: 0,
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox.shrink(),
                    Container(
                      width: 237,
                      height: 221,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: Color(0xffe7e7e7),
                          width: 1,
                        ),
                        color: Colors.white,
                      ),
                      child: FlutterLogo(),
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                          fontFamily: "Inter",
                          color: Color(0xff313131),
                        ),
                        children: [
                          TextSpan(
                            text: "Zyx Store\n",
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Color(0xff313131),
                            ),
                          ),
                          TextSpan(
                              text:
                                  "Mobile No. : +91 9999999999\nzyxstore.com"),
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xff523291),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "DOWNLOAD QR CODE",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Text(
                      "Print QR Code",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff523291),
                        fontSize: 16,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
