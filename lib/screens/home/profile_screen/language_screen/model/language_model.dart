class LanguageModel {
  String name;
  String code;
  String icon;
  bool isSelected;

  LanguageModel(this.name, this.code, this.icon, this.isSelected);

  static List<LanguageModel> get list => [
        LanguageModel("English", "en", "assets/icon/lan_english.png", true),
        // LanguageModel("Arabic", "ar", "assets/icon/lan_arabic.png", false),
        // LanguageModel("French", "fr", "assets/icon/lan_french.png", false),
        // LanguageModel("Spanish", "sp", "assets/icon/lan_spanish.png", false),
      ];
}
