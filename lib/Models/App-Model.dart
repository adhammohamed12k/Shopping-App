class AppModel
{
  Map<String,dynamic> status;
  AppModel({required this.status});
  factory AppModel.fromjson(Map<String ,dynamic>json)
  {
    return AppModel.fromjson(json['status']);
  }
}