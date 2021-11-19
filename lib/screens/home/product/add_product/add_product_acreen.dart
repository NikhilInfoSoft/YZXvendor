// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:xyx_vendor/common/widget/app_edit_text_widget.dart';
// import 'package:xyx_vendor/common/widget/app_scaffold.dart';

// import 'add_product_form_acreen.dart';

// class AddProductScreen extends StatefulWidget {
//   const AddProductScreen({Key? key}) : super(key: key);

//   @override
//   _AddProductScreenState createState() => _AddProductScreenState();
// }

// class _AddProductScreenState extends State<AddProductScreen> {
//   TextEditingController productName =TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return AppScaffold(
//       appBar: AppBar(
//         title: Text("Add product"),
//       ),
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               height: 30,
//             ),
//             Text(
//               "Name of Product",
//               style: TextStyle(
//                 color: Color(0xff666666),
//                 fontSize: 12,
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             AppEditTextField(
//               controller: productName,
//               hintStyle: "Enter here",
//             ),
//             SizedBox(
//               height: 50,
//             ),
//             GestureDetector(
//               onTap: () {
//                 if(productName.text.trim()==''){
//                   print('error');
//                   Fluttertoast.showToast(msg: 'Enter product name');
//                 }else{
//                   Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => AddProductFormScreen(),
//                   ),
//                 );
                
//                 }
                
//               },
//               child: Container(
//                 height: 50,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8),
//                   color: Color(0xff523291),
//                 ),
//                 alignment: Alignment.center,
//                 child: Text(
//                   "CONTINUE",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 16,
//                     fontFamily: "Inter",
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
