import '../../constants/firebase_const.dart';

class UserRepository {
  static Future<void> loginByUid(String uid) async {
    var data = await firebaseFirestore
        .collection('Users')
        .where('uid', isEqualTo: uid)
        .get();

    if (data.size == 0) {
      return;
    } else {
      //return UserModel.fromDocumentSnapshot(documentSnapshot: data);
    }
  }
}
