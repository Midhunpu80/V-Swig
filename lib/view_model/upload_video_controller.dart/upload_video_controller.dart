
import 'package:get/get.dart';
import 'package:map_int/view/user/service/upload_video_creator.dart';
import 'package:map_int/view/utilities/colors.dart';
import 'package:map_int/view/utilities/custom_snackbar.dart';

class uploadvideo_controller extends GetxController {
  var isLoading = false.obs;
  RxDouble progress = 0.0.obs;

  uploadvideos_courses(
      {required var course_id,
      required var videoFile,
      required var title,
      required var subtitle}) async {
    try {
      isLoading(true);
      String result = await uploadvideo_service().upload_video(
          course_id: course_id,
          videoFile: videoFile,
          title: title,
          subtitle: subtitle);

      if (result == "sucess") {
        isLoading(false);
        customsnackbar(
            titile: "sucess", messege: "sucessfully video uploaded", col: gr);
      } else {
        isLoading(false);

        customsnackbar(titile: "Failed", messege: "please try again", col: re);
      }
    } catch (e) {
      isLoading(false);
      customsnackbar(
          titile: "Failed",
          messege: "please try again${e.toString()}",
          col: re);
    }
  }
}
