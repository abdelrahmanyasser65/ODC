class ExamModel {
  ExamModel({
    required this.code,
    required this.message,
    required this.data,
  });
  late final String code;
  late final String message;
  late final List<Data> data;

  ExamModel.fromJson(Map<String, dynamic> json){
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
  required this.examSubject,
  required this.examDate,
  required this.examStartTime,
  required this.examEndTime,
  required this.fin,
});
late final int id;
late final String examSubject;
late final String examDate;
late final String examStartTime;
late final String examEndTime;
late final bool fin;

Data.fromJson(Map<String, dynamic> json){
id = json['id'];
examSubject = json['examSubject'];
examDate = json['examDate'];
examStartTime = json['examStartTime'];
examEndTime = json['examEndTime'];
fin = json['final'];
}

Map<String, dynamic> toJson() {
final _data = <String, dynamic>{};
_data['id'] = id;
_data['examSubject'] = examSubject;
_data['examDate'] = examDate;
_data['examStartTime'] = examStartTime;
_data['examEndTime'] = examEndTime;
_data['final'] = fin;
return _data;
}
}