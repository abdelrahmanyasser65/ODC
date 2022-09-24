class LecturesModel {

   String ?code;
   String ?message;
   List<Data> ?data;

  LecturesModel.fromJson(Map<String, dynamic> json){
    code = json['code'];
    message = json['message'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

}

class Data {

   int ?id;
   String ?lectureSubject;
   String ?lectureDate;
   String ?lectureStartTime;
   String ?lectureEndTime;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    lectureSubject = json['lectureSubject'];
    lectureDate = json['lectureDate'];
    lectureStartTime = json['lectureStartTime'];
    lectureEndTime = json['lectureEndTime'];
  }


}