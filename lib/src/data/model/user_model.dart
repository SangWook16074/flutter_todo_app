class UserModel {
  String? uid;

  UserModel({required this.uid});

  // UserModel.fromDocumentSnapshot({required QuerySnapshot querySnapshot}) {
  //   uid = (querySnapshot['uid'] == null)
  //       ? ''
  //       : querySnapshot['uid'].toString();
  // }
}
