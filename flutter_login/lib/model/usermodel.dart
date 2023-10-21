import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String? name;
  final String? email;
  final int? age;

  const UserModel({
    this.id,
    required this.age,
    required this.email,
    required this.name
    });

    toJson() {
      return {
      "name" : name,
      "email" : email,
      "age" : age,
      };
    }

    factory UserModel.fromSnapshot(DocumentSnapshot<Map<dynamic,dynamic>> mapSnapshot) {
      var data = mapSnapshot.data() as Map<String,dynamic>;
      return UserModel(
        id: mapSnapshot.id,
        age: data['age'], 
        email: data["email"],
        name: data["name"],
        );
    }

  
    

  
}