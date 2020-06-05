import 'package:json_annotation/json_annotation.dart';

// part 'BannerModel.g.dart';

// @JsonSerializable()

class BannerModel {
  int id;
  String linkUrl;
  String urlImagem;

  BannerModel({this.id, this.linkUrl, this.urlImagem});

  // factory BannerModel.fromJson(Map<String, dynamic> json) => _$BannerModelFromJson(json);
  // Map<String, dynamic> toJson() => _$BannerModelToJson(this);

  BannerModel.fromJson(Map json)
      : id = json['id'],
        linkUrl = json['linkUrl'],
        urlImagem = json['urlImagem'];

  Map toJson(BannerModel banner) {
    return {
      'id': id,
      'linkUrl': linkUrl,
      'urlImagem': urlImagem,
    };
  }

}

class ResBanner {
  List<BannerModel> data;

  ResBanner({this.data});

  ResBanner.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<BannerModel>();
      json['data'].forEach((v) {
        data.add(new BannerModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    BannerModel bannerModel;
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson(bannerModel)).toList();
    }
    return data;
  }
}

