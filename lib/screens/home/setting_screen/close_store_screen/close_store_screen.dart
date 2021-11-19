import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xyx_vendor/common/widget/app_scaffold.dart';
import 'package:xyx_vendor/controller/httpController.dart';
import 'package:xyx_vendor/controller/shared_data.dart';
import 'package:xyx_vendor/controller/url.dart';
import 'package:xyx_vendor/screens/home/setting_screen/close_store_screen/widget/close_store_dialog.dart';
import 'package:xyx_vendor/screens/home/setting_screen/close_store_screen/widget/close_success_store_dialog.dart';
import 'package:xyx_vendor/screens/home/setting_screen/close_store_screen/widget/delete_store_dialog.dart';
import 'package:xyx_vendor/screens/home/setting_screen/close_store_screen/widget/delete_success_store_dialog.dart';

class CloseStoreScreen extends StatefulWidget {
  const CloseStoreScreen({Key? key}) : super(key: key);

  @override
  _CloseStoreScreenState createState() => _CloseStoreScreenState();
}

class _CloseStoreScreenState extends State<CloseStoreScreen> {
  bool _progressVisible = false;

  _close(String status) async {
    try {
      setState(() {
        _progressVisible = true;
      });
      Map user = await SharedData().getUser();
      Map data = await HttpController().post(updateStoreStatusUrl, {
        'vendorId': user['id'].toString(),
        'vendorToken': user['token'].toString(),
        'vendorStatus': status,
      });
      setState(() {
        _progressVisible = false;
      });

      if (data.isNotEmpty) {
        if (status == '4') {
          showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  backgroundColor: Colors.transparent,
                  child: CloseStoreSuccessDialog(),
                );
              });
        } else {
          showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  backgroundColor: Colors.transparent,
                  child: DeleteStoreSuccessDialog(),
                );
              });
        }
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      progress: _progressVisible,
      appBar: AppBar(
        title: Text(
          "Close & Delete Store",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: "Inter",
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      child: Container(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(20),
          children: [
            Text(
              "You can close your store temporarily or Delete it forever. Remember we may still keep your data even if you delete the store. Read about this more in our terms of service. ",
              style: TextStyle(
                color: Color(0xff666666),
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "Current Store Status",
              style: TextStyle(
                color: Color(0xff666666),
                fontSize: 14,
                fontFamily: "Inter",
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Active",
              style: TextStyle(
                color: Color(0xff00992a),
                fontSize: 14,
                fontFamily: "Inter",
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () async {
                var data = await showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        backgroundColor: Colors.transparent,
                        child: CloseStoreDialog(),
                      );
                    });

                if (data != null && data) {
                  _close('4');
                }
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0xff523291),
                ),
                alignment: Alignment.center,
                child: Text(
                  "CLOSE STORE",
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
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () async {
                var data = await showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        backgroundColor: Colors.transparent,
                        child: DeleteStoreDialog(),
                      );
                    });

                if (data != null && data) {
                  _close('5');
                }
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                alignment: Alignment.center,
                child: Text(
                  "Delete Store",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff523291),
                    fontSize: 16,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
