import 'package:flutter/cupertino.dart';
import 'package:mobielbank/model/pinoptions.dart';
import 'package:mobielbank/provider/dioprovider.dart';
import 'package:riverpod/riverpod.dart';

final pinOptionProvider = FutureProvider.autoDispose<List<Options>>(
  (ref) {
    return PinOptionDataProvider(ref).pinOptionDataList();
  },
);

class PinOptionDataProvider {
  Ref ref;

  PinOptionDataProvider(this.ref);

  Future<List<Options>> pinOptionDataList() async {
    try {
      final response = await ref.read(dioProvider).get('http://localhost:7082/pin/options');
      if (response.data != null && response.data.toString().isNotEmpty) {   
        debugPrint(response.data.toString());
        PinOptions pinOptions = PinOptions.fromJson(response.data);   
        if(pinOptions.success ==true) {
          return pinOptions.options.toList();
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


final pinDataProvider = StateNotifierProvider<PinData,Map<dynamic,dynamic>>((ref) {
  return PinData();
});

class PinData extends StateNotifier<Map<dynamic,dynamic>> {
  PinData() : super({"name":"","code":"","info":""});
  void getPinData(Map<dynamic,dynamic> pinData) => state=pinData ;
}
