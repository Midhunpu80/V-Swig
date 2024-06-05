// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:map_int/view/resource/storage.dart';
import 'package:map_int/view/user/screens/authentication/browse_or_signin.dart';
import 'package:map_int/view/user/screens/bottomnavigationscreen/bottomnavigationscreen.dart';
import 'package:map_int/view/user/service/admin_catogery_service.dart';
import 'package:map_int/view/user/service/authentication_service.dart';
import 'package:map_int/view/user/service/cartservice.dart';
import 'package:map_int/view/user/service/create_course_service.dart';
import 'package:map_int/view/user/service/search_service.dart';
import 'package:map_int/view/user/service/wishlist_service.dart';
import 'package:map_int/view_model/dropdown_controller/dropdown_controller.dart';
import 'package:map_int/view_model/imagepicker_controller/image_picker_controller.dart';
import 'package:map_int/view_model/imagepicker_controller/videoplayerappino.dart';
import 'package:map_int/view_model/mode_controller/mode_controller.dart';
import 'package:map_int/view_model/pagecontroller/pagecontroller.dart';
import 'package:map_int/view_model/search_catogery_controller/search_controller.dart';
import 'package:map_int/view_model/upload_video_controller.dart/upload_video_controller.dart';
import 'package:map_int/view_model/userdata_controller/userDate_controller%20.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  String stripeapikey =
      "pk_test_51PKxp9SEMCW1JXvqBaS0esV1sVFTfhWo3BDc2NnB1I0CJEusT66JTxWkOCzNKTV3mbWfYjeZx3k8yW9oEHpEmDTN00SuLkjp2C";
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // Stripe.publishableKey = stripeapikey.toString();

  // //Load our .env file that contains our Stripe Secret key
  // await dotenv.load(fileName: "assets/.env");

  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();

  //Assign publishable key to flutter_stripe

  String secret_ley =
      "sk_test_51PKxp9SEMCW1JXvqnBqrXe90vUKNurIbJzyKYDvo3BClEccy3G9zFaB53ymOHtb3g1bVUZBzhVgrdM8Aqi5xg1Re00T2gpAGSD";
}

final auth_controll = Get.put(authentication_service());

final page_controll = Get.put(pagecontroller());
final mode_controll = Get.put(mode_controller());
final userdatasz_controll = Get.put(user_data_controller());
final image_controller = Get.put(image_picker_controller());
firbasestorage firestore_controll = firbasestorage();
final admin_controll = Get.put(admin_catogery_service());
final dropdown_controll = Get.put(dropdown_controller());
final course_controll = create_course_servie();
final video_upload_controll = uploadvideo_controller();
final videoplayer_controll = videoplayer_controller();
final car_controll = Get.put(cart_servie());
final wishList_controll = Get.put(wishlist_service());
final search_controll = Get.put(search_controller());
final search_product_controll = Get.put(search_product_service());

///final total_controller = Get.put(total_cart_controller());

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
