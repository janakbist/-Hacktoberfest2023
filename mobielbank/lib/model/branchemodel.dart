import 'package:freezed_annotation/freezed_annotation.dart';
// must be same as filename
part 'branchemodel.g.dart';
part 'branchemodel.freezed.dart';

@freezed
class BrancheModel with _$BrancheModel {

  const factory BrancheModel({
    @Default(false) bool success,
    @Default([]) List<Branches> branches,
    }) = _BrancheModel;
  factory BrancheModel.fromJson(Map<String, dynamic> json) => _$BrancheModelFromJson(json);
}

@freezed
class Branches with _$Branches{
  const factory Branches({
     @Default("") String name,
     @Default("") String code,
  }) = _Branches;

  factory Branches.fromJson(Map<String,dynamic> json) => _$BranchesFromJson(json);
}