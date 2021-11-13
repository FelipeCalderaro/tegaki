// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UserEventTearOff {
  const _$UserEventTearOff();

  UserEventLogin login(String token) {
    return UserEventLogin(
      token,
    );
  }

  UserEventReload reload() {
    return const UserEventReload();
  }

  UserEventInfoChanged infoChanged() {
    return const UserEventInfoChanged();
  }
}

/// @nodoc
const $UserEvent = _$UserEventTearOff();

/// @nodoc
mixin _$UserEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String token) login,
    required TResult Function() reload,
    required TResult Function() infoChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String token)? login,
    TResult Function()? reload,
    TResult Function()? infoChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String token)? login,
    TResult Function()? reload,
    TResult Function()? infoChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserEventLogin value) login,
    required TResult Function(UserEventReload value) reload,
    required TResult Function(UserEventInfoChanged value) infoChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserEventLogin value)? login,
    TResult Function(UserEventReload value)? reload,
    TResult Function(UserEventInfoChanged value)? infoChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserEventLogin value)? login,
    TResult Function(UserEventReload value)? reload,
    TResult Function(UserEventInfoChanged value)? infoChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEventCopyWith<$Res> {
  factory $UserEventCopyWith(UserEvent value, $Res Function(UserEvent) then) =
      _$UserEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$UserEventCopyWithImpl<$Res> implements $UserEventCopyWith<$Res> {
  _$UserEventCopyWithImpl(this._value, this._then);

  final UserEvent _value;
  // ignore: unused_field
  final $Res Function(UserEvent) _then;
}

/// @nodoc
abstract class $UserEventLoginCopyWith<$Res> {
  factory $UserEventLoginCopyWith(
          UserEventLogin value, $Res Function(UserEventLogin) then) =
      _$UserEventLoginCopyWithImpl<$Res>;
  $Res call({String token});
}

/// @nodoc
class _$UserEventLoginCopyWithImpl<$Res> extends _$UserEventCopyWithImpl<$Res>
    implements $UserEventLoginCopyWith<$Res> {
  _$UserEventLoginCopyWithImpl(
      UserEventLogin _value, $Res Function(UserEventLogin) _then)
      : super(_value, (v) => _then(v as UserEventLogin));

  @override
  UserEventLogin get _value => super._value as UserEventLogin;

  @override
  $Res call({
    Object? token = freezed,
  }) {
    return _then(UserEventLogin(
      token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UserEventLogin implements UserEventLogin {
  const _$UserEventLogin(this.token);

  @override
  final String token;

  @override
  String toString() {
    return 'UserEvent.login(token: $token)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserEventLogin &&
            (identical(other.token, token) || other.token == token));
  }

  @override
  int get hashCode => Object.hash(runtimeType, token);

  @JsonKey(ignore: true)
  @override
  $UserEventLoginCopyWith<UserEventLogin> get copyWith =>
      _$UserEventLoginCopyWithImpl<UserEventLogin>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String token) login,
    required TResult Function() reload,
    required TResult Function() infoChanged,
  }) {
    return login(token);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String token)? login,
    TResult Function()? reload,
    TResult Function()? infoChanged,
  }) {
    return login?.call(token);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String token)? login,
    TResult Function()? reload,
    TResult Function()? infoChanged,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(token);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserEventLogin value) login,
    required TResult Function(UserEventReload value) reload,
    required TResult Function(UserEventInfoChanged value) infoChanged,
  }) {
    return login(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserEventLogin value)? login,
    TResult Function(UserEventReload value)? reload,
    TResult Function(UserEventInfoChanged value)? infoChanged,
  }) {
    return login?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserEventLogin value)? login,
    TResult Function(UserEventReload value)? reload,
    TResult Function(UserEventInfoChanged value)? infoChanged,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(this);
    }
    return orElse();
  }
}

abstract class UserEventLogin implements UserEvent {
  const factory UserEventLogin(String token) = _$UserEventLogin;

  String get token;
  @JsonKey(ignore: true)
  $UserEventLoginCopyWith<UserEventLogin> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEventReloadCopyWith<$Res> {
  factory $UserEventReloadCopyWith(
          UserEventReload value, $Res Function(UserEventReload) then) =
      _$UserEventReloadCopyWithImpl<$Res>;
}

/// @nodoc
class _$UserEventReloadCopyWithImpl<$Res> extends _$UserEventCopyWithImpl<$Res>
    implements $UserEventReloadCopyWith<$Res> {
  _$UserEventReloadCopyWithImpl(
      UserEventReload _value, $Res Function(UserEventReload) _then)
      : super(_value, (v) => _then(v as UserEventReload));

  @override
  UserEventReload get _value => super._value as UserEventReload;
}

/// @nodoc

class _$UserEventReload implements UserEventReload {
  const _$UserEventReload();

  @override
  String toString() {
    return 'UserEvent.reload()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is UserEventReload);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String token) login,
    required TResult Function() reload,
    required TResult Function() infoChanged,
  }) {
    return reload();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String token)? login,
    TResult Function()? reload,
    TResult Function()? infoChanged,
  }) {
    return reload?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String token)? login,
    TResult Function()? reload,
    TResult Function()? infoChanged,
    required TResult orElse(),
  }) {
    if (reload != null) {
      return reload();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserEventLogin value) login,
    required TResult Function(UserEventReload value) reload,
    required TResult Function(UserEventInfoChanged value) infoChanged,
  }) {
    return reload(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserEventLogin value)? login,
    TResult Function(UserEventReload value)? reload,
    TResult Function(UserEventInfoChanged value)? infoChanged,
  }) {
    return reload?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserEventLogin value)? login,
    TResult Function(UserEventReload value)? reload,
    TResult Function(UserEventInfoChanged value)? infoChanged,
    required TResult orElse(),
  }) {
    if (reload != null) {
      return reload(this);
    }
    return orElse();
  }
}

abstract class UserEventReload implements UserEvent {
  const factory UserEventReload() = _$UserEventReload;
}

/// @nodoc
abstract class $UserEventInfoChangedCopyWith<$Res> {
  factory $UserEventInfoChangedCopyWith(UserEventInfoChanged value,
          $Res Function(UserEventInfoChanged) then) =
      _$UserEventInfoChangedCopyWithImpl<$Res>;
}

/// @nodoc
class _$UserEventInfoChangedCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res>
    implements $UserEventInfoChangedCopyWith<$Res> {
  _$UserEventInfoChangedCopyWithImpl(
      UserEventInfoChanged _value, $Res Function(UserEventInfoChanged) _then)
      : super(_value, (v) => _then(v as UserEventInfoChanged));

  @override
  UserEventInfoChanged get _value => super._value as UserEventInfoChanged;
}

/// @nodoc

class _$UserEventInfoChanged implements UserEventInfoChanged {
  const _$UserEventInfoChanged();

  @override
  String toString() {
    return 'UserEvent.infoChanged()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is UserEventInfoChanged);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String token) login,
    required TResult Function() reload,
    required TResult Function() infoChanged,
  }) {
    return infoChanged();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String token)? login,
    TResult Function()? reload,
    TResult Function()? infoChanged,
  }) {
    return infoChanged?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String token)? login,
    TResult Function()? reload,
    TResult Function()? infoChanged,
    required TResult orElse(),
  }) {
    if (infoChanged != null) {
      return infoChanged();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserEventLogin value) login,
    required TResult Function(UserEventReload value) reload,
    required TResult Function(UserEventInfoChanged value) infoChanged,
  }) {
    return infoChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserEventLogin value)? login,
    TResult Function(UserEventReload value)? reload,
    TResult Function(UserEventInfoChanged value)? infoChanged,
  }) {
    return infoChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserEventLogin value)? login,
    TResult Function(UserEventReload value)? reload,
    TResult Function(UserEventInfoChanged value)? infoChanged,
    required TResult orElse(),
  }) {
    if (infoChanged != null) {
      return infoChanged(this);
    }
    return orElse();
  }
}

abstract class UserEventInfoChanged implements UserEvent {
  const factory UserEventInfoChanged() = _$UserEventInfoChanged;
}

/// @nodoc
class _$UserStateTearOff {
  const _$UserStateTearOff();

  UserStateNotLogged notLogged() {
    return const UserStateNotLogged();
  }

  UserStateLoading loading() {
    return const UserStateLoading();
  }

  UserStateLogged logged(PrimaryUser user) {
    return UserStateLogged(
      user,
    );
  }
}

/// @nodoc
const $UserState = _$UserStateTearOff();

/// @nodoc
mixin _$UserState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notLogged,
    required TResult Function() loading,
    required TResult Function(PrimaryUser user) logged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? notLogged,
    TResult Function()? loading,
    TResult Function(PrimaryUser user)? logged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notLogged,
    TResult Function()? loading,
    TResult Function(PrimaryUser user)? logged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserStateNotLogged value) notLogged,
    required TResult Function(UserStateLoading value) loading,
    required TResult Function(UserStateLogged value) logged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserStateNotLogged value)? notLogged,
    TResult Function(UserStateLoading value)? loading,
    TResult Function(UserStateLogged value)? logged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserStateNotLogged value)? notLogged,
    TResult Function(UserStateLoading value)? loading,
    TResult Function(UserStateLogged value)? logged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStateCopyWith<$Res> {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) then) =
      _$UserStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$UserStateCopyWithImpl<$Res> implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  final UserState _value;
  // ignore: unused_field
  final $Res Function(UserState) _then;
}

/// @nodoc
abstract class $UserStateNotLoggedCopyWith<$Res> {
  factory $UserStateNotLoggedCopyWith(
          UserStateNotLogged value, $Res Function(UserStateNotLogged) then) =
      _$UserStateNotLoggedCopyWithImpl<$Res>;
}

/// @nodoc
class _$UserStateNotLoggedCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res>
    implements $UserStateNotLoggedCopyWith<$Res> {
  _$UserStateNotLoggedCopyWithImpl(
      UserStateNotLogged _value, $Res Function(UserStateNotLogged) _then)
      : super(_value, (v) => _then(v as UserStateNotLogged));

  @override
  UserStateNotLogged get _value => super._value as UserStateNotLogged;
}

/// @nodoc

class _$UserStateNotLogged implements UserStateNotLogged {
  const _$UserStateNotLogged();

  @override
  String toString() {
    return 'UserState.notLogged()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is UserStateNotLogged);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notLogged,
    required TResult Function() loading,
    required TResult Function(PrimaryUser user) logged,
  }) {
    return notLogged();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? notLogged,
    TResult Function()? loading,
    TResult Function(PrimaryUser user)? logged,
  }) {
    return notLogged?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notLogged,
    TResult Function()? loading,
    TResult Function(PrimaryUser user)? logged,
    required TResult orElse(),
  }) {
    if (notLogged != null) {
      return notLogged();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserStateNotLogged value) notLogged,
    required TResult Function(UserStateLoading value) loading,
    required TResult Function(UserStateLogged value) logged,
  }) {
    return notLogged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserStateNotLogged value)? notLogged,
    TResult Function(UserStateLoading value)? loading,
    TResult Function(UserStateLogged value)? logged,
  }) {
    return notLogged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserStateNotLogged value)? notLogged,
    TResult Function(UserStateLoading value)? loading,
    TResult Function(UserStateLogged value)? logged,
    required TResult orElse(),
  }) {
    if (notLogged != null) {
      return notLogged(this);
    }
    return orElse();
  }
}

abstract class UserStateNotLogged implements UserState {
  const factory UserStateNotLogged() = _$UserStateNotLogged;
}

/// @nodoc
abstract class $UserStateLoadingCopyWith<$Res> {
  factory $UserStateLoadingCopyWith(
          UserStateLoading value, $Res Function(UserStateLoading) then) =
      _$UserStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$UserStateLoadingCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
    implements $UserStateLoadingCopyWith<$Res> {
  _$UserStateLoadingCopyWithImpl(
      UserStateLoading _value, $Res Function(UserStateLoading) _then)
      : super(_value, (v) => _then(v as UserStateLoading));

  @override
  UserStateLoading get _value => super._value as UserStateLoading;
}

/// @nodoc

class _$UserStateLoading implements UserStateLoading {
  const _$UserStateLoading();

  @override
  String toString() {
    return 'UserState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is UserStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notLogged,
    required TResult Function() loading,
    required TResult Function(PrimaryUser user) logged,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? notLogged,
    TResult Function()? loading,
    TResult Function(PrimaryUser user)? logged,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notLogged,
    TResult Function()? loading,
    TResult Function(PrimaryUser user)? logged,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserStateNotLogged value) notLogged,
    required TResult Function(UserStateLoading value) loading,
    required TResult Function(UserStateLogged value) logged,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserStateNotLogged value)? notLogged,
    TResult Function(UserStateLoading value)? loading,
    TResult Function(UserStateLogged value)? logged,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserStateNotLogged value)? notLogged,
    TResult Function(UserStateLoading value)? loading,
    TResult Function(UserStateLogged value)? logged,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class UserStateLoading implements UserState {
  const factory UserStateLoading() = _$UserStateLoading;
}

/// @nodoc
abstract class $UserStateLoggedCopyWith<$Res> {
  factory $UserStateLoggedCopyWith(
          UserStateLogged value, $Res Function(UserStateLogged) then) =
      _$UserStateLoggedCopyWithImpl<$Res>;
  $Res call({PrimaryUser user});
}

/// @nodoc
class _$UserStateLoggedCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
    implements $UserStateLoggedCopyWith<$Res> {
  _$UserStateLoggedCopyWithImpl(
      UserStateLogged _value, $Res Function(UserStateLogged) _then)
      : super(_value, (v) => _then(v as UserStateLogged));

  @override
  UserStateLogged get _value => super._value as UserStateLogged;

  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(UserStateLogged(
      user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as PrimaryUser,
    ));
  }
}

/// @nodoc

class _$UserStateLogged implements UserStateLogged {
  const _$UserStateLogged(this.user);

  @override
  final PrimaryUser user;

  @override
  String toString() {
    return 'UserState.logged(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserStateLogged &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  $UserStateLoggedCopyWith<UserStateLogged> get copyWith =>
      _$UserStateLoggedCopyWithImpl<UserStateLogged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notLogged,
    required TResult Function() loading,
    required TResult Function(PrimaryUser user) logged,
  }) {
    return logged(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? notLogged,
    TResult Function()? loading,
    TResult Function(PrimaryUser user)? logged,
  }) {
    return logged?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notLogged,
    TResult Function()? loading,
    TResult Function(PrimaryUser user)? logged,
    required TResult orElse(),
  }) {
    if (logged != null) {
      return logged(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserStateNotLogged value) notLogged,
    required TResult Function(UserStateLoading value) loading,
    required TResult Function(UserStateLogged value) logged,
  }) {
    return logged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserStateNotLogged value)? notLogged,
    TResult Function(UserStateLoading value)? loading,
    TResult Function(UserStateLogged value)? logged,
  }) {
    return logged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserStateNotLogged value)? notLogged,
    TResult Function(UserStateLoading value)? loading,
    TResult Function(UserStateLogged value)? logged,
    required TResult orElse(),
  }) {
    if (logged != null) {
      return logged(this);
    }
    return orElse();
  }
}

abstract class UserStateLogged implements UserState {
  const factory UserStateLogged(PrimaryUser user) = _$UserStateLogged;

  PrimaryUser get user;
  @JsonKey(ignore: true)
  $UserStateLoggedCopyWith<UserStateLogged> get copyWith =>
      throw _privateConstructorUsedError;
}
