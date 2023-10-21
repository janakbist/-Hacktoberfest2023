// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'branchemodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BrancheModel _$BrancheModelFromJson(Map<String, dynamic> json) {
  return _BrancheModel.fromJson(json);
}

/// @nodoc
mixin _$BrancheModel {
  bool get success => throw _privateConstructorUsedError;
  List<Branches> get branches => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BrancheModelCopyWith<BrancheModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BrancheModelCopyWith<$Res> {
  factory $BrancheModelCopyWith(
          BrancheModel value, $Res Function(BrancheModel) then) =
      _$BrancheModelCopyWithImpl<$Res, BrancheModel>;
  @useResult
  $Res call({bool success, List<Branches> branches});
}

/// @nodoc
class _$BrancheModelCopyWithImpl<$Res, $Val extends BrancheModel>
    implements $BrancheModelCopyWith<$Res> {
  _$BrancheModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? branches = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      branches: null == branches
          ? _value.branches
          : branches // ignore: cast_nullable_to_non_nullable
              as List<Branches>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BrancheModelCopyWith<$Res>
    implements $BrancheModelCopyWith<$Res> {
  factory _$$_BrancheModelCopyWith(
          _$_BrancheModel value, $Res Function(_$_BrancheModel) then) =
      __$$_BrancheModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, List<Branches> branches});
}

/// @nodoc
class __$$_BrancheModelCopyWithImpl<$Res>
    extends _$BrancheModelCopyWithImpl<$Res, _$_BrancheModel>
    implements _$$_BrancheModelCopyWith<$Res> {
  __$$_BrancheModelCopyWithImpl(
      _$_BrancheModel _value, $Res Function(_$_BrancheModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? branches = null,
  }) {
    return _then(_$_BrancheModel(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      branches: null == branches
          ? _value._branches
          : branches // ignore: cast_nullable_to_non_nullable
              as List<Branches>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BrancheModel implements _BrancheModel {
  const _$_BrancheModel(
      {this.success = false, final List<Branches> branches = const []})
      : _branches = branches;

  factory _$_BrancheModel.fromJson(Map<String, dynamic> json) =>
      _$$_BrancheModelFromJson(json);

  @override
  @JsonKey()
  final bool success;
  final List<Branches> _branches;
  @override
  @JsonKey()
  List<Branches> get branches {
    if (_branches is EqualUnmodifiableListView) return _branches;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_branches);
  }

  @override
  String toString() {
    return 'BrancheModel(success: $success, branches: $branches)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BrancheModel &&
            (identical(other.success, success) || other.success == success) &&
            const DeepCollectionEquality().equals(other._branches, _branches));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, success, const DeepCollectionEquality().hash(_branches));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BrancheModelCopyWith<_$_BrancheModel> get copyWith =>
      __$$_BrancheModelCopyWithImpl<_$_BrancheModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BrancheModelToJson(
      this,
    );
  }
}

abstract class _BrancheModel implements BrancheModel {
  const factory _BrancheModel(
      {final bool success, final List<Branches> branches}) = _$_BrancheModel;

  factory _BrancheModel.fromJson(Map<String, dynamic> json) =
      _$_BrancheModel.fromJson;

  @override
  bool get success;
  @override
  List<Branches> get branches;
  @override
  @JsonKey(ignore: true)
  _$$_BrancheModelCopyWith<_$_BrancheModel> get copyWith =>
      throw _privateConstructorUsedError;
}

Branches _$BranchesFromJson(Map<String, dynamic> json) {
  return _Branches.fromJson(json);
}

/// @nodoc
mixin _$Branches {
  String get name => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BranchesCopyWith<Branches> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BranchesCopyWith<$Res> {
  factory $BranchesCopyWith(Branches value, $Res Function(Branches) then) =
      _$BranchesCopyWithImpl<$Res, Branches>;
  @useResult
  $Res call({String name, String code});
}

/// @nodoc
class _$BranchesCopyWithImpl<$Res, $Val extends Branches>
    implements $BranchesCopyWith<$Res> {
  _$BranchesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? code = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BranchesCopyWith<$Res> implements $BranchesCopyWith<$Res> {
  factory _$$_BranchesCopyWith(
          _$_Branches value, $Res Function(_$_Branches) then) =
      __$$_BranchesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String code});
}

/// @nodoc
class __$$_BranchesCopyWithImpl<$Res>
    extends _$BranchesCopyWithImpl<$Res, _$_Branches>
    implements _$$_BranchesCopyWith<$Res> {
  __$$_BranchesCopyWithImpl(
      _$_Branches _value, $Res Function(_$_Branches) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? code = null,
  }) {
    return _then(_$_Branches(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Branches implements _Branches {
  const _$_Branches({this.name = "", this.code = ""});

  factory _$_Branches.fromJson(Map<String, dynamic> json) =>
      _$$_BranchesFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String code;

  @override
  String toString() {
    return 'Branches(name: $name, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Branches &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BranchesCopyWith<_$_Branches> get copyWith =>
      __$$_BranchesCopyWithImpl<_$_Branches>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BranchesToJson(
      this,
    );
  }
}

abstract class _Branches implements Branches {
  const factory _Branches({final String name, final String code}) = _$_Branches;

  factory _Branches.fromJson(Map<String, dynamic> json) = _$_Branches.fromJson;

  @override
  String get name;
  @override
  String get code;
  @override
  @JsonKey(ignore: true)
  _$$_BranchesCopyWith<_$_Branches> get copyWith =>
      throw _privateConstructorUsedError;
}
