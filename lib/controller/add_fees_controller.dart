import 'dart:developer';

import 'package:codeline_app/widget/app_color.dart';
import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:number_to_words/number_to_words.dart';

class AddFeesController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController amountNumberController = TextEditingController();
  TextEditingController installmentController = TextEditingController();
  List installmentDetails = [];
  String feeReceiptNum = '';
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: AppColor.grey400));

  /// FOR PAYMENT SELECT OPTION
  bool isCash = false;
  bool isBank = false;
  String selectMode = '';
  String selectStudentId = '';
  String pendingFees = '';

  updateCash() {
    isCash = !isCash;
    if (isCash == true) {
      selectMode = 'CASH';
      isBank = false;
    }
    update();
  }

  updateBank() {
    isBank = !isBank;
    if (isBank == true) {
      selectMode = 'UPI';

      isCash = false;
    }
    update();
  }

  /// CONVERT NUMBER TO WORD
  convertNumberToWord() {
    if (amountController.text.isNotEmpty) {
      amountNumberController.text = NumberToWord()
              .convert('en-in', int.parse(amountController.text))
              .toUpperCase() +
          'ONLY';
    } else {
      amountNumberController.text = '';
    }
    update();
  }

  /// RESET VALUE
  resetAllValue() {
    nameController.clear();
    amountController.clear();
    amountNumberController.clear();
    installmentController.clear();
    isCash = false;
    isBank = false;
    feeReceiptNum = '';
    getFeesReceiptNo();
    update();
  }

  /// GET STUDENT DATA FROM FIREBASE
  CollectionReference studentCollection =
      Firestore.instance.collection('StudentList');

  List<String> studentList = [];
  List<Map<String, dynamic>> students = [];
  List<String> installmentList = [];

  Future<List<Document>> getStudent() async {
    List<Document> studentData = await studentCollection.get();
    studentList.clear();
    students.clear();
    installmentList.clear();
    for (int i = 0; i < studentData.length; i++) {
      students.add(studentData[i].map);
      studentList.add(studentData[i]['name']);
      installmentList.add(
          '${studentData[i]['name']}..${studentData[i]['instalment']}..${studentData[i]['pendingFees']}..${studentData[i].id}');
      update();
    }
    return studentData;
  }

  /// GET INSTALMENT NO
  getInstallmentNumber(String value) {
    installmentDetails.clear();
    for (int i = 0; i < studentList.length; i++) {
      String name = installmentList[i].toString().split('..').first;
      if (name.trim().toLowerCase().toString() ==
          value.trim().toLowerCase().toString()) {
        installmentController.text = installmentList[i].split('..')[1];
        int number = int.parse(installmentController.text);
        number++;
        installmentController.text = number.toString();
        pendingFees = installmentList[i].split('..')[2];
        selectStudentId = installmentList[i].split('..').last;
        nameController.text = installmentList[i].split('..').first;
        amountController.text = installmentList[i].split('..')[2];
        amountNumberController.text = NumberToWord()
                .convert('en-in', int.parse(amountController.text))
                .toUpperCase() +
            'ONLY';
        installmentDetails.addAll(students[i]['installment_details']);
        log('instalmentdetails---------------${installmentDetails}');
      }
    }
    update();
  }

  addInstallmentData() {
    installmentDetails.add({
      'installment_no': installmentController.text.trim().toString(),
      'receipt_no': feeReceiptNum,
      'installment_date': '${DateFormat.yMd().format(DateTime.now())}',
      'amount': amountController.text.trim().toString(),
      'paymenttype': selectMode
    });
    update();
  }

  /// FOR INQUIRY NUMBER
  getFeesReceiptNo() async {
    CollectionReference receiptCollection =
        Firestore.instance.collection('LastReceipt');
    List<Document> receiptNo = await receiptCollection.get();

    DateTime dateTime = DateTime.now();

    String year = '${dateTime.year}';

    String no = receiptNo[0]['No'].toString().replaceRange(0, 4, year);
    if (receiptNo[0]['No'].toString().contains(year)) {
      no = no.replaceRange(0, 4, '');
    }

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
    final finalReceiptNo = '$year$lastDigit';
    feeReceiptNum = finalReceiptNo;
    print('------RECEIPT NO----${finalReceiptNo} ');
    update();
  }
}
