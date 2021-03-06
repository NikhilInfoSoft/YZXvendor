import 'package:flutter/material.dart';
import 'package:xyx_vendor/common/app_colors.dart';
import 'package:xyx_vendor/common/widget/app_scaffold.dart';
import 'package:xyx_vendor/common/widget/menu_icon.dart';
import 'package:xyx_vendor/controller/httpController.dart';
import 'package:xyx_vendor/controller/shared_data.dart';
import 'package:xyx_vendor/controller/url.dart';
import 'package:xyx_vendor/screens/home/category/add_category.dart';
import 'package:xyx_vendor/screens/home/category/add_sub_category.dart';
import 'package:xyx_vendor/screens/home/catlogue_screen/category_list_screen/widget/menu_widget.dart';

class SubCategoryListScreen extends StatefulWidget {
  final String category;
  const SubCategoryListScreen({Key? key, required this.category})
      : super(key: key);

  @override
  _SubCategoryListScreenState createState() => _SubCategoryListScreenState();
}

class _SubCategoryListScreenState extends State<SubCategoryListScreen> {
  bool isShare = true;
  bool _progressVisible = false;
  List _categoryList = [];

  _data() async {
    try {
      _categoryList.clear();
      setState(() {
        _progressVisible = true;
      });
      Map user = await SharedData().getUser();
      Map data = await HttpController().get(subCategoryListUrl, body: {
        'vendorId': user['id'].toString(),
        'vendorToken': user['token'].toString(),
      });
      setState(() {
        _progressVisible = false;
      });

      if (data.isNotEmpty) {
        for (var item in data['response']) {
          if (item['categoryId'].toString() == widget.category)
            _categoryList.add(item);
        }
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _data();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      progress: _progressVisible,
      appBar: AppBar(
        title: Text(
          "Sub Categories",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: "Inter",
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            ListView(
              shrinkWrap: true,
              children: List.generate(_categoryList.length, (index) {
                return _categoryTile(
                  _categoryList[index]['subCategoryId'].toString(),
                  _categoryList[index]['subCategoryName'].toString(),
                  _categoryList[index]['subCategoryImage'].toString(),
                  _categoryList[index]['categoryName'].toString(),
                );
              }),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: GestureDetector(
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddSubCategoryScreen(
                        categoryList: _categoryList,
                      ),
                    ),
                  );
                  _data();
                },
                child: Container(
                  width: 222,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x1e000000),
                        blurRadius: 12,
                        offset: Offset(0, 4),
                      ),
                    ],
                    color: Color(0xff523291),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "ADD NEW SUB CATEGORY",
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
        ),
      ),
    );
  }

  Widget _categoryTile(
    String id,
    String name,
    String image,
    String category,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Color(0xffe7e7e7),
          width: 1,
        ),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.network(image),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        color: Color(0xff252733),
                        fontSize: 16,
                        fontFamily: "Mulish",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.transparent,
                          builder: (context) => MenuWidget(),
                        );
                      },
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ThreeDotWidget(),
                      ),
                    ),
                  ],
                ),
                Text(
                  category,
                  style: TextStyle(
                    color: Color(0xff929292),
                    fontSize: 12,
                    fontFamily: "Mulish",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                // Row(
                //   children: [
                //     Container(
                //       width: 24,
                //       height: 24,
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(8),
                //       ),
                //       child: Icon(
                //         Icons.share,
                //         color: Color(0xffc4c4c4),
                //       ),
                //     ),
                //     SizedBox(
                //       width: 10,
                //     ),
                //     Text(
                //       "Share",
                //       style: TextStyle(
                //         color: Color(0xff929292),
                //         fontSize: 12,
                //         fontFamily: "Mulish",
                //         fontWeight: FontWeight.w600,
                //       ),
                //     ),
                //     Spacer(),
                //     Switch(
                //       value: isShare,
                //       onChanged: (value) {
                //         setState(() {
                //           isShare = !isShare;
                //         });
                //       },
                //       activeColor: AppColors.primary,
                //     ),
                //   ],
                // )
              ],
            ),
          )
        ],
      ),
    );
  }
}
