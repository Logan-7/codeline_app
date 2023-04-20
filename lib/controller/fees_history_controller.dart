import 'package:firedart/firedart.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FeesHistoryController extends GetxController {
  /// SEARCH DATA BY NAME
  TextEditingController searchController = TextEditingController();

  String searchData = '';
  getSearchData(String value) {
    searchData = value;
    update();
  }

  /// GET FEES HISTORY DATA FROM FIREBASE
  CollectionReference feesHistoryCollection =
      Firestore.instance.collection('FeesHistory');

  Future<List<Document>> getFeesHistory() async {
    List<Document> feesHistory =
        await feesHistoryCollection.orderBy('date', descending: true).get();

    return feesHistory;
  }
}
