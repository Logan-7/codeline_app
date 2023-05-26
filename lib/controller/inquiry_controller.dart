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
  TextEditingController referenceController = TextEditingController();
  TextEditingController callController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: AppColor.grey400));
  DateTime? selectedDate;
  DateTime? Date;
  String selectStatusType = '';

  List<int> sizes = [10, 12, 14, 16];

  List<Map<String, dynamic>> data = [
    {
      "size": 10,
      "descriptionItem": [
        {"title": ""},
        {"title": ""},
      ],
    },
    {
      "size": 12,
      "descriptionItem": [
        {"title": ""},
        {"title": ""},
      ],
    }
  ];

  void addData(
    int size,
  ) {
    for (var value in data) {
      if (value['size'] == size) {
      } else {}
    }
  }

  bool openInquiry = false;
  String studentId = '';
  int selectedDashboardIndex = 1;

  updateDashboardIndex(int value) {
    selectedDashboardIndex = value;
    update();
  }

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

  List<String> courseDetails = [];

  List<String> courseList = [
    "C/C++",
    "Dart",
    "Flutter",
    "Ui/UX",
    "Full Stack",
    "FrontEnd",
    "BackEnd",
  ];

  void changeSelectedCourses(String value) {
    if (courseDetails.contains(value)) {
      courseDetails.remove(value);
      update();
    } else {
      courseDetails.add(value);
      update();
    }
    print('>>>>>>>>>> ${courseDetails}');
  }

  // ///add course detail field (temporary function)
  //
  // var collection = Firestore.instance.collection('InquiryList');
  //
  // Future updateData() async {
  //   var data = await collection.get();
  //
  //   data
  //     ..forEach((element) {
  //       var data1 = Firestore.instance
  //           .collection('InquiryList')
  //           .document(element.id)
  //           .update({"courseDetails": []});
  //     });
  // }

  /// GET INQUIRY DATA FROM FIREBASE
  CollectionReference inquiryCollection =
      Firestore.instance.collection('InquiryList');

  Future<List<Document>> getInquiryList() async {
    List<Document> inquiryData =
        await inquiryCollection.orderBy('date', descending: true).get();

    return inquiryData;
  }

  /// GET INQUIRY DATA Of LAST 3 FROM FIREBASE
  CollectionReference inquiryData =
      Firestore.instance.collection('InquiryList');

  Future<List<Document>> getInquiryData() async {
    List<Document> inquiryDataOf3 = await inquiryCollection
        .where('date',
            isGreaterThanOrEqualTo: DateTime.now().subtract(Duration(days: 3)))
        .orderBy('date', descending: true)
        .get();
    return inquiryDataOf3;
  }

  /// GET PARTICULAR STUDENT INQUIRY DATA FROM FIREBASE
  CollectionReference particularInquiryCollection =
      Firestore.instance.collection('InquiryList');

  Map<String, dynamic> inquirydata = {};

  Future getParticularInquiryList() async {
    Document inquiryData =
        await particularInquiryCollection.document(studentId).get();

    Map<String, dynamic>? inqData = inquiryData.map;

    inqData['courseDetails'].forEach((e) {
      courseDetails.add(e);
    });

    inquirydata.addAll(inqData);
    print('>>>>>>>>>>>>>>>>>>>>>>>>>>$inquirydata');
    update();

    /// controller value
    nameController.text = '${inquirydata['name'].toString().capitalizeFirst}';
    mobileController.text = '${inquirydata['mobile']}';
    referenceController.text = '${inquirydata['reference']}';
    noteController.text = '${inquirydata['note']}';
    selectStatusType = '${inquirydata['status']}';
    Date = DateTime.parse('${inquirydata['date']}');
    update();
  }

  /// UPDATE COLLECTION IN FIREBASE STORAGE
  updateParticularInquiry(String status, BuildContext context) async {
    try {
      await particularInquiryCollection.document(studentId).update({
        'status': status,
        'mobile': mobileController.text,
        'name': nameController.text,
        'note': noteController.text,
        'courseDetails': courseDetails,
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

  ResetValue() {
    nameController.clear();
    mobileController.clear();
    referenceController.clear();
    noteController.clear();
    selectStatusType = '';
    courseDetails = [];
    update();
  }
}

class DropDownController extends GetxController {
  DateTime? followUpTime;

  updateFollowUpTime(BuildContext context) async {
    /// PICK DOB DATE

    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2022),
        lastDate: DateTime.now());
    if (picked != null) {
      followUpTime = picked;
    }
    update();
  }

  RxString selectStatusType = ''.obs;
  updateSelectStatusType(String value) {
    selectStatusType.value = value;
  }

  ResetValue() {
    followUpTime = null;
  }
}
