import 'package:get/get.dart';

class mode_controller extends GetxController {
  var mode = 0.obs;

  changemode({required var index}) {
    mode.value = index;
    
  }
}
