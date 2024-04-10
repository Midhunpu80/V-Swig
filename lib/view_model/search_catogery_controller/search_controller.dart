import 'package:get/get.dart';

class search_controller extends GetxController {
  RxSet<Map<String, dynamic>> alldata = <Map<String, dynamic>>{}.obs;
  RxList<Map<String, dynamic>> showdata = <Map<String, dynamic>>[].obs;
  // Set<Map<String, dynamic>> dataSet = {};
  //   Set<Map<String, dynamic>> showsdata = {};

  getdata({required var name, required var image, required var cat_id}) async {
    final newentry = {"name": name, "img": image, "catogery_id": cat_id};

    alldata.add(newentry);

    updateshowdata();
  }

  updateshowdata() {
    final uniqueSet = <Map<String, dynamic>>{}..addAll(alldata);

    // Clear the existing showdata list
    showdata.clear();
    showdata.assignAll(uniqueSet);
    print(showdata.toList().toString());
  }

  searchquery(String query) {
    RxList<Map<String, dynamic>> result = <Map<String, dynamic>>[].obs;

    if (query.isEmpty) {
      result.assignAll(alldata.toList());
    } else {
      result.assignAll(alldata
          .toList()
          .where((element) => element['name']
              .toString()
              .toLowerCase()
              .toUpperCase()
              .contains(query.toString().toLowerCase().toUpperCase()))
          .toList());
    }
    showdata.value = result.value;
  }

  @override
  void dispose() {
    updateshowdata();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void onInit() {
    updateshowdata();
    // TODO: implement onInit
    super.onInit();

    ///showdata.value = dataSet;
    print(showdata.toList().toString());
  }
}
