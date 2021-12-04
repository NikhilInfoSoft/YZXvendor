import 'package:flutter/material.dart';
import 'package:xyx_vendor/common/widget/app_scaffold.dart';
import 'package:xyx_vendor/controller/httpController.dart';
import 'package:xyx_vendor/controller/shared_data.dart';
import 'package:xyx_vendor/controller/url.dart';
import 'package:xyx_vendor/screens/home/setting_screen/my_invoice/widget/invoice_widget.dart';
import 'package:xyx_vendor/screens/home/setting_screen/sponsored_screen/widget/invoices_card_widget.dart';

class MyInvoiceScreen extends StatefulWidget {
  const MyInvoiceScreen({Key? key}) : super(key: key);

  @override
  _MyInvoiceScreenState createState() => _MyInvoiceScreenState();
}

class Constants {
  static const String Paid = 'Paid';
  static const String Unpaid = 'Unpaid';
  static const String Cancelled = 'Cancelled';

  static const List<String> choices = <String>[Paid, Unpaid, Cancelled];
}

class _MyInvoiceScreenState extends State<MyInvoiceScreen> {
  bool _progressVisible = false;

  getInvoices(String status) async {
    try {
      setState(() {
        _progressVisible = true;
      });
      Map user = await SharedData().getUser();
      Map data = await HttpController().post(getVendorInvoices, {
        'vendorId': user['id'].toString(),
        'vendorToken': user['token'].toString(),
        'status': status,
      });
      // Map data = json.decode(res.body);

      if (data.isNotEmpty) {
        print(data);
        if (data['response'] != null) {
          invoices = data['response'];
        }
      }
      setState(() {
        _progressVisible = false;
      });
    } catch (e) {
      print(e);
    }
  }

  List invoices = [];
  @override
  void initState() {
    getInvoices(Constants.Paid);

    super.initState();
  }

  String _selectedChoice = Constants.Paid; // The app's "state".

  void choiceAction(String choice) {
    if (choice == Constants.Paid) {
      _selectedChoice = Constants.Paid;
      getInvoices(Constants.Paid);
    } else if (choice == Constants.Unpaid) {
      _selectedChoice = Constants.Unpaid;
      getInvoices(Constants.Unpaid);
    } else if (choice == Constants.Cancelled) {
      _selectedChoice = Constants.Cancelled;
      getInvoices(Constants.Cancelled);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      progress: _progressVisible,
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
        actions: [
          PopupMenuButton<String>(
            icon: Icon(Icons.filter_alt),
            onSelected: choiceAction,
            itemBuilder: (BuildContext context) {
              return Constants.choices.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          )
        ],
      ),
      child: _progressVisible
          ? Text('')
          : invoices.length <= 0
              ? Center(child: Text('No Invoices Found!'))
              : Container(
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    shrinkWrap: true,
                    children: [
                      ...List.generate(
                          invoices.length,
                          (index) =>
                              InvoiceWidget(invoiceData: invoices[index])),
                      // InvoiceWidget(),
                      // InvoiceWidget(),
                      // InvoiceWidget(),
                      // InvoiceWidget(),
                    ],
                  ),
                ),
    );
  }
}
