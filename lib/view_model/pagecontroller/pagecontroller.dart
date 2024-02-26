import 'package:get/get.dart';

class pagecontroller extends GetxController {
  var pageno = 0.obs;
  change(var index) {
    pageno.value = index;
    
  }
}
