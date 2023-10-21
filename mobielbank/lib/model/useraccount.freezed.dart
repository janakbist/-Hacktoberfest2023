// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'useraccount.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserAccounts _$UserAccountsFromJson(Map<String, dynamic> json) {
  return _UserAccounts.fromJson(json);
}

/// @nodoc
mixin _$UserAccounts {
  bool get success => throw _privateConstructorUsedError;
  List<Accounts> get accounts => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserAccountsCopyWith<UserAccounts> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAccountsCopyWith<$Res> {
  factory $UserAccountsCopyWith(
          UserAccounts value, $Res Function(UserAccounts) then) =
      _$UserAccountsCopyWithImpl<$Res, UserAccounts>;
  @useResult
  $Res call({bool success, List<Accounts> accounts});
}

/// @nodoc
class _$UserAccountsCopyWithImpl<$Res, $Val extends UserAccounts>
    implements $UserAccountsCopyWith<$Res> {
  _$UserAccountsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? accounts = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      accounts: null == accounts
          ? _value.accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<Accounts>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserAccountsCopyWith<$Res>
    implements $UserAccountsCopyWith<$Res> {
  factory _$$_UserAccountsCopyWith(
          _$_UserAccounts value, $Res Function(_$_UserAccounts) then) =
      __$$_UserAccountsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, List<Accounts> accounts});
}

/// @nodoc
class __$$_UserAccountsCopyWithImpl<$Res>
    extends _$UserAccountsCopyWithImpl<$Res, _$_UserAccounts>
    implements _$$_UserAccountsCopyWith<$Res> {
  __$$_UserAccountsCopyWithImpl(
      _$_UserAccounts _value, $Res Function(_$_UserAccounts) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? accounts = null,
  }) {
    return _then(_$_UserAccounts(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      accounts: null == accounts
          ? _value._accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<Accounts>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserAccounts implements _UserAccounts {
  const _$_UserAccounts(
      {this.success = false, final List<Accounts> accounts = const []})
      : _accounts = accounts;

  factory _$_UserAccounts.fromJson(Map<String, dynamic> json) =>
      _$$_UserAccountsFromJson(json);

  @override
  @JsonKey()
  final bool success;
  final List<Accounts> _accounts;
  @override
  @JsonKey()
  List<Accounts> get accounts {
    if (_accounts is EqualUnmodifiableListView) return _accounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_accounts);
  }

  @override
  String toString() {
    return 'UserAccounts(success: $success, accounts: $accounts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserAccounts &&
            (identical(other.success, success) || other.success == success) &&
            const DeepCollectionEquality().equals(other._accounts, _accounts));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, success, const DeepCollectionEquality().hash(_accounts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserAccountsCopyWith<_$_UserAccounts> get copyWith =>
      __$$_UserAccountsCopyWithImpl<_$_UserAccounts>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserAccountsToJson(
      this,
    );
  }
}

abstract class _UserAccounts implements UserAccounts {
  const factory _UserAccounts(
      {final bool success, final List<Accounts> accounts}) = _$_UserAccounts;

  factory _UserAccounts.fromJson(Map<String, dynamic> json) =
      _$_UserAccounts.fromJson;

  @override
  bool get success;
  @override
  List<Accounts> get accounts;
  @override
  @JsonKey(ignore: true)
  _$$_UserAccountsCopyWith<_$_UserAccounts> get copyWith =>
      throw _privateConstructorUsedError;
}

Accounts _$AccountsFromJson(Map<String, dynamic> json) {
  return _Accounts.fromJson(json);
}

/// @nodoc
mixin _$Accounts {
  String get type => throw _privateConstructorUsedError;
  String get number => throw _privateConstructorUsedError;
  String get primary => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountsCopyWith<Accounts> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountsCopyWith<$Res> {
  factory $AccountsCopyWith(Accounts value, $Res Function(Accounts) then) =
      _$AccountsCopyWithImpl<$Res, Accounts>;
  @useResult
  $Res call({String type, String number, String primary});
}

/// @nodoc
class _$AccountsCopyWithImpl<$Res, $Val extends Accounts>
    implements $AccountsCopyWith<$Res> {
  _$AccountsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? number = null,
    Object? primary = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      primary: null == primary
          ? _value.primary
          : primary // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AccountsCopyWith<$Res> implements $AccountsCopyWith<$Res> {
  factory _$$_AccountsCopyWith(
          _$_Accounts value, $Res Function(_$_Accounts) then) =
      __$$_AccountsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type, String number, String primary});
}

/// @nodoc
class __$$_AccountsCopyWithImpl<$Res>
    extends _$AccountsCopyWithImpl<$Res, _$_Accounts>
    implements _$$_AccountsCopyWith<$Res> {
  __$$_AccountsCopyWithImpl(
      _$_Accounts _value, $Res Function(_$_Accounts) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? number = null,
    Object? primary = null,
  }) {
    return _then(_$_Accounts(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      primary: null == primary
          ? _value.primary
          : primary // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Accounts implements _Accounts {
  const _$_Accounts({this.type = "", this.number = "", this.primary = ""});

  factory _$_Accounts.fromJson(Map<String, dynamic> json) =>
      _$$_AccountsFromJson(json);

  @override
  @JsonKey()
  final String type;
  @override
  @JsonKey()
  final String number;
  @override
  @JsonKey()
  final String primary;

  @override
  String toString() {
    return 'Accounts(type: $type, number: $number, primary: $primary)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Accounts &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.primary, primary) || other.primary == primary));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, number, primary);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AccountsCopyWith<_$_Accounts> get copyWith =>
      __$$_AccountsCopyWithImpl<_$_Accounts>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AccountsToJson(
      this,
    );
  }
}

abstract class _Accounts implements Accounts {
  const factory _Accounts(
      {final String type,
      final String number,
      final String primary}) = _$_Accounts;

  factory _Accounts.fromJson(Map<String, dynamic> json) = _$_Accounts.fromJson;

  @override
  String get type;
  @override
  String get number;
  @override
  String get primary;
  @override
  @JsonKey(ignore: true)
  _$$_AccountsCopyWith<_$_Accounts> get copyWith =>
      throw _privateConstructorUsedError;
}
