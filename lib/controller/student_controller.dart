import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentController extends GetxController {
  /// SEARCH DATA BY NAME
  TextEditingController searchController = TextEditingController();

  String searchData = '';
  getSearchData(String value) {
    searchData = value;
    update();
  }

  /// GET STUDENT DATA FROM FIREBASE
  CollectionReference studentCollection =
      Firestore.instance.collection('StudentList');

  Future<List<Document>> getStudentList() async {
    List<Document> studentData =
        await studentCollection.orderBy('time', descending: true).get();

    return studentData;
  }
}
