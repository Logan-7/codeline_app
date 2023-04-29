import 'package:codeline_app/widget/app_color.dart';
import 'package:codeline_app/widget/common_snackbar.dart';
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
  String selectStatusType = '';
  updateSelectStatusType(String value) {
    selectStatusType = value;
    update();
  }

  addInquiry(BuildContext context) async {
    try {
      await Firestore.instance.collection('InquiryList').add({
        'status': selectStatusType,
        'date': DateTime.now(),
        'followUpdate': DateTime.now(),
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
        CommonSnackBar.getSuccessSnackBar(context, 'Inquiry Add Successfully');
        resetValue();
        getInquiryNo();
      });
    } catch (e) {
      CommonSnackBar.getWarningSnackBar(context, 'Something went wrong');
    }
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
    inquiryNo = '';
    getInquiryNo();
    update();
  }
}
