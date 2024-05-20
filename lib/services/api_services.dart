
import 'package:blocwithapi/models/model.dart';
import 'package:dio/dio.dart';

class ApiService{


  Future<List<PostModel>> FetchData() async{

      Response response=await Dio().get('https://jsonplaceholder.typicode.com/posts');
      if(response.statusCode==200) {
        return (response.data as List)
            .map((e) => PostModel.fromjson(e))
            .toList();
      }else {
        throw Exception("Data fetching problem");
      }
  }


}