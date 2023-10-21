import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login/state/appstate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';


final credentialsProvider = StateNotifierProvider<FirebaseLogin,AppState<dynamic>>((ref) => FirebaseLogin() );
final registrationProvider = StateNotifierProvider<FirebaseRegister,AppState<dynamic>>((ref) => FirebaseRegister());

class FirebaseRegister extends StateNotifier<AppState<dynamic>> {
  FirebaseRegister() :super(const AppState.initial());
  firebaseRegister(String userData,String passData) async{
    try {
      state =  const AppState.loading(loading: true);
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userData,
        password: passData,
        );
        state =  const AppState.loading(loading: false);
        state= const AppState.success(data: []);
        // HelperClass.email = userData;
        // HelperClass.password = passData;
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            state =  const AppState.loading(loading: false);
            state = const AppState.error(data: ['weak-password']);
            
            } else if (e.code == 'email-already-in-use') {
              state =  const AppState.loading(loading: false);
              state = const AppState.userError(data: ['email-already-in-use']);
              }
              }catch (e) {
                state =  const AppState.loading(loading: false);
                state = const AppState.firebaseError(data:['firebase-error']);
                }        
          }
      }

class FirebaseLogin extends StateNotifier<AppState<dynamic>>{
  FirebaseLogin():super(const AppState.initial());
  
  firebaseLogin(String email,String password) async {

    try{
      state =  const AppState.loading(loading: true);
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
        );
        state =  const AppState.loading(loading: false);
        state= const AppState.success(data: []);
        Get.toNamed("/homepage",arguments: email);
        }on FirebaseAuthException catch (e){
          if(e.code == 'user-not-found'){
            state =  const AppState.loading(loading: false);
            state = const AppState.userError(data: ['user-not-found']);
          }else if(e.code == 'wrong-password'){
            state =  const AppState.loading(loading: false);
            state = const AppState.error(data: ['wrong-password']);
          }
    }catch (e) {
     
      state =  const AppState.loading(loading: false);
      state = const AppState.firebaseError(data:['firebase-error']);
    }
  }
  
}

final emailProvider = StateNotifierProvider<HelperEmail,String>((ref) {
  return HelperEmail();
});

class HelperEmail extends StateNotifier<String> {
  HelperEmail() : super('');
  void getEmail(String userData) => state= userData;
}

