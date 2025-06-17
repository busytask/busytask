class AdgemModel {
  AdgemModel({
    String? status,
    List<Datag>? data,
  }) {
    _status = status;
    _data = data;
  }

  AdgemModel.fromJson(dynamic json) {
    _status = json['status'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Datag.fromJson(v));
      });
    }
  }
  String? _status;
  List<Datag>? _data;

  String? get status => _status;
  List<Datag>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Datag {
  Datag({
    Wall? wall,
    List<Data>? data,
  }) {
    _wall = wall;
    _data = data;
  }

  Datag.fromJson(dynamic json) {
    _wall = json['wall'] != null ? Wall.fromJson(json['wall']) : null;
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  Wall? _wall;
  List<Data>? _data;

  Wall? get wall => _wall;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_wall != null) {
      map['wall'] = _wall?.toJson();
    }
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Data {
  Data({
    int? campaignId,
    dynamic storeId,
    String? trackingType,
    String? epc,
    String? icon,
    String? name,
    String? url,
    String? instructions,
    String? description,
    String? disclaimer,
    String? shortDescription,
    String? category1,
    dynamic category2,
    int? amount,
    bool? renderSticker,
    String? offerStickerText1,
    dynamic offerStickerText2,
    dynamic offerStickerText3,
    String? offerStickerColor1,
    String? offerStickerColor2,
    String? offerStickerColor3,
  }) {
    _campaignId = campaignId;
    _storeId = storeId;
    _trackingType = trackingType;
    _epc = epc;
    _icon = icon;
    _name = name;
    _url = url;
    _instructions = instructions;
    _description = description;
    _disclaimer = disclaimer;
    _shortDescription = shortDescription;
    _category1 = category1;
    _category2 = category2;
    _amount = amount;
    _renderSticker = renderSticker;
    _offerStickerText1 = offerStickerText1;
    _offerStickerText2 = offerStickerText2;
    _offerStickerText3 = offerStickerText3;
    _offerStickerColor1 = offerStickerColor1;
    _offerStickerColor2 = offerStickerColor2;
    _offerStickerColor3 = offerStickerColor3;
  }

  Data.fromJson(dynamic json) {
    _campaignId = json['campaign_id'];
    _storeId = json['store_id'];
    _trackingType = json['tracking_type'];
    _epc = json['epc'];
    _icon = json['icon'];
    _name = json['name'];
    _url = json['url'];
    _instructions = json['instructions'];
    _description = json['description'];
    _disclaimer = json['disclaimer'];
    _shortDescription = json['short_description'];
    _category1 = json['category_1'];
    _category2 = json['category_2'];
    _amount = json['amount'];
    _renderSticker = json['render_sticker'];
    _offerStickerText1 = json['offer_sticker_text_1'];
    _offerStickerText2 = json['offer_sticker_text_2'];
    _offerStickerText3 = json['offer_sticker_text_3'];
    _offerStickerColor1 = json['offer_sticker_color_1'];
    _offerStickerColor2 = json['offer_sticker_color_2'];
    _offerStickerColor3 = json['offer_sticker_color_3'];
  }
  int? _campaignId;
  dynamic _storeId;
  String? _trackingType;
  String? _epc;
  String? _icon;
  String? _name;
  String? _url;
  String? _instructions;
  String? _description;
  String? _disclaimer;
  String? _shortDescription;
  String? _category1;
  dynamic _category2;
  int? _amount;
  bool? _renderSticker;
  String? _offerStickerText1;
  dynamic _offerStickerText2;
  dynamic _offerStickerText3;
  String? _offerStickerColor1;
  String? _offerStickerColor2;
  String? _offerStickerColor3;

  int? get campaignId => _campaignId;
  dynamic get storeId => _storeId;
  String? get trackingType => _trackingType;
  String? get epc => _epc;
  String? get icon => _icon;
  String? get name => _name;
  String? get url => _url;
  String? get instructions => _instructions;
  String? get description => _description;
  String? get disclaimer => _disclaimer;
  String? get shortDescription => _shortDescription;
  String? get category1 => _category1;
  dynamic get category2 => _category2;
  int? get amount => _amount;
  bool? get renderSticker => _renderSticker;
  String? get offerStickerText1 => _offerStickerText1;
  dynamic get offerStickerText2 => _offerStickerText2;
  dynamic get offerStickerText3 => _offerStickerText3;
  String? get offerStickerColor1 => _offerStickerColor1;
  String? get offerStickerColor2 => _offerStickerColor2;
  String? get offerStickerColor3 => _offerStickerColor3;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['campaign_id'] = _campaignId;
    map['store_id'] = _storeId;
    map['tracking_type'] = _trackingType;
    map['epc'] = _epc;
    map['icon'] = _icon;
    map['name'] = _name;
    map['url'] = _url;
    map['instructions'] = _instructions;
    map['description'] = _description;
    map['disclaimer'] = _disclaimer;
    map['short_description'] = _shortDescription;
    map['category_1'] = _category1;
    map['category_2'] = _category2;
    map['amount'] = _amount;
    map['render_sticker'] = _renderSticker;
    map['offer_sticker_text_1'] = _offerStickerText1;
    map['offer_sticker_text_2'] = _offerStickerText2;
    map['offer_sticker_text_3'] = _offerStickerText3;
    map['offer_sticker_color_1'] = _offerStickerColor1;
    map['offer_sticker_color_2'] = _offerStickerColor2;
    map['offer_sticker_color_3'] = _offerStickerColor3;
    return map;
  }
}

class Wall {
  Wall({
    int? id,
    String? title,
    String? hex,
    String? buttonAccentColor,
    String? buttonFontColor,
    dynamic headerImage,
    String? currencyNameSingular,
    String? currencyNamePlural,
    String? currencyImage,
    int? multiplier,
    String? offerFilterSetting,
    String? categoryFilter,
    int? appId,
  }) {
    _id = id;
    _title = title;
    _hex = hex;
    _buttonAccentColor = buttonAccentColor;
    _buttonFontColor = buttonFontColor;
    _headerImage = headerImage;
    _currencyNameSingular = currencyNameSingular;
    _currencyNamePlural = currencyNamePlural;
    _currencyImage = currencyImage;
    _multiplier = multiplier;
    _offerFilterSetting = offerFilterSetting;
    _categoryFilter = categoryFilter;
    _appId = appId;
  }

  Wall.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _hex = json['hex'];
    _buttonAccentColor = json['button_accent_color'];
    _buttonFontColor = json['button_font_color'];
    _headerImage = json['header_image'];
    _currencyNameSingular = json['currency_name_singular'];
    _currencyNamePlural = json['currency_name_plural'];
    _currencyImage = json['currency_image'];
    _multiplier = json['multiplier'];
    _offerFilterSetting = json['offer_filter_setting'];
    _categoryFilter = json['category_filter'];
    _appId = json['app_id'];
  }
  int? _id;
  String? _title;
  String? _hex;
  String? _buttonAccentColor;
  String? _buttonFontColor;
  dynamic _headerImage;
  String? _currencyNameSingular;
  String? _currencyNamePlural;
  String? _currencyImage;
  int? _multiplier;
  String? _offerFilterSetting;
  String? _categoryFilter;
  int? _appId;

  int? get id => _id;
  String? get title => _title;
  String? get hex => _hex;
  String? get buttonAccentColor => _buttonAccentColor;
  String? get buttonFontColor => _buttonFontColor;
  dynamic get headerImage => _headerImage;
  String? get currencyNameSingular => _currencyNameSingular;
  String? get currencyNamePlural => _currencyNamePlural;
  String? get currencyImage => _currencyImage;
  int? get multiplier => _multiplier;
  String? get offerFilterSetting => _offerFilterSetting;
  String? get categoryFilter => _categoryFilter;
  int? get appId => _appId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['hex'] = _hex;
    map['button_accent_color'] = _buttonAccentColor;
    map['button_font_color'] = _buttonFontColor;
    map['header_image'] = _headerImage;
    map['currency_name_singular'] = _currencyNameSingular;
    map['currency_name_plural'] = _currencyNamePlural;
    map['currency_image'] = _currencyImage;
    map['multiplier'] = _multiplier;
    map['offer_filter_setting'] = _offerFilterSetting;
    map['category_filter'] = _categoryFilter;
    map['app_id'] = _appId;
    return map;
  }
}
