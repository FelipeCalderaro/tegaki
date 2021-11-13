part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.login(String token) = UserEventLogin;
  const factory UserEvent.reload() = UserEventReload;
  const factory UserEvent.infoChanged() = UserEventInfoChanged;
}
