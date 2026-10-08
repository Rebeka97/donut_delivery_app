import 'package:bloc/bloc.dart';
import 'package:donut_repository/donut_repository.dart';
import 'package:equatable/equatable.dart';

part 'get_donut_event.dart';
part 'get_donut_state.dart';

class GetDonutBloc extends Bloc<GetDonutEvent, GetDonutState> {
  final DonutRepo _donutRepo;

  GetDonutBloc(this._donutRepo) : super(GetDonutInitial()) {
    on<GetDonut>((event, emit) async {
      emit(GetDonutLoading());
      await emit.forEach<List<Donut>>(
        _donutRepo.getDonuts(),
        onData: GetDonutSuccess.new,
        onError: (error, stackTrace) => GetDonutFailure(error.toString()),
      );
    });
  }
}
