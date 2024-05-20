import 'package:blocwithapi/services/api_services.dart';
import 'package:flutter/material.dart';

import 'models/model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  List<PostModel> list = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getdata();
  }

  void getdata() async {
    List<PostModel> temp = [];
    try {
      temp = await ApiService().FetchData();
    } catch (e) {
      print(e.toString());
    }
    setState(() {
      list = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
                leading: Text(
                  list[index].id.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                title: Text(
                  list[index].title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(list[index].body),
                trailing: IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Colors.redAccent,
                  ),
                  onPressed: () {},
                )),
          );
        },
      ),
    );
  }
}
