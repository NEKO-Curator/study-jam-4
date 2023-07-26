import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:surf_practice_magic_ball/api/ball_api_service.dart';

part 'magic_ball_state.dart';
part 'magic_ball_event.dart';
part 'magic_ball_bloc.freezed.dart';

class MagicBallBloc extends Bloc<MagicBallEvent, MagicBallState> {
  MagicBallBloc() : super(const _Initial()) {
    on<_GetFortuneRequested>((event, emit) async {
      emit(const MagicBallState.loading());
      try {
        String fortune = await ApiService().getRandomFortune();
        emit(MagicBallState.success(fortune));
      } catch (e) {
        emit(MagicBallState.failure(e.toString()));
      }
    });
  }
}
