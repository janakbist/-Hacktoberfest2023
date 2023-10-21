// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'useraccount.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserAccounts _$$_UserAccountsFromJson(Map<String, dynamic> json) =>
    _$_UserAccounts(
      success: json['success'] as bool? ?? false,
      accounts: (json['accounts'] as List<dynamic>?)
              ?.map((e) => Accounts.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_UserAccountsToJson(_$_UserAccounts instance) =>
    <String, dynamic>{
      'success': instance.success,
      'accounts': instance.accounts,
    };

_$_Accounts _$$_AccountsFromJson(Map<String, dynamic> json) => _$_Accounts(
      type: json['type'] as String? ?? "",
      number: json['number'] as String? ?? "",
      primary: json['primary'] as String? ?? "",
    );

Map<String, dynamic> _$$_AccountsToJson(_$_Accounts instance) =>
    <String, dynamic>{
      'type': instance.type,
      'number': instance.number,
      'primary': instance.primary,
    };
