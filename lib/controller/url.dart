final String mainUrl = 'https://zyx.demofy21.top/api/';

//Authentication
final String signUpUrl = mainUrl + 'vendorsignup'; //.
final String otpVerificationUrl = mainUrl + 'vendorotpverification'; //.
final String saveStoreInfoUrl = mainUrl + 'vendorsavestoreinfo'; //.
final String saveStoreLocationUrl = mainUrl + 'vendorsavestorelocation'; //.
final String loginUrl = mainUrl + 'vendorsignin'; //.
final String savefcm = mainUrl + 'savefcm'; //..not there in api list
final String vendorotpUrl = mainUrl + 'vendorotp';

//Category
final String addCategoryUrl = mainUrl + 'addcategory'; //.
final String categoryListUrl = mainUrl + 'getcategorylist'; //.
final String addSubCategoryUrl = mainUrl + 'addsubcategory'; //.
final String subCategoryListUrl = mainUrl + 'getsubcategorylist'; //.
final String editCategoryUrl = mainUrl + 'editcategory'; //.
final String editSubCategoryUrl = mainUrl + 'editsubcategory'; //.

//Profile
final String getProfileUrl = mainUrl + 'vendorgetprofile'; //.
final String editProfileUrl = mainUrl + 'vendoreditprofile'; //.
final String changePasswordUrl = mainUrl + 'vendorchangepassword'; //.

//Settings
final String couponsListUrl = mainUrl + 'getvendorcouponlist'; //.
final String getBankListUrl = mainUrl + 'getvendorbanklist'; //*error
final String getUpiListUrl = mainUrl + 'getvendorupilist'; //*error
final String addVendorBankUrl = mainUrl + 'addvendorbank'; //
final String addVendorUpiUrl = mainUrl + 'addvendorupi'; //.
final String updateStoreStatusUrl = mainUrl + 'updatevendorstatus'; //.
final String addTaxUrl = mainUrl + 'addvendortax'; //.
final String taxListUrl = mainUrl + 'getvendortaxlist'; //.
final String setDeliveryDistanceUrl = mainUrl + 'setdeliverydistance'; //.
final String updatePreOrderStatusUrl = mainUrl + 'updatepreorderstatus'; //.
final String addCouponUrl = mainUrl + 'addvendorcoupon'; //.
final String updateStoreDetailsUrl = mainUrl + 'updatestoredetail'; //
final String updateStoreImagesUrl = mainUrl + 'updatestoreimages'; //*error//
final String setPrintSettingUrl = mainUrl + 'setprintsetting'; //*error
final String vendorUploadDocument = mainUrl + 'vendoruploaddocument'; //*error
final String addProductUrl = mainUrl + 'addproduct'; //*error
// final String getPlansListUrl = mainUrl + 'getPlansList';//*argument error plan type not there

final String getVendorPayoutUrl = mainUrl + 'createPayoutRequest'; //working
final String getVendorPayoutList = mainUrl + 'getvendorpayoutlist'; //working

final String getVendorProductUnitsUrl = mainUrl + 'get-productunits'; //error
final String getVendorSponsoredPlansUrl = mainUrl + 'get-vendorsponsoredplans';
final String getVendorCategoriesUrl = mainUrl + 'get-vendorcategories'; //error
final String getCouponsUrl = mainUrl + 'get-coupons'; //error
final String getFaqUrl = mainUrl + 'get-faq'; //error
final String getVendorInvoiceDetail = mainUrl + 'getvendorinvoicedetails';
final String getVendorInvoices = mainUrl + 'getvendorinvoices';
final String getVendorProductsUrl = mainUrl + 'getvendorproducts';
final String deleteCategoryUrl = mainUrl + 'deletecategory';
final String deleteSubCategoryUrl = mainUrl + 'deletesubcategory';

final String updateSubCategoryUrl = mainUrl + 'editsubcategory';



//***Working API ***//
// Vendor Sign Up
// Vendor OTP Verification

// Vendor Sign In
// Vendor Save Store Loccation


// Get Vendor Profile
// Vendor Edit Profile



// Update Store Detail

//******//
// login, sign up error because of no response from server
// cannot implement savefcm api because firebase is not initialized
// cleared edit category error
// ADD prodouct api error
// edit category and sub category api error getting url and need to send file in response to edit
// delete category and sub category api not there
// update store image api error
// store location maps not implemented to get lat long

// Error:

// Set Print Setting
// Update Store Images
// Set Delivery Distance


// Add Product
// Vendor Upload Document

// Update Pre Order Status
// Update Vendor Status
// Edit Category
// Edit Sub Category



//no api:
//save shipping setting
// pay invoice

// Missing Connections:
// Get domain TLD List
// Save Domain URL
// Edit Product
// Add Product Attribute
// Add Product Attribute Variant
// Add Addon Product
// Edit Addon Product
// Get Product Attribute Variant List



// Not Found In Code:
// GET Vendor Product Units 
// GET Vendor Categories
//  GET Coupons
// Vendor Change Password



// Success :
// GET Vendor Payout
// Add Category
// Get Category List
// Add Vendor Tax
// Get Vendor Tax List
// Add Sub Category
// Get Sub Category List
// Vendor Save Store Info
// Add Vendor Bank Detail
// Add Vendor UPI Detail
// Get Vendor Coupon List
// Add Vendor Copon