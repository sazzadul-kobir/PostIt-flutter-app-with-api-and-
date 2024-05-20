

import 'package:bloc/bloc.dart';
import 'package:blocwithapi/services/api_services.dart';

import '../models/model.dart';
import 'api_event.dart';
import 'api_state.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {

  List<PostModel> list=[];

  ApiBloc() : super(ApiState()) {
    on<FetchDataEvent>((event, emit) async{
      try{
        list=await ApiService().FetchData();
        emit(ApiState(list: List.from(list)));
      }catch(e){
        emit(ApiState(errorMessage: e.toString()));
      }
    });

    on<DeletePostEvent>((event, emit) async{
      list.removeAt(event.index);
      emit(ApiState(list: List.from(list)));
    });

  }
}
