part of 'get_donut_bloc.dart';

sealed class GetDonutState extends Equatable {
  const GetDonutState();

  @override
  List<Object> get props => [];
}

final class GetDonutInitial extends GetDonutState {}

final class GetDonutLoading extends GetDonutState {}

final class GetDonutFailure extends GetDonutState {
  final String message;

  const GetDonutFailure(this.message);

  @override
  List<Object> get props => [message];
}

final class GetDonutSuccess extends GetDonutState {
  final List<Donut> donuts;

  const GetDonutSuccess(this.donuts);

  @override
  List<Object> get props => [donuts];
}
