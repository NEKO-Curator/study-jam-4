part of 'magic_ball_bloc.dart';

@freezed
class MagicBallState with _$MagicBallState {
  const factory MagicBallState.initial() = _Initial;
  const factory MagicBallState.loading() = _Loading;
  const factory MagicBallState.success(String fortune) = _Success;
  const factory MagicBallState.failure(String message) = _Failure;
}
