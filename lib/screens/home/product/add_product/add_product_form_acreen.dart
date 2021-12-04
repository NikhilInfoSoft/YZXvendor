import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:xyx_vendor/common/app_colors.dart';
import 'package:xyx_vendor/common/widget/app_droupdown_widget.dart';
import 'package:xyx_vendor/common/widget/app_edit_text_widget.dart';
import 'package:xyx_vendor/common/widget/app_scaffold.dart';
import 'package:xyx_vendor/controller/httpController.dart';
import 'package:xyx_vendor/controller/shared_data.dart';
import 'package:xyx_vendor/controller/url.dart';
import 'package:xyx_vendor/screens/home/category/widget/menu_widget.dart';
import 'package:xyx_vendor/screens/home/product/add_product_variants_attributes_screen/add_product_variants_attributes_screen.dart';
import 'package:xyx_vendor/screens/home/store_screen/widget/image_selected_widget.dart';
import 'package:xyx_vendor/screens/home/store_screen/widget/image_selection_widget.dart';

class AddProductFormScreen extends StatefulWidget {
  const AddProductFormScreen();

  @override
  _AddProductFormScreenState createState() => _AddProductFormScreenState();
}

class _AddProductFormScreenState extends State<AddProductFormScreen> {
  var isEnableStock = false;
  TextEditingController productNameControlleer = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController discountedProductPriceController =
      TextEditingController();
  TextEditingController productUnitController = TextEditingController();
  TextEditingController productShortDiscriptionController =
      TextEditingController();
  TextEditingController productLongDiscriptionController =
      TextEditingController();
  TextEditingController productSpecificationController =
      TextEditingController();
  TextEditingController productStockController = TextEditingController();
  String? selectedCategory;
  bool _progressVisible = false;
  ImagePicker _picker = ImagePicker();
  File? featuredImage;
  String? selectedSubCategory;
  List<dynamic> subCatList = [];

  _imagePicker() async {
    try {
      ImageSource? source = await showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) => ImageSourceMenuWidget(),
      );

      if (source == null) return;
      XFile? file = await _picker.pickImage(source: source);

      if (file != null) {
        featuredImage = File(file.path);
        setState(() {});
      }
    } catch (e) {
      print(e);
    }
  }

  List<dynamic> _categoryList = [];
  List<dynamic> _subCatList = [];

  _addproduct() async {
    try {
      var categoryId = _categoryList
          .firstWhere((element) => element['categoryName'] == selectedCategory)[
              'categoryId']
          .toString(); //
      var subCategoryId = _subCatList.firstWhere((element) {
        if (selectedSubCategory != null) {
          return element['subCategoryName'] == selectedSubCategory;
        } else {
          return element['subCategoryName'] ==
              subCatList.first['subCategoryName'];
        }
      })['subCategoryId'].toString(); //
      var productName = productNameControlleer.text; //
      var productPrice = productPriceController.text; //
      var discountedProductPrice = discountedProductPriceController.text; //
      var productUnit = productUnitController.text; //
      var productShortDescription = productShortDiscriptionController.text; //
      var productLongDescription = productLongDiscriptionController.text; //
      var productSpecification = productSpecificationController.text; //
      var productIsInStock = isEnableStock ? '1' : '0'; //
      var productStock = productStockController.text; //
      var productFeaturedImage = featuredImage; //

      if (categoryId == '' ||
          subCategoryId == '' ||
          productName == '' ||
          productPrice == '' ||
          discountedProductPrice == '' ||
          productUnit == '' ||
          productShortDescription == '' ||
          productLongDescription == '' ||
          productSpecification == '' ||
          productStock == '') {
        print('error');
        Fluttertoast.showToast(msg: 'Please fill all the fields..!!');
        return;
      } else if (productFeaturedImage == null) {
        print('error2');

        Fluttertoast.showToast(msg: 'Please select proper product image..!!');
        return;
      }
      setState(() {
        _progressVisible = true;
      });

      Map user = await SharedData().getUser();

      Map data = await HttpController().multiPart(addProductUrl, {
        'vendorId': user['id'].toString(),
        'vendorToken': user['token'].toString(),
        'categoryId': categoryId,
        'subCategoryId': subCategoryId,
        'productName': productName,
        'productPrice': productPrice,
        "DiscountedProductPrice": discountedProductPrice,
        "productUnit": productUnit,
        "productShortDescription": productShortDescription,
        "productLongDescription": productLongDescription,
        "productSpecification": productSpecification,
        "productIsInStock": productIsInStock,
        "productStock": productStock,
        "productFeaturedImage": featuredImage
      });

      if (data.isNotEmpty) {
        productNameControlleer.text = '';
        productPriceController.text = '';
        discountedProductPriceController.text = '';
        productUnitController.text = '';
        productShortDiscriptionController.text = '';
        productLongDiscriptionController.text = '';
        productSpecificationController.text = '';
        isEnableStock = false;
        productStockController.text = '';
        selectedCategory = '';
        selectedSubCategory = '';
        featuredImage = null;
      }

      setState(() {
        _progressVisible = false;
      });
    } catch (e) {
      Fluttertoast.showToast(msg: 'Please fill all the fields..!!');
      return;
    }
  }

  _data() async {
    try {
      setState(() {
        _progressVisible = true;
      });
      Map user = await SharedData().getUser();
      Map catList = await HttpController().get(categoryListUrl, body: {
        'vendorId': user['id'].toString(),
        'vendorToken': user['token'].toString(),
      });
      Map subcatList = await HttpController().get(subCategoryListUrl, body: {
        'vendorId': user['id'].toString(),
        'vendorToken': user['token'].toString(),
      });

      if (catList.isNotEmpty && subcatList.isNotEmpty) {
        _categoryList = catList['response'];
        _subCatList = subcatList['response'];
      }
      setState(() {
        _progressVisible = false;
      });
    } catch (e) {}
  }

  @override
  void initState() {
    _data();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      progress: _progressVisible,
      appBar: AppBar(
        title: Text("Add product"),
      ),
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: _imagePicker,
                    child: featuredImage != null
                        ? ImageSelectedWidget(
                            imageSize: "upload \nJPG, PNG, MP4",
                            title: "Update featured image",
                            file: featuredImage,
                          )
                        : ImageSelectionWidget(
                            imageSize: "upload \nJPG, PNG, MP4",
                            title: "Update featured image"),
                  ),
                ],
              ),
              Text(
                "Name of Product",
                style: TextStyle(
                  color: Color(0xff666666),
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 10),
              AppEditTextField(
                controller: productNameControlleer,
                hintStyle: "Enter here",
              ),
              SizedBox(height: 10),
              AppDropDownWidget(
                  hint: 'Select category',
                  changeChosen: (s) {
                    print(selectedSubCategory);
                    setState(() {
                      subCatList = _subCatList
                          .where((element) => element['categoryName'] == s)
                          .toList();
                      selectedCategory = s;
                    });
                  },
                  list: _categoryList
                      .map<String>((e) => e['categoryName'])
                      .toList()),
              SizedBox(height: 10),
              if (selectedCategory != null)
                AppDropDownWidget(
                    hint: 'Select sub category',
                    changeChosen: (s) {
                      setState(() {
                        selectedSubCategory = s;
                      });
                    },
                    list: subCatList
                        .map<String>((e) => e['subCategoryName'])
                        .toList()),
              SizedBox(height: 10),
              // AppEditTextField(
              //   hintStyle: "Electronics",
              // ),
              // SizedBox(height: 10),
              Text(
                "Price",
                style: TextStyle(
                  color: Color(0xff666666),
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 10),
              AppEditTextField(
                controller: productPriceController,
                hintStyle: "Enter here",
                suffixIcon: Container(
                  width: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xffe5e5e5),
                  ),
                  child: Center(
                    child: Text(
                      "\$",
                      style: TextStyle(
                        color: Color(0xff666666),
                        fontSize: 16,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Discounted Price",
                style: TextStyle(
                  color: Color(0xff666666),
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 10),
              AppEditTextField(
                controller: discountedProductPriceController,
                hintStyle: "Enter here",
                suffixIcon: Container(
                  width: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xffe5e5e5),
                  ),
                  child: Center(
                    child: Text(
                      "\$",
                      style: TextStyle(
                        color: Color(0xff666666),
                        fontSize: 16,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Product Unit",
                style: TextStyle(
                  color: Color(0xff666666),
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 10),
              AppEditTextField(
                controller: productUnitController,
                hintStyle: "Enter here",
                suffixIcon: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xffe5e5e5),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Piece",
                          style: TextStyle(
                            color: Color(0xff666666),
                            fontSize: 16,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: Color(0xff666666),
                          size: 25,
                        )
                      ],
                    )),
              ),
              SizedBox(height: 10),
              Text(
                "Product Short Description",
                style: TextStyle(
                  color: Color(0xff666666),
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 10),
              AppEditTextField(
                controller: productShortDiscriptionController,
                hintStyle: "Write here",
                minLines: 3,
                maxLines: 5,
              ),
              SizedBox(height: 10),
              Text(
                "Product Long Description",
                style: TextStyle(
                  color: Color(0xff666666),
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 10),
              AppEditTextField(
                controller: productLongDiscriptionController,
                hintStyle: "Write here",
                minLines: 3,
                maxLines: 5,
              ),
              SizedBox(height: 10),
              Text(
                "Product Specifications",
                style: TextStyle(
                  color: Color(0xff666666),
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 10),
              AppEditTextField(
                controller: productSpecificationController,
                hintStyle: "Write here",
                minLines: 3,
                maxLines: 5,
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    "Enable Stock",
                    style: TextStyle(
                      color: Color(0xff111823),
                      fontSize: 12,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  Switch(
                    value: isEnableStock,
                    onChanged: (value) {
                      setState(() {
                        isEnableStock = !isEnableStock;
                      });
                    },
                    activeColor: AppColors.primary,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                "Quantity in Stock",
                style: TextStyle(
                  color: Color(0xff666666),
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 10),
              AppEditTextField(
                controller: productStockController,
                hintStyle: "Enter here",
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          AddProductVariantsAttributesScreen(),
                    ),
                  );
                },
                child: Container(
                  child: Text(
                    "Add Variants & Attributes",
                    style: TextStyle(
                      color: Color(0xff523291),
                      fontSize: 16,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: _addproduct,
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xff523291),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Save Product",
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
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  "Delete this product",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xffde0000),
                    fontSize: 16,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
