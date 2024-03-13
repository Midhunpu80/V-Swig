import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

var type;
var adminemail;

class user_data_controller extends GetxController {
  var userData = <DocumentSnapshot<Map<String, dynamic>>>[].obs;
  var types = false.obs;
  

  @override
  void onInit() {
    fetchData(); // Fetch data when the controller is initialized
    super.onInit();
  }

  void fetchData() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance.collection('users').get();

    userData.assignAll(querySnapshot.docs);
    adminemail = userData[0]["email"];

    print("${userData[0]["Name"]}");

    print(type.toString());
    if (types.value == true) {
      //type = userData[0]["newtype"];
      types.value = userData[0]["newtype"];
      print("its user");
    } else {
      types.value = userData[0]["newtype"];
      print("${types.value.toString()}----------------------------->");

      /// type = userData[0]["newtype"];

      print("istructor");
    }
  }

  ////var newList = [homescreen(),search_screen(),const homescreen(),types==true?   homescreen(),user_profile_screen()].obs;
}
