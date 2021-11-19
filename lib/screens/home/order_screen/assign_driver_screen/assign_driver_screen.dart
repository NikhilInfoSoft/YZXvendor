import 'package:flutter/material.dart';
import 'package:xyx_vendor/common/widget/app_scaffold.dart';

class AssignDriverScreen extends StatefulWidget {
  const AssignDriverScreen({Key? key}) : super(key: key);

  @override
  _AssignDriverScreenState createState() => _AssignDriverScreenState();
}

class _AssignDriverScreenState extends State<AssignDriverScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: Text(
          "Assign Driver",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: "Inter",
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select Driver",
              style: TextStyle(
                color: Color(0xff666666),
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Color(0xffe7e7e7),
                  width: 1,
                ),
                color: Color(0xfff6f6f6),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                "Select",
                style: TextStyle(
                  color: Color(0xff666666),
                  fontSize: 16,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
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
                      "Cancel",
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
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xff523291),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "ASSIGN",
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
              ],
            )
          ],
        ),
      ),
    );
  }
}
