import 'package:get/get.dart';

class search_product_service extends GetxController {
  RxSet<Map<String, dynamic>> alldata = <Map<String, dynamic>>{}.obs;
  RxList<Map<String, dynamic>> showdata = <Map<String, dynamic>>[].obs;
  getdata(
      {required var product_name,
      required var product_id,
      required var product_image,
      required var rating,
      required var price,
      required var reviews,
      required var subtitle,
      required var cat_name}) {
    final data = {
      "name": product_name,
      "image": product_image,
      "cat_id": product_id,
      "rating": rating,
      "price": price,
      "subtitle": subtitle,
      "reviews": reviews,
      "cat_name": cat_name
    };

    alldata.add(data);
    print(alldata.toList());
    updatdata();
    update();
  }

  updatdata() {
    final uniqueSet = <Map<String, dynamic>>{}..addAll(alldata);

    showdata.clear();
    showdata.addAll(uniqueSet);
    update();
  }

  query(String query) {
    RxList<Map<String, dynamic>> resultdata = <Map<String, dynamic>>[].obs;

    if (query.isEmpty) {
      resultdata.assignAll(alldata.toList().toSet());
      update();
    } else {
      resultdata.assignAll(alldata
          .toList()
          .where((val) {
            // val['name']
            //     .toString()
            //     .toLowerCase()
            //     .toUpperCase()
            //     .contains(query.toString().toLowerCase().toUpperCase());
            return val['cat_name']
                .toString()
                .toLowerCase()
                .toUpperCase()
                .contains(query.toString().toLowerCase().toUpperCase());
          })
          .toList()
          .toSet());
      update();
    }
    showdata.value.clear();

    showdata.assignAll(resultdata.toList().toSet().toList());

    update();
  }

  @override
  void dispose() {
    showdata.clear();
    alldata.clear();
    updatdata();

    super.dispose();
  }
}
