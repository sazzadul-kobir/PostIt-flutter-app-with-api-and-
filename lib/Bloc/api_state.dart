

import 'package:equatable/equatable.dart';

import '../models/model.dart';

 class ApiState extends Equatable{
  final List<PostModel> list;
  final String errorMessage;
  ApiState({this.list=const[],this.errorMessage=''});

  ApiState copyFrom(List<PostModel>? list,String? errorMessage){
    return ApiState(
      list: list??this.list,
      errorMessage: errorMessage??this.errorMessage,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [list,errorMessage];

}

