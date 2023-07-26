part of 'magic_ball_bloc.dart';

@freezed
class MagicBallEvent with _$MagicBallEvent {
  const factory MagicBallEvent.getFortuneRequested() = _GetFortuneRequested;
}
