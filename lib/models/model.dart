class PostModel{
  int id;
  String title;
  String body;


  PostModel({required this.id,required this.title,required this.body});


  factory PostModel.fromjson(Map<String,dynamic> json){
    return PostModel(
        id: json['id'],
        title: json['title'],
        body: json['body']
    );
  }

}