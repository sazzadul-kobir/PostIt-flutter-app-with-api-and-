
import 'package:equatable/equatable.dart';

abstract class ApiEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FetchDataEvent extends ApiEvent{

}

class DeletePostEvent extends ApiEvent{
  final int index;

  DeletePostEvent( this.index);

  @override
  // TODO: implement props
  List<Object?> get props =>[index];
}

