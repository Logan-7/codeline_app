import 'package:codeline_app/widget/app_color.dart';
import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddInquiryController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController interestController = TextEditingController();
  TextEditingController referenceController = TextEditingController();
  TextEditingController callController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  String inquiryNo = '';
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: AppColor.grey400));

  addInquiry() async {
    await Firestore.instance.collection('InquiryList').add({
      'called': callController.text,
      'date': DateTime.now(),
      'interest': interestController.text,
      'mobile': mobileController.text,
      'name': nameController.text,
      'no': '$inquiryNo',
      'note': noteController.text,
      'reference': referenceController.text
    }).then((value) async {
      await Firestore.instance
          .collection('LastInquiry')
          .document('Ly21x1sZvRSMaGy1juuN')
          .update({'no': inquiryNo});
      resetValue();
    });
    update();
  }

  getInquiryNo() async {
    CollectionReference inquiryCollection =
        Firestore.instance.collection('LastInquiry');
    List<Document> stInquiryNo = await inquiryCollection.get();
    int x = int.parse(stInquiryNo[0]['no'].toString());
    x += 1;
    String lastDigit = x.toString();
    if (x.toString().length == 1) {
      lastDigit = '0$x';
    } else {
      lastDigit = '$x';
    }
    inquiryNo = '${lastDigit}';
    print('------ROLL NO----${inquiryNo} ');
    update();
  }

  resetValue() {
    nameController.clear();
    mobileController.clear();
    interestController.clear();
    referenceController.clear();
    callController.clear();
    noteController.clear();
    inquiryNo='';
    getInquiryNo();
    update();
  }
}
