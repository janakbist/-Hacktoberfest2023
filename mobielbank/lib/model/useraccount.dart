import 'package:freezed_annotation/freezed_annotation.dart';
// must be same as filename
part 'useraccount.g.dart';
part 'useraccount.freezed.dart';

@freezed
class UserAccounts with _$UserAccounts {

  const factory UserAccounts({
    @Default(false) bool success,
    @Default([]) List<Accounts> accounts,
    }) = _UserAccounts;
  factory UserAccounts.fromJson(Map<String, dynamic> json) => _$UserAccountsFromJson(json);
}

@freezed
class Accounts with _$Accounts {
  const factory Accounts({
     @Default("") String type,
     @Default("") String number,
     @Default("") String primary,
  }) = _Accounts;

  factory Accounts.fromJson(Map<String,dynamic> json) => _$AccountsFromJson(json);
}