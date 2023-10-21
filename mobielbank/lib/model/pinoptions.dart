import 'package:freezed_annotation/freezed_annotation.dart';
// must be same as filename
part 'pinoptions.g.dart';
part 'pinoptions.freezed.dart';

@freezed
class PinOptions with _$PinOptions {

  const factory PinOptions({
    @Default(false) bool success,
    @Default([]) List<Options> options,
    }) = _PinOptions;
  factory PinOptions.fromJson(Map<String, dynamic> json) => _$PinOptionsFromJson(json);
}

@freezed
class Options with _$Options{
  const factory Options({
     @Default("") String name,
     @Default("") String code,
     @Default("") String info,
  }) = _Options;

  factory Options.fromJson(Map<String,dynamic> json) => _$OptionsFromJson(json);
}