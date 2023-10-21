// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pinoptions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PinOptions _$PinOptionsFromJson(Map<String, dynamic> json) {
  return _PinOptions.fromJson(json);
}

/// @nodoc
mixin _$PinOptions {
  bool get success => throw _privateConstructorUsedError;
  List<Options> get options => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PinOptionsCopyWith<PinOptions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PinOptionsCopyWith<$Res> {
  factory $PinOptionsCopyWith(
          PinOptions value, $Res Function(PinOptions) then) =
      _$PinOptionsCopyWithImpl<$Res, PinOptions>;
  @useResult
  $Res call({bool success, List<Options> options});
}

/// @nodoc
class _$PinOptionsCopyWithImpl<$Res, $Val extends PinOptions>
    implements $PinOptionsCopyWith<$Res> {
  _$PinOptionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? options = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      options: null == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<Options>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PinOptionsCopyWith<$Res>
    implements $PinOptionsCopyWith<$Res> {
  factory _$$_PinOptionsCopyWith(
          _$_PinOptions value, $Res Function(_$_PinOptions) then) =
      __$$_PinOptionsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, List<Options> options});
}

/// @nodoc
class __$$_PinOptionsCopyWithImpl<$Res>
    extends _$PinOptionsCopyWithImpl<$Res, _$_PinOptions>
    implements _$$_PinOptionsCopyWith<$Res> {
  __$$_PinOptionsCopyWithImpl(
      _$_PinOptions _value, $Res Function(_$_PinOptions) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? options = null,
  }) {
    return _then(_$_PinOptions(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      options: null == options
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<Options>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PinOptions implements _PinOptions {
  const _$_PinOptions(
      {this.success = false, final List<Options> options = const []})
      : _options = options;

  factory _$_PinOptions.fromJson(Map<String, dynamic> json) =>
      _$$_PinOptionsFromJson(json);

  @override
  @JsonKey()
  final bool success;
  final List<Options> _options;
  @override
  @JsonKey()
  List<Options> get options {
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_options);
  }

  @override
  String toString() {
    return 'PinOptions(success: $success, options: $options)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PinOptions &&
            (identical(other.success, success) || other.success == success) &&
            const DeepCollectionEquality().equals(other._options, _options));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, success, const DeepCollectionEquality().hash(_options));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PinOptionsCopyWith<_$_PinOptions> get copyWith =>
      __$$_PinOptionsCopyWithImpl<_$_PinOptions>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PinOptionsToJson(
      this,
    );
  }
}

abstract class _PinOptions implements PinOptions {
  const factory _PinOptions({final bool success, final List<Options> options}) =
      _$_PinOptions;

  factory _PinOptions.fromJson(Map<String, dynamic> json) =
      _$_PinOptions.fromJson;

  @override
  bool get success;
  @override
  List<Options> get options;
  @override
  @JsonKey(ignore: true)
  _$$_PinOptionsCopyWith<_$_PinOptions> get copyWith =>
      throw _privateConstructorUsedError;
}

Options _$OptionsFromJson(Map<String, dynamic> json) {
  return _Options.fromJson(json);
}

/// @nodoc
mixin _$Options {
  String get name => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get info => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OptionsCopyWith<Options> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OptionsCopyWith<$Res> {
  factory $OptionsCopyWith(Options value, $Res Function(Options) then) =
      _$OptionsCopyWithImpl<$Res, Options>;
  @useResult
  $Res call({String name, String code, String info});
}

/// @nodoc
class _$OptionsCopyWithImpl<$Res, $Val extends Options>
    implements $OptionsCopyWith<$Res> {
  _$OptionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? code = null,
    Object? info = null,
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
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OptionsCopyWith<$Res> implements $OptionsCopyWith<$Res> {
  factory _$$_OptionsCopyWith(
          _$_Options value, $Res Function(_$_Options) then) =
      __$$_OptionsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String code, String info});
}

/// @nodoc
class __$$_OptionsCopyWithImpl<$Res>
    extends _$OptionsCopyWithImpl<$Res, _$_Options>
    implements _$$_OptionsCopyWith<$Res> {
  __$$_OptionsCopyWithImpl(_$_Options _value, $Res Function(_$_Options) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? code = null,
    Object? info = null,
  }) {
    return _then(_$_Options(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Options implements _Options {
  const _$_Options({this.name = "", this.code = "", this.info = ""});

  factory _$_Options.fromJson(Map<String, dynamic> json) =>
      _$$_OptionsFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String code;
  @override
  @JsonKey()
  final String info;

  @override
  String toString() {
    return 'Options(name: $name, code: $code, info: $info)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Options &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.info, info) || other.info == info));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, code, info);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OptionsCopyWith<_$_Options> get copyWith =>
      __$$_OptionsCopyWithImpl<_$_Options>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OptionsToJson(
      this,
    );
  }
}

abstract class _Options implements Options {
  const factory _Options(
      {final String name, final String code, final String info}) = _$_Options;

  factory _Options.fromJson(Map<String, dynamic> json) = _$_Options.fromJson;

  @override
  String get name;
  @override
  String get code;
  @override
  String get info;
  @override
  @JsonKey(ignore: true)
  _$$_OptionsCopyWith<_$_Options> get copyWith =>
      throw _privateConstructorUsedError;
}
