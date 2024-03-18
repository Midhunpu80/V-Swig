import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:map_int/main.dart';
import 'package:map_int/view/utilities/colors.dart';
import 'package:uuid/uuid.dart';

class firbasestorage {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final FirebaseStorage _storage = FirebaseStorage.instance;
  Future<String> uploadimagefirebase(
    String childname,
    Uint8List file,
    bool ispost,
  ) async {
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

/////////////////////upload video//////////////

  Future<String> uploadVideo( String videoFile) async {
  
     String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference firebaseStorageRef = FirebaseStorage.instance
          .ref().child('allvideos')
          .child('video${fileName}mp4');
      // if (true) {
      //   String id = Uuid().v1();
      //   firebaseStorageRef = firebaseStorageRef.child(id);
      // }
      UploadTask uploadTask = firebaseStorageRef.putFile(File(videoFile));

      /////////////////////progress indicator for uploading video percentage ////////////////////////
      uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
        video_upload_controll.progress.value =
            (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
        print(
            'Upload progress: ${video_upload_controll.progress.value.toString()}%');
      });
      ///////////////////////////////////////////////////////////////
      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
      String downloadUrl = await taskSnapshot.ref.getDownloadURL();
      return downloadUrl;
    }
  }

