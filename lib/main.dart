import 'package:blocwithapi/Bloc/api_bloc.dart';
import 'package:blocwithapi/Bloc/api_event.dart';
import 'package:blocwithapi/Bloc/api_state.dart';
import 'package:blocwithapi/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'models/model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ApiBloc()..add(FetchDataEvent()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ApiBloc, ApiState>(
        builder: (context, state) {
          if(state.list.isEmpty){
           return Center(child: CircularProgressIndicator());
          }else{
            return ListView.builder(
              itemCount: state.list.length,
              itemBuilder: (context, index) {
                PostModel postModel=state.list[index];

                return Card(
                  child: ListTile(
                      leading: Text(
                        postModel.id.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      title: Text(
                        postModel.title,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(postModel.body),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.redAccent,
                        ),
                        onPressed: () {
                          context.read<ApiBloc>().add(DeletePostEvent(index));
                        },
                      )),
                );
              },
            );
          }
        },
      ),
    );
  }
}
