class SettingModel {
  late String name;
  late String flag;
  late String icon;

  SettingModel(this.name, this.flag, this.icon);

  static List<SettingModel> get settingList => [
        SettingModel("Store Details", "store_details",
            "assets/icon/setting_icon/shop.png"),
        SettingModel("Change Store Images", "store_image",
            "assets/icon/setting_icon/gallery.png"),
        SettingModel("Change Location of Store", "store_location",
            "assets/icon/setting_icon/location.png"),
        SettingModel("Change URL", "store_change_url",
            "assets/icon/setting_icon/url.png"),
        SettingModel("Bank/UPI Details", "bank_details",
            "assets/icon/setting_icon/cards.png"),
        SettingModel(
            "Payouts", "pay_out_screen", "assets/icon/setting_icon/shapes.png"),
        SettingModel("Upload Documents ", "upload_document",
            "assets/icon/setting_icon/document-upload.png"),
        SettingModel("View Reports ", "view_repost",
            "assets/icon/setting_icon/document-text.png"),
        SettingModel("Close & Delete Store", "close_store",
            "assets/icon/setting_icon/clipboard-close.png"),
        SettingModel("Delivery Distance", "delivery_distance",
            "assets/icon/setting_icon/truck-fast.png"),
        SettingModel("Sponsored & Featured", "sponsored_screen",
            "assets/icon/setting_icon/personalcard.png"),
        SettingModel("QR Code ", "qr_code", "assets/icon/setting_icon/scan.png"),
        SettingModel(
            "Print Settings", "print_settings", "assets/icon/setting_icon/printer.png"),
        SettingModel(
            "Chat with Admin  ", "chat_with_admin", "assets/icon/setting_icon/support.png"),
        SettingModel("Shop Timings", "shop_timings", "assets/icon/setting_icon/clock.png"),
        SettingModel("Pre Order", "pre_order", "assets/icon/setting_icon/bag-timer.png"),
        SettingModel(
            "My Invoices", "my_invoices", "assets/icon/setting_icon/receipt-text.png"),
        SettingModel(
            "Shipping Configuration", "shipping_configuration", "assets/icon/setting_icon/group.png"),
        SettingModel(
            "Add on Product", "add_on_product", "assets/icon/setting_icon/archive.png"),
        SettingModel("Coupons", "coupons", "assets/icon/setting_icon/gift.png"),
        SettingModel("Taxes", "taxes", "assets/icon/setting_icon/archive.png"),
      ];
}
