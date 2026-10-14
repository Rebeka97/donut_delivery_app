part of 'get_donut_bloc.dart';

sealed class GetDonutEvent extends Equatable {
  const GetDonutEvent();

  @override
  List<Object> get props => [];
}

class GetDonut extends GetDonutEvent {}
