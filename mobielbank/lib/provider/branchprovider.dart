import 'package:flutter/cupertino.dart';
import 'package:mobielbank/model/branchemodel.dart';
import 'package:mobielbank/provider/dioprovider.dart';
import 'package:riverpod/riverpod.dart';

final branchListProvider = FutureProvider.autoDispose<List<Branches>>(
  (ref) {
    return BranchProvider(ref).branchList();
  },
);

class BranchProvider {
  Ref ref;

  BranchProvider(this.ref);

  Future<List<Branches>> branchList() async {
    try {
      final response = await ref.read(dioProvider).get('http://localhost:7082/branches');
      if (response.data != null && response.data.toString().isNotEmpty) {   
        debugPrint(response.data.toString());
        BrancheModel branches = BrancheModel.fromJson(response.data);
        if(branches.success ==true) {
          return branches.branches.toList();
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

final branchDataProvider = StateNotifierProvider<BranchData,Map<dynamic,dynamic>>((ref) {
  return BranchData();
});

class BranchData extends StateNotifier<Map<dynamic,dynamic>> {
  BranchData() : super({"name":"select branch","code":"code"});
  void getBranchData(Map<dynamic,dynamic> accountData) => state=accountData ;
}