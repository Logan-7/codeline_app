import 'dart:io';

import 'package:codeline_app/widget/app_color.dart';
import 'package:codeline_app/widget/common_snackbar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddStudentController extends GetxController {
  List<String> education = ['Board', 'Course', 'Passing Year', 'Percentage'];
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController parentMobileNumberController = TextEditingController();
  TextEditingController feesController = TextEditingController();
  TextEditingController courseDurationController = TextEditingController();
  TextEditingController installmentController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  String rollNo = '';
  DateTime? selectedDate;
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: AppColor.grey400));

  bool loader = false;

  updateLoader({bool value = false}) {
    loader = value;

    update();
  }

  /// FOR EDUCATION TABLE
  List<String> courseDetails = [];
  int educationLength = 1;

  List<Map<String, dynamic>> educationDetails = [
    {'board': '', 'course': '', 'passingYear': '', 'percentage': ''}
  ];
  List<List<TextEditingController>> educationDetailsController = [
    [
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
    ]
  ];

  updateEducationLength() {
    educationLength++;
    educationDetails
        .add({'board': '', 'course': '', 'passingYear': '', 'percentage': ''});
    educationDetailsController.add([
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
    ]);
    update();
  }

  removeEducationLength(int index) {
    educationLength--;
    educationDetails.removeAt(index);
    educationDetailsController.removeAt(index);
    update();
  }

  addValueToEducationList({int? index, String? value, int? rowIndex}) {
    educationDetails[index!].update(
        rowIndex == 0
            ? 'board'
            : rowIndex == 1
                ? 'course'
                : rowIndex == 2
                    ? 'passingYear'
                    : 'percentage',
        (val) => value);

    update();

    print('-----------EDUCATION -----${educationDetails}');
  }

  /// PICK DOB DATE
  selectDobDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(3000));
    if (picked != null) {
      selectedDate = picked;
    }

    update();
  }

  /// FOR PAYMENT SELECT OPTION
  bool iscCPlus = false;
  bool isDart = false;
  bool isFlutter = false;
  bool isUiUx = false;
  bool isFullStack = false;
  bool isWeb = false;
  bool isNodeJs = false;

  updateCCPlus() {
    iscCPlus = !iscCPlus;

    if (iscCPlus == true) {
      courseDetails.add('C/C++');
    } else {
      courseDetails.remove('C/C++');
    }
    update();
  }

  updateDart() {
    isDart = !isDart;
    if (isDart == true) {
      courseDetails.add('Dart');
    } else {
      courseDetails.remove('Dart');
    }
    update();
  }

  updateFlutter() {
    isFlutter = !isFlutter;
    if (isFlutter == true) {
      courseDetails.add('Flutter');
    } else {
      courseDetails.remove('Flutter');
    }
    update();
  }

  updateUiUx() {
    isUiUx = !isUiUx;
    if (isUiUx == true) {
      courseDetails.add('Ui/UX');
    } else {
      courseDetails.remove('Ui/UX');
    }
    update();
  }

  updateFullStack() {
    isFullStack = !isFullStack;
    if (isFullStack == true) {
      courseDetails.add('Full Stack');
    } else {
      courseDetails.remove('Full Stack');
    }
    update();
  }

  updateWeb() {
    isWeb = !isWeb;
    if (isWeb == true) {
      courseDetails.add('Web');
    } else {
      courseDetails.remove('Web');
    }
    update();
  }

  updateNodeJs() {
    isNodeJs = !isNodeJs;
    if (isNodeJs == true) {
      courseDetails.add('Node Js');
    } else {
      courseDetails.remove('Node Js');
    }
    update();
  }

  /// ADD DATA TO FIREBASE
  addStudentToFirebase(context) async {
    if (pickedFileBytes == null) {
      CommonSnackBar.getWarningSnackBar(context, 'Please Upload Image');
    } else if (nameController.text.isEmpty) {
      CommonSnackBar.getWarningSnackBar(context, 'Please Enter Name');
    } else if (emailController.text.isEmpty) {
      CommonSnackBar.getWarningSnackBar(context, 'Please Enter Email');
    } else if (selectedDate == null) {
      CommonSnackBar.getWarningSnackBar(context, 'Please Enter DOB');
    } else if (mobileNumberController.text.isEmpty) {
      CommonSnackBar.getWarningSnackBar(context, 'Please Enter Mobile No');
    } else if (addressController.text.isEmpty) {
      CommonSnackBar.getWarningSnackBar(context, 'Please Enter Address');
    } else if (courseDetails.isEmpty) {
      CommonSnackBar.getWarningSnackBar(context, 'Please Select Course');
    } else {
      updateLoader(value: true);

      try {
        // String? studentProfile =
        //     await uploadFile(data: pickedFileBytes, name: nameController.text);

        await Firestore.instance.collection('StudentList').add({
          'address': addressController.text,
          'courseDetails': courseDetails,
          'courseDuration': courseDurationController.text,
          'date': '${DateFormat.yMd().format(DateTime.now())}',
          'dob': '${DateFormat.yMd().format(selectedDate!)}',
          'education': educationDetails,
          'emailId': emailController.text,
          'instalment': installmentController.text,
          'mobile': mobileNumberController.text,
          'name': nameController.text,
          'parentsNo': parentMobileNumberController.text,
          'rollNo': '$rollNo',
          // "profile": studentProfile,
          'time': DateTime.now(),
          'totalFees': feesController.text
        }).then((value) async {
          await Firestore.instance
              .collection('LastRollNo')
              .document('tJQ6y64zEsrVbnd7LTUj')
              .update({'rollNo': rollNo});
          resetAllValue();
          updateLoader(value: false);
        });
      } catch (e) {
        print('------ERORRO---$e');
        updateLoader(value: false);
      }
    }
  }

  /// FOR ROLL NUMBER
  getRollNo() async {
    CollectionReference receiptCollection =
        Firestore.instance.collection('LastRollNo');
    List<Document> stRollNo = await receiptCollection.get();

    DateTime dateTime = DateTime.now();

    String year = '${dateTime.year}';
    print('----YEAR---$year  ----${stRollNo[0]['rollNo']}');

    String no = stRollNo[0]['rollNo'].toString().replaceRange(0, 6, year);

    if (no.toString().contains(year)) {
      no = no.replaceRange(0, 4, '');
    }
    print('-------------FINAL ---$no');

    //
    int x = int.parse(no.trim().toString());
    x += 1;
    String lastDigit = x.toString();
    if (x.toString().length == 1) {
      lastDigit = '000$x';
    } else if (x.toString().length == 2) {
      lastDigit = '00$x';
    } else if (x.toString().length == 3) {
      lastDigit = '0$x';
    } else {
      lastDigit = '$x';
    }
    final finalRollNo = '$year$lastDigit';
    rollNo = 'CL${finalRollNo}';
    print('------ROLL NO----${rollNo} ');
    update();
  }

  /// SINGLE IMAGE PICKER

  Uint8List? pickedFileBytes;

  pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'webp', 'jpeg'],
    );
    if (result == null) {
      print("No file selected");
    } else {
      pickedFileBytes = File(result.files.single.path!).readAsBytesSync();
      update();

      print('Image pick= = ${result.files.single.name}');
    }
    update();
  }

  ///FUNCTION UPLOAD the file to the storage
  Future<String?> uploadFile({Uint8List? data, String? name}) async {
    try {
      ///Start uploading
      firebase_storage.Reference reference =
          firebase_storage.FirebaseStorage.instance.ref('student/$name');

      ///Show the status of the upload
      firebase_storage.TaskSnapshot uploadTask = await reference.putData(data!);

      ///Get the download url of the file
      String url = await uploadTask.ref.getDownloadURL();

      if (uploadTask.state == firebase_storage.TaskState.success) {
        print('URL: $url');
        return url;
      } else {
        print(uploadTask.state);
        return null;
      }
    } catch (e) {
      print('---EROROR--$e');
      updateLoader(value: false);
    }
  }

  /// RESET VALUE
  resetAllValue() {
    nameController.clear();
    emailController.clear();
    mobileNumberController.clear();
    parentMobileNumberController.clear();
    installmentController.clear();
    feesController.clear();
    selectedDate = null;
    addressController.clear();
    iscCPlus = false;
    isDart = false;
    isFlutter = false;
    isUiUx = false;
    isFullStack = false;
    isWeb = false;
    isNodeJs = false;
    rollNo = '';
    educationDetails = [
      {'board': '', 'course': '', 'passingYear': '', 'percentage': ''}
    ];
    educationDetailsController = [
      [
        TextEditingController(),
        TextEditingController(),
        TextEditingController(),
        TextEditingController(),
      ]
    ];
    getRollNo();
    update();
  }
}
