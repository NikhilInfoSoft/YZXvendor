import 'package:flutter/material.dart';
import 'package:xyx_vendor/common/widget/app_scaffold.dart';
import 'package:xyx_vendor/screens/home/setting_screen/my_invoice/widget/invoice_widget.dart';

class MyInvoiceScreen extends StatefulWidget {
  const MyInvoiceScreen({Key? key}) : super(key: key);

  @override
  _MyInvoiceScreenState createState() => _MyInvoiceScreenState();
}

class _MyInvoiceScreenState extends State<MyInvoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: Text(
          "My Invoices",
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
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          shrinkWrap: true,
          children: [
            InvoiceWidget(),
            InvoiceWidget(),
            InvoiceWidget(),
            InvoiceWidget(),
          ],
        ),
      ),
    );
  }




}
