// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_int/view/user/screens/authentication/browse_or_signin.dart';
import 'package:map_int/view/user/screens/bottomnavigationscreen/bottomnavigationscreen.dart';
import 'package:map_int/view/user/service/authentication_service.dart';
import 'package:map_int/view_model/mode_controller/mode_controller.dart';
import 'package:map_int/view_model/pagecontroller/pagecontroller.dart';
import 'package:map_int/view_model/userdata_controller/userDate_controller%20.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

final auth_controll = Get.put(authentication_service());

final page_controll = Get.put(pagecontroller());
final mode_controll = Get.put(mode_controller());
final userdatasz_controll = Get.put(user_data_controller());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (BuildContext, Orientation, DeviceType) {
      return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                return Scaffold(
                    body: snapshot.hasData
                        ? bottomnavigationbarscreen()
                        : browse_or_signinscreen());
              }));
    });
  }
}

// StreamBuilder(
//               stream: FirebaseAuth.instance.authStateChanges(),
//               builder: (context, snapshot) {
//                 return Scaffold(
//                     body: snapshot.hasData
//                         ? bottomnavscreen()
//                         : const log_or_reg_screen());
//               })

// StreamBuilder(
//           stream: FirebaseFirestore.instance
//               .collection('users')
//               .where("uid", isEqualTo: FirebaseAuth.instance.currentUser?.uid)
//               .snapshots(),
//           builder: (context, snapshots) {
//             print("${snapshots.data?.docs[1]["Name"]}");
//             return !snapshot.hasData?SizedBox():