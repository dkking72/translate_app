class LanguageModel {
  String languageCode;
  String languageName;

  LanguageModel({
    this.languageCode = "",
    this.languageName = "",
  });

  factory LanguageModel.fromJson(Map<String, dynamic> json) {
    return LanguageModel(
      languageCode: json['language'] ?? '',
      languageName: json['name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'language': languageCode,
        'name': languageName,
      };
}
