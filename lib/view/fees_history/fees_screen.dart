import 'package:codeline_app/controller/add_fees_controller.dart';
import 'package:codeline_app/view/print_receipt/print_receipt.dart';
import 'package:codeline_app/widget/app_color.dart';
import 'package:codeline_app/widget/responsive.dart';
import 'package:firedart/firestore/firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FeesScreen extends StatefulWidget {
  const FeesScreen({Key? key}) : super(key: key);

  @override
  State<FeesScreen> createState() => _FeesScreenState();
}

class _FeesScreenState extends State<FeesScreen> {
  AddFeesController addFeesController = Get.put(AddFeesController());

  @override
  void initState() {
    addFeesController.getStudent();
    addFeesController.getFeesReceiptNo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'Add Fees',
              style: TextStyle(
                  color: AppColor.mainColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            Divider(
              color: AppColor.grey400,
            ),
            Expanded(
              child: GetBuilder<AddFeesController>(
                builder: (controller) {
                  return Center(
                    child: Container(
                      constraints: BoxConstraints(maxWidth: 900),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 50,
                                  width: 250,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: AppColor.grey400,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Receipt No : ${controller.feeReceiptNum}',
                                      style: TextStyle(
                                          letterSpacing: 3, fontSize: 16),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  width: 250,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: AppColor.grey400,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '${DateFormat('dd/MM/yyyy').format(DateTime.now())}',
                                      style: TextStyle(
                                          letterSpacing: 3, fontSize: 16),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Autocomplete<String>(
                                    optionsBuilder:
                                        (TextEditingValue textEditingValue) {
                                      if (textEditingValue.text == '') {
                                        return const Iterable<String>.empty();
                                      }
                                      return controller.studentList.where(
                                        (String option) {
                                          return option.toString().contains(
                                              textEditingValue.text
                                                  .toLowerCase());
                                        },
                                      );
                                    },
                                    fieldViewBuilder: (context,
                                        textEditingController,
                                        focusNode,
                                        onFieldSubmitted) {
                                      return TextField(
                                        onChanged: (val) {
                                          if (val.isEmpty) {
                                            controller.installmentController
                                                .clear();
                                            controller.amountNumberController
                                                .clear();
                                            controller.nameController.clear();
                                            controller.amountController.clear();
                                            setState(() {});
                                          } else {}
                                        },
                                        onSubmitted: (val) {
                                          controller.nameController.text = val;
                                        },
                                        controller: textEditingController,
                                        focusNode: focusNode,
                                        onEditingComplete: onFieldSubmitted,
                                        decoration: InputDecoration(
                                          border: controller.outlineInputBorder,
                                          focusedBorder:
                                              controller.outlineInputBorder,
                                          enabledBorder:
                                              controller.outlineInputBorder,
                                          hintText: 'Name',
                                        ),
                                      );
                                    },
                                    onSelected: (String selection) {
                                      controller
                                          .getInstallmentNumber(selection);
                                      //     setState(() {});
                                      debugPrint(
                                          'You just selected${selection}');
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 100,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    controller: controller.amountController,
                                    onChanged: (val) {
                                      controller.convertNumberToWord();
                                    },
                                    decoration: InputDecoration(
                                      border: controller.outlineInputBorder,
                                      focusedBorder:
                                          controller.outlineInputBorder,
                                      enabledBorder:
                                          controller.outlineInputBorder,
                                      hintText: 'Amount',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              controller: controller.amountNumberController,
                              decoration: InputDecoration(
                                enabled: false,
                                border: controller.outlineInputBorder,
                                focusedBorder: controller.outlineInputBorder,
                                enabledBorder: controller.outlineInputBorder,
                                hintText: 'Amount in words',
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Responsive.isMobile(context)
                                ? Column(
                                    children: [
                                      TextFormField(
                                        controller:
                                            controller.installmentController,
                                        decoration: InputDecoration(
                                          border: controller.outlineInputBorder,
                                          focusedBorder:
                                              controller.outlineInputBorder,
                                          enabledBorder:
                                              controller.outlineInputBorder,
                                          hintText: 'Instalment No',
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      paymentMethods(controller: controller)
                                    ],
                                  )
                                : Row(
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          controller:
                                              controller.installmentController,
                                          decoration: InputDecoration(
                                            border:
                                                controller.outlineInputBorder,
                                            focusedBorder:
                                                controller.outlineInputBorder,
                                            enabledBorder:
                                                controller.outlineInputBorder,
                                            hintText: 'Instalment No',
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 100,
                                      ),
                                      paymentMethods(controller: controller)
                                    ],
                                  ),
                            SizedBox(
                              height: 70,
                            ),
                            Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              runSpacing: 30,
                              spacing: 200,
                              children: [
                                SizedBox(
                                  height: 45,
                                  width: 150,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColor.mainColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    onPressed: () {
                                      controller.resetAllValue();
                                    },
                                    child: Text('Cancel'),
                                  ),
                                ),
                                SizedBox(
                                  height: 45,
                                  width: 150,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColor.mainColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    onPressed: () {
                                      controller.resetAllValue();
                                    },
                                    child: Text('Reset'),
                                  ),
                                ),
                                SizedBox(
                                  height: 45,
                                  width: 150,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColor.mainColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    onPressed: () async {
                                      await Firestore.instance
                                          .collection('FeesHistory')
                                          .add({
                                        'amount':
                                            controller.amountController.text,
                                        'date': DateTime.now(),
                                        'instalment': controller
                                            .installmentController.text,
                                        'mode': controller.selectMode,
                                        'name': controller.nameController.text,
                                        'no': controller.feeReceiptNum,
                                        'words': controller
                                            .amountNumberController.text
                                      }).then((value) async {
                                        await Firestore.instance
                                            .collection('LastReceipt')
                                            .document('nGb5QDZH5Ig1yZNqF0V5')
                                            .update({
                                          'No': '${controller.feeReceiptNum}'
                                        });

                                        String pendingFee =
                                            (int.parse(controller.pendingFees) -
                                                    int.parse(controller
                                                        .amountController.text))
                                                .toString();

                                        ///adding new data of installments---------------------------------

                                        controller.addInstallmentData();

                                        ///update installmentdata in firebase-----------------------------------

                                        await Firestore.instance
                                            .collection('StudentList')
                                            .document(
                                                '${controller.selectStudentId}')
                                            .update({
                                          'pendingFees': '${pendingFee}',
                                          'instalment':
                                              '${controller.installmentController.text.trim().toString()}',
                                          'installment_details':
                                              controller.installmentDetails,
                                        });
                                      });
                                      setState(() {});

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              PrintReceiptScreen(
                                            name: controller.nameController.text
                                                .toUpperCase(),
                                            mode: controller.selectMode,
                                            date:
                                                '${DateFormat.yMd().format(DateTime.now())}',
                                            number: controller
                                                .installmentController.text,
                                            receipt: controller.feeReceiptNum,
                                            rs: controller
                                                .amountController.text,
                                            word: controller
                                                .amountNumberController.text
                                                .toUpperCase(),
                                          ),
                                        ),
                                      );
                                      controller.getStudent();
                                    },
                                    child: Text('Save & Print'),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Row paymentMethods({AddFeesController? controller}) {
    return Row(
      children: [
        Text(
          'Payment Method',
          style: TextStyle(
            color: AppColor.blackColor,
            fontSize: 15,
          ),
        ),
        SizedBox(
          width: 40,
        ),
        Checkbox(
          activeColor: AppColor.mainColor,
          value: controller?.isCash,
          onChanged: (value) {
            controller?.updateCash();
          },
        ),
        Text(
          'Cash',
          style: TextStyle(
            color: AppColor.blackColor,
            fontSize: 15,
          ),
        ),
        SizedBox(width: 40),
        Checkbox(
          activeColor: AppColor.mainColor,
          value: controller?.isBank,
          onChanged: (value) {
            controller?.updateBank();
          },
        ),
        Text(
          'Bank',
          style: TextStyle(
            color: AppColor.blackColor,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
