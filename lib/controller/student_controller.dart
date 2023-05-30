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

  String pendingFee = '';
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
  List totalInstallmentDetails = [];
  updateStudentDetails(BuildContext context) async {
    try {
      installmentDetails.clear();
      String fee = '';
      controllers.forEach((element) {
        installmentDetails.add({
          "installment_no": element[0].text,
          "receipt_no": element[1].text,
          "installment_date": element[2].text,
          "amount": element[3].text,
          "paymenttype": element[4].text,
        });
        fee = (int.parse(pendingFee) - int.parse(element[3].text)).toString();
      });
      update();
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
        'pendingFees': fee,
        'installment_details': installmentDetails
      }).whenComplete(() {
        installmentDetails.clear();

        CommonSnackBar.getSuccessSnackBar(
            context, 'Student Data Updated Successfully');
      });
    } catch (e) {
      print(e);
      CommonSnackBar.getFailedSnackBar(context, 'Something went wrong!');
    }
    update();
  }

  /// getUserdata

  Map<String, dynamic> studData = {};

  List installment = [];
  List<List<TextEditingController>> controllers = [];

  Future getStudData() async {
    Document data1 = await studentCollection.document(studentId).get();
    Map<String, dynamic>? studentData = data1.map;

    courseDetails.clear();
    installmentDetails.clear();

    studentData['courseDetails'].forEach((e) {
      courseDetails.add(e);
    });

    studData.addAll(studentData);

    update();

    ///pending fees

    pendingFee = (int.parse(studentData['pendingFees'])).toString();

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
    installment = studData['installment_details'];

    //  log('message---------$installment');
    update();
  }

  ///installment controller
  List<String> installmentHeading = [
    'Installment No',
    'Receipt No',
    'Date',
    'Amount',
    'PaymentMode'
  ];

  List<Map> installmentDetails = [];
  Future installmentData() async {
    installmentDetails.clear();
    Document data1 = await studentCollection.document(studentId).get();
    Map<String, dynamic>? installmentData = data1.map;

    installmentData['installment_details'].forEach((element) {
      installmentDetails.add(element);
    });

    controllers.clear();

    print('object-------$installmentDetails');
    if (installmentDetails != [] || installmentDetails.isNotEmpty) {
      for (var i = 0; i < installmentDetails.length; i++) {
        controllers.add([
          TextEditingController(text: installmentDetails[i]['installment_no']),
          TextEditingController(text: installmentDetails[i]['receipt_no']),
          TextEditingController(
              text: installmentDetails[i]['installment_date']),
          TextEditingController(text: installmentDetails[i]['amount']),
          TextEditingController(text: installmentDetails[i]['paymenttype']),
        ]);
      }
    }
    update();
  }

  void addTextEditingController() {
    controllers.add([
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
    ]);
    update();
  }

  void removeTextEditingController(int index) {
    controllers.removeAt(index);
    update();
  }
}
