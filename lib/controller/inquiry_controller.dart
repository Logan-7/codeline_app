import 'package:codeline_app/widget/app_color.dart';
import 'package:codeline_app/widget/common_snackbar.dart';
import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InquiryController extends GetxController {
  /// SEARCH DATA BY NAME
  TextEditingController searchController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  TextEditingController callController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: AppColor.grey400));

  bool openInquiry = false;
  String studentId = '';

  updateStudentId(String value) {
    studentId = value;
    update();
  }

  updateOpenInquiry(bool value) {
    openInquiry = value;
    update();
  }

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

  /// GET PERTICULAR STUDENT INQUIRY DATA FROM FIREBASE
  CollectionReference particularInquiryCollection =
      Firestore.instance.collection('InquiryList');

  Future<Document> getParticularInquiryList() async {
    Document inquiryData =
        await particularInquiryCollection.document(studentId).get();

    return inquiryData;
  }

  /// UPDATE COLLECTION IN FIREBASE STORAGE
  updateParticularInquiry(String status, BuildContext context) async {
    try {
      await particularInquiryCollection.document(studentId).update({
        'status': status,
        'mobile': mobileController.text,
        'name': nameController.text,
        'note': noteController.text,
      }).whenComplete(() {
        CommonSnackBar.getSuccessSnackBar(
            context, 'Inquiry Update Successfully');
      });
    } catch (e) {
      CommonSnackBar.getFailedSnackBar(context, 'Something went wrong!');
    }
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

class DropDownController extends GetxController {
  RxString selectStatusType = ''.obs;
  updateSelectStatusType(String value) {
    selectStatusType.value = value;
  }
}
