part of 'user_bloc.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.notLogged() = UserStateNotLogged;
  const factory UserState.loading() = UserStateLoading;
  const factory UserState.logged(PrimaryUser user) = UserStateLogged;
}
