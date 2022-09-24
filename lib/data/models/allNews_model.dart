class AllNewsModel {
  AllNewsModel({
    required this.code,
    required this.message,
    required this.data,
  });
  late final String code;
  late final String message;
  late final List<Data> data;

  AllNewsModel.fromJson(Map<String, dynamic> json){
    code = json['code'];
    message = json['message'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['message'] = message;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.date,
    required this.body,
    required this.imageUrl,
    required this.linkUrl,
    required this.title,
  });
  late final int id;
  late final String date;
  late final String body;
  late final String imageUrl;
  late final String linkUrl;
  late final String title;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    date = json['date'];
    body = json['body'];
    imageUrl = json['imageUrl'];
    linkUrl = json['linkUrl'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['date'] = date;
    _data['body'] = body;
    _data['imageUrl'] = imageUrl;
    _data['linkUrl'] = linkUrl;
    _data['title'] = title;
    return _data;
  }
}