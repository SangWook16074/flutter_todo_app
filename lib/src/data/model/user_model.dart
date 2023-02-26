class UserModel {
  String? uid;
  String? email;
  String? password;
  UserModel({
    required this.uid,
    required this.email,
    required this.password,
  });

  // UserModel.fromDocumentSnapshot({required QuerySnapshot querySnapshot}) {
  //   uid = (querySnapshot['uid'] == null)
  //       ? ''
  //       : querySnapshot['uid'].toString();
  // }
}
