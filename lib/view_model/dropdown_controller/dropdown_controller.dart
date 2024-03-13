import 'package:get/get.dart';

class dropdown_controller extends GetxController {
  var changedvalue = "".obs;
  change({required var newvalue}) {
    changedvalue.value = newvalue;
    
  }
}
