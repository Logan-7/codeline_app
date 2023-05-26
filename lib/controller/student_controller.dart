import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/app_color.dart';
import '../widget/common_snackbar.dart';

class StudentController extends GetxController {
  /// SEARCH DATA BY NAME
  TextEditingController searchController = TextEditingController();
  List<String> education = ['Board', 'Course', 'Passing Year', 'Percentage'];

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController parentMobileNumberController = TextEditingController();
  TextEditingController feesController = TextEditingController();
  TextEditingController courseDurationController = TextEditingController();
  TextEditingController installmentController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController educationController = TextEditingController();

  String rollNo = '';
  String studentId = '';
  DateTime? selectedDate;
  String bDate = '';
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: AppColor.grey400));
  bool openDetails = false;
  String searchData = '';
  getSearchData(String value) {
    searchData = value;
    update();
  }

  updateOpenDetails(bool value) {
    openDetails = value;
    update();
  }

  updateStudentId(String value) {
    studentId = value;
    update();
  }

  // int educationLength = 1;

  // List<Map<String, dynamic>> educationDetails = [
  //   {'board': '', 'course': '', 'passingYear': '', 'percentage': ''}
  // ];
  // List<List<TextEditingController>> educationDetailsController = [
  //   [
  //     TextEditingController(),
  //     TextEditingController(),
  //     TextEditingController(),
  //     TextEditingController(),
  //   ]
  // ];
  //
  // updateEducationLength() {
  //   educationLength++;
  //   educationDetails
  //       .add({'board': '', 'course': '', 'passingYear': '', 'percentage': ''});
  //   educationDetailsController.add([
  //     TextEditingController(),
  //     TextEditingController(),
  //     TextEditingController(),
  //     TextEditingController(),
  //   ]);
  //   update();
  // }
  //
  // removeEducationLength(int index) {
  //   educationLength--;
  //   educationDetails.removeAt(index);
  //   educationDetailsController.removeAt(index);
  //   update();
  // }
  //
  // addValueToEducationList({int? index, String? value, int? rowIndex}) {
  //   educationDetails[index!].update(
  //       rowIndex == 0
  //           ? 'board'
  //           : rowIndex == 1
  //               ? 'course'
  //               : rowIndex == 2
  //                   ? 'passingYear'
  //                   : 'percentage',
  //       (val) => value);
  //
  //   update();
  //
  //   print('-----------EDUCATION -----${educationDetails}');
  // }

  /// course selection

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

  List<Map<String, dynamic>> studentData = [];

  /// GET STUDENT DATA FROM FIREBASE

  List<dynamic> getData = [];

  CollectionReference studentCollection =
      Firestore.instance.collection('StudentList');

  Future<List<Document>> getStudentList() async {
    List<Document> studentData =
        await studentCollection.orderBy('time', descending: true).get();

    return studentData;
  }

  /// UPDATE PARTICULAR DATA

  updateStudentDetails(BuildContext context) async {
    try {
      data.clear();

      // for (var element in textEditionController) {
      //   data.add({
      //     "Installment No": element[0].text,
      //     "Receipt No": element[1].text,
      //     "Date": element[2].text,
      //     "Amount": element[3].text,
      //     "PaymentMode": element[4].text,
      //   });
      // }

      await studentCollection.document(studentId).update({
        'name': nameController.text,
        'emailId': emailController.text,
        'education': educationController.text,
        'mobile': mobileNumberController.text,
        'parentsNo': parentMobileNumberController.text,
        'address': addressController.text,
        'courseDetails': courseDetails,
        'courseDuration': courseDurationController.text,
        'instalment': installmentController.text,
        'totalFees': feesController.text,
        'installment_details': data
      }).whenComplete(() {
        CommonSnackBar.getSuccessSnackBar(
            context, 'Student Data Updated Successfully');
      });
    } catch (e) {
      CommonSnackBar.getFailedSnackBar(context, 'Something went wrong!');
    }
    update();
  }

  /// getUserdata

  Map<String, dynamic> studData = {};

  List installment = [];

  Future getStudData() async {
    Document data1 = await studentCollection.document(studentId).get();
    Map<String, dynamic>? studentData = data1.map;

    courseDetails.clear();

    textEditionController.clear();
    // studentData['installment_details'].forEach((e) {
    //   installment.add(e);
    //
    //   textEditionController.add([
    //     TextEditingController(text: e['installment_no']),
    //     TextEditingController(text: e['receipt_no']),
    //     TextEditingController(text: e['installment_date']),
    //     TextEditingController(text: e['amount']),
    //     TextEditingController(text: e['paymenttype']),
    //   ]);
    // });

    studentData['courseDetails'].forEach((e) {
      courseDetails.add(e);
    });

    studData.addAll(studentData);

    print('>>>>>>>>>>>>>>>>>>>>>>>>>>$studData');

    update();

    /// controller value
    nameController.text = '${studData['name'].toString().capitalizeFirst}';
    emailController.text = '${studData['emailId']}';
    mobileNumberController.text = '${studData['mobile']}';
    parentMobileNumberController.text = '${studData['parentsNo']}';
    addressController.text = '${studData['address']}';
    rollNo = studData['rollNo'];
    installmentController.text = '${studData['instalment']}';
    courseDurationController.text = '${studData['courseDuration']}';
    feesController.text = '${studData['totalFees']}';
    educationController.text = '${studData['education']}';

    update();
  }

  /// fees controller

  List textEditionController = [];
  List data = [];

  List<String> installmentHeading = [
    'Installment No',
    'Receipt No',
    'Date',
    'Amount',
    'PaymentMode'
  ];

  addTextFields() {
    textEditionController.add([
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
    ]);
    update();
  }
}
