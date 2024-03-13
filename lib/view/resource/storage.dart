import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class firbasestorage {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final FirebaseStorage _storage = FirebaseStorage.instance;
  Future<String> uploadimagefirebase(
      String childname, Uint8List file, bool ispost,) async {
    Reference ref =
        _storage.ref().child(childname).child(_auth.currentUser!.uid);
    if (ispost) {
      String id = Uuid().v1();
      ref = ref.child(id);
    }
    UploadTask task = ref.putData(file);
    TaskSnapshot snap = await task;
    String downloadurl = await snap.ref.getDownloadURL();
    return downloadurl;
  }
}
