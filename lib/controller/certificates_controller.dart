import 'package:codeline_app/widget/app_color.dart';
import 'package:codeline_app/widget/common_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/certificates/course_completion_certificate.dart';
import '../view/certificates/experience_certificate.dart';
import '../view/certificates/internship_completion_certificate.dart';
import '../view/certificates/internship_offer_later.dart';

class CertificatesController extends GetxController {
  DateTime? selectDate;
  DateTime? selectFirstDate;
  DateTime? selectLastDate;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController middleNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController occupationController = TextEditingController();
  TextEditingController educationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController projectTitleController = TextEditingController();

  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: AppColor.grey400));

  /// update certificates type

  String certificateType = '';
  updateCertificateType(String value) {
    clearValue();
    certificateType = value;
    update();
  }

  /// update gender type

  String genderType = '';
  updateGenderType(String value) {
    clearValue();
    genderType = value;
    update();
  }

  /// update gender pronounce

  String genderValue = '';
  String genderValue1 = '';
  String genderValue2 = '';
  updateGenderValue(String value) {
    if (value == 'Mr.') {
      genderValue = 'him';
      genderValue1 = 'his';
      genderValue2 = 'he';
    } else {
      genderValue = 'her';
      genderValue1 = 'her';
      genderValue2 = 'she';
    }
    update();
  }

  /// select certificate date

  selectedDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2010),
        lastDate: DateTime.now(),
        cancelText: selectDate = null);

    if (picked != null) {
      selectDate = picked;
    }
    update();
  }

  /// select first date

  selectedFirstDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2010),
        lastDate: DateTime.now(),
        cancelText: selectFirstDate = null);
    if (picked != null) {
      selectFirstDate = picked;
    }

    update();
  }

  /// select last date

  selectedLastDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: selectFirstDate!,
        lastDate: DateTime.now(),
        cancelText: selectLastDate = null);
    if (picked != null) {
      selectLastDate = picked;
    }
    update();
  }

  ///Difference of firstdate and lastdate----------------------------------------------------------------------

  differenceDays(BuildContext context) {
    final difference = selectLastDate?.difference(selectFirstDate!).inDays;
    int months = difference! ~/ 30;
    print(months);
    return months;
  }

  /// add certificates data to firebase

  addCertificatesData(BuildContext context) async {
    if (certificateType == 'Course Completion Certificates') {
      if (selectDate == null) {
        CommonSnackBar.getWarningSnackBar(context, 'Please Select Date');
      } else if (genderType.toString().isEmpty) {
        CommonSnackBar.getWarningSnackBar(context, 'Please Select gender');
      } else if (firstNameController.text.isEmpty) {
        CommonSnackBar.getWarningSnackBar(context, 'Please Enter First Name');
      } else if (middleNameController.text.toString().isEmpty) {
        CommonSnackBar.getWarningSnackBar(context, 'Please Enter Middle Name');
      } else if (lastNameController.text.toString().isEmpty) {
        CommonSnackBar.getWarningSnackBar(context, 'Please Enter Last Name');
      } else if (certificateType.isEmpty) {
        CommonSnackBar.getWarningSnackBar(
            context, 'Please Select CertificateType');
      } else {
        try {
          // await Firestore.instance.collection('Certificates').add(
          //   {
          //     'Date': DateTime.parse(selectDate!.toString()),
          //     'Gender': genderType,
          //     'FirstName': firstNameController.text,
          //     'LastName': lastNameController.text,
          //     'CertificateType': certificateType,
          //   },
          // );

          Get.to(() => CourseCompletionCertificate(
                certificatesType: certificateType,
                collegeName: educationController.text,
                description: descriptionController.text,
                firstName: firstNameController.text,
                middleName: middleNameController.text,
                lastName: lastNameController.text,
                gender: genderType,
                occupation: occupationController.text,
                selectDate: selectDate,
                firstDate: selectFirstDate,
                lastDate: selectLastDate,
                genderPronounce: genderValue,
                genderPronounce1: genderValue1,
              ));
        } catch (e) {
          CommonSnackBar.getWarningSnackBar(context, 'Something went wrong');
        }
      }
    } else if (certificateType == 'Experience certificate') {
      if (selectDate == null) {
        CommonSnackBar.getWarningSnackBar(context, 'Please Select Date');
      } else if (genderType.toString().isEmpty) {
        CommonSnackBar.getWarningSnackBar(context, 'Please Select gender');
      } else if (firstNameController.text.isEmpty) {
        CommonSnackBar.getWarningSnackBar(context, 'Please Enter First Name');
      } else if (middleNameController.text.toString().isEmpty) {
        CommonSnackBar.getWarningSnackBar(context, 'Please Enter Middle Name');
      } else if (lastNameController.text.toString().isEmpty) {
        CommonSnackBar.getWarningSnackBar(context, 'Please Enter Last Name');
      } else if (certificateType.isEmpty) {
        CommonSnackBar.getWarningSnackBar(
            context, 'Please Select CertificateType');
      } else if (selectFirstDate == null) {
        CommonSnackBar.getWarningSnackBar(context, 'Please Select FirstDate');
      } else if (selectLastDate == null) {
        CommonSnackBar.getWarningSnackBar(context, 'Please Select LastDate');
      } else if (occupationController.text.toString().isEmpty) {
        CommonSnackBar.getWarningSnackBar(context, 'Please Enter Occupation');
      } else {
        try {
          // await Firestore.instance.collection('Certificates').add(
          //   {
          //     'Date': DateTime.parse(selectDate!.toString()),
          //     'Gender': genderType,
          //     'FirstName': firstNameController.text,
          //     'LastName': lastNameController.text,
          //     'CertificateType': certificateType,
          //     'FirstDate': DateTime.parse(selectFirstDate!.toString()),
          //     'LastDate': DateTime.parse(selectLastDate!.toString()),
          //     'Occupation': occupationController.text
          //   },
          // );

          Get.to(() => ExperienceCertificate(
                certificatesType: certificateType,
                collegeName: educationController.text,
                description: descriptionController.text,
                firstName: firstNameController.text,
                middleName: middleNameController.text,
                lastName: lastNameController.text,
                gender: genderType,
                occupation: occupationController.text,
                selectDate: selectDate,
                firstDate: selectFirstDate,
                lastDate: selectLastDate,
                genderPronounce1: genderValue1,
              ));
        } catch (e) {
          CommonSnackBar.getWarningSnackBar(context, 'Something went wrong');
        }
      }
    } else if (certificateType == 'Internship Offer Letter') {
      try {
        if (selectDate == null) {
          CommonSnackBar.getWarningSnackBar(context, 'Please Select Date');
        } else if (genderType.toString().isEmpty) {
          CommonSnackBar.getWarningSnackBar(context, 'Please Select gender');
        } else if (firstNameController.text.isEmpty) {
          CommonSnackBar.getWarningSnackBar(context, 'Please Enter First Name');
        } else if (middleNameController.text.toString().isEmpty) {
          CommonSnackBar.getWarningSnackBar(
              context, 'Please Enter Middle Name');
        } else if (lastNameController.text.toString().isEmpty) {
          CommonSnackBar.getWarningSnackBar(context, 'Please Enter Last Name');
        } else if (certificateType.isEmpty) {
          CommonSnackBar.getWarningSnackBar(
              context, 'Please Select CertificateType');
        } else if (selectFirstDate == null) {
          CommonSnackBar.getWarningSnackBar(context, 'Please Select FirstDate');
        } else if (selectLastDate == null) {
          CommonSnackBar.getWarningSnackBar(context, 'Please Select LastDate');
        } else if (educationController.text.isEmpty) {
          CommonSnackBar.getWarningSnackBar(
              context, 'Please Enter College/School Name');
        } else {
          // await Firestore.instance.collection('Certificates').add(
          //   {
          //     'Date': DateTime.parse(selectDate!.toString()),
          //     'Gender': genderType,
          //     'FirstName': firstNameController.text,
          //     'LastName': lastNameController.text,
          //     'CertificateType': certificateType,
          //     'FirstDate': DateTime.parse(selectFirstDate!.toString()),
          //     'LastDate': DateTime.parse(selectLastDate!.toString()),
          //     'CollageName': educationController.text,
          //     'Description': descriptionController.text,
          //   },
          // );

          Get.to(() => InternshipOfferLater(
                certificatesType: certificateType,
                collegeName: educationController.text,
                description: descriptionController.text,
                firstName: firstNameController.text,
                middleName: middleNameController.text,
                lastName: lastNameController.text,
                gender: genderType,
                occupation: occupationController.text,
                selectDate: selectDate,
                firstDate: selectFirstDate,
                lastDate: selectLastDate,
                months: differenceDays(context),
              ));
        }
      } catch (e) {
        CommonSnackBar.getWarningSnackBar(context, 'Something went wrong');
      }
    } else if (certificateType == 'Internship Completion  Certificate') {
      try {
        if (selectDate == null) {
          CommonSnackBar.getWarningSnackBar(context, 'Please Select Date');
        } else if (genderType.toString().isEmpty) {
          CommonSnackBar.getWarningSnackBar(context, 'Please Select gender');
        } else if (firstNameController.text.isEmpty) {
          CommonSnackBar.getWarningSnackBar(context, 'Please Enter First Name');
        } else if (middleNameController.text.toString().isEmpty) {
          CommonSnackBar.getWarningSnackBar(
              context, 'Please Enter Middle Name');
        } else if (lastNameController.text.toString().isEmpty) {
          CommonSnackBar.getWarningSnackBar(context, 'Please Enter Last Name');
        } else if (certificateType.isEmpty) {
          CommonSnackBar.getWarningSnackBar(
              context, 'Please Select CertificateType');
        } else if (selectFirstDate == null) {
          CommonSnackBar.getWarningSnackBar(context, 'Please Select FirstDate');
        } else if (selectLastDate == null) {
          CommonSnackBar.getWarningSnackBar(context, 'Please Select LastDate');
        } else if (educationController.text.isEmpty) {
          CommonSnackBar.getWarningSnackBar(
              context, 'Please Enter College/School Name');
        } else if (projectTitleController.text.isEmpty) {
          CommonSnackBar.getWarningSnackBar(
              context, 'Please Enter ProjectTitle');
        } else {
          // await Firestore.instance.collection('Certificates').add(
          //   {
          //     'Date': DateTime.parse(selectDate!.toString()),
          //     'Gender': genderType,
          //     'FirstName': firstNameController.text,
          //     'LastName': lastNameController.text,
          //     'CertificateType': certificateType,
          //     'FirstDate': DateTime.parse(selectFirstDate!.toString()),
          //     'LastDate': DateTime.parse(selectLastDate!.toString()),
          //     'CollageName': educationController.text,
          //     'Description': descriptionController.text,
          //   },
          // );

          Get.to(
            () => InternshipCompletionCertificate(
                certificatesType: certificateType,
                collegeName: educationController.text,
                description: descriptionController.text,
                firstName: firstNameController.text,
                middleName: middleNameController.text,
                lastName: lastNameController.text,
                gender: genderType,
                occupation: occupationController.text,
                selectDate: selectDate,
                firstDate: selectFirstDate,
                lastDate: selectLastDate,
                months: differenceDays(context),
                genderPronounce: genderValue,
                genderPronounce1: genderValue1,
                genderPronounce2: genderValue2,
                projectTitle: projectTitleController.text),
          );
        }
      } catch (e) {
        CommonSnackBar.getWarningSnackBar(context, 'Something went wrong');
      }
    }

    update();
  }

  clearValue() {
    genderType = '';
    firstNameController.clear();
    lastNameController.clear();
    middleNameController.clear();
    certificateType = '';
    occupationController.clear();
    educationController.clear();
    descriptionController.clear();
    projectTitleController.clear();
    selectDate = null;
    selectFirstDate = null;
    selectLastDate = null;
    update();
  }
}
