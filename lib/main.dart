import 'package:blocwithapi/services/api_services.dart';
import 'package:flutter/material.dart';

import 'models/model.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

   List<PostModel> list=[];

  @override
  void initState()  {
    // TODO: implement initState
    super.initState();

    getdata();


  }

  void getdata() async{
    List<PostModel> temp=[];
    try {
       temp=await ApiService().FetchData();
    }catch(e){
      print(e.toString());
    }
    setState(() {
      list=temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
              return ListTile(
                leading: Text(list[index].id.toString()),
              );
              },),
    );
  }
}
