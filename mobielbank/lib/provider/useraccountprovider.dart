import 'package:flutter/cupertino.dart';
import 'package:mobielbank/model/useraccount.dart';
import 'package:mobielbank/provider/dioprovider.dart';
import 'package:riverpod/riverpod.dart';

final accountListProvider = FutureProvider.autoDispose<List<Accounts>>(
  (ref) {
    return UserAccounProvider(ref).useraccountList();
  },
);

class UserAccounProvider {
  Ref ref;

  UserAccounProvider(this.ref);

  Future<List<Accounts>> useraccountList() async {
    try {
      final response = await ref.read(dioProvider).get('http://localhost:7082/user/accounts');
      if (response.data != null && response.data.toString().isNotEmpty) {   
        debugPrint(response.data.toString());
        UserAccounts user = UserAccounts.fromJson(response.data);   
        if(user.success ==true) {
          return user.accounts.toList();
        }else{
          return [];
        }  
      } else {
        return [];
      }
    } on Error catch (error) {
      debugPrint("Error $error");
      rethrow;
    }
  }
}


final accountDataProvider = StateNotifierProvider<AccountData,Map<dynamic,dynamic>>((ref) {
  return AccountData();
});

class AccountData extends StateNotifier<Map<dynamic,dynamic>> {
  AccountData() : super({"type":"Salary Account","number":"select account","primary":"Type"});
  void getAccountData(Map<dynamic,dynamic> accountData) => state=accountData ;
}