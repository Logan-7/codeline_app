import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InquiryController extends GetxController {
  /// SEARCH DATA BY NAME
  TextEditingController searchController = TextEditingController();

  String searchData = '';
  getSearchData(String value) {
    searchData = value;
    update();
  }

  /// GET INQUIRY DATA FROM FIREBASE
  CollectionReference inquiryCollection =
      Firestore.instance.collection('InquiryList');

  Future<List<Document>> getInquiryList() async {
    List<Document> inquiryData =
        await inquiryCollection.orderBy('date', descending: true).get();

    return inquiryData;
  }
}
