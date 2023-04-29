import 'package:codeline_app/controller/add_fees_controller.dart';
import 'package:codeline_app/controller/add_inquiry_screen.dart';
import 'package:codeline_app/widget/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddInquiryScreen extends StatefulWidget {
  const AddInquiryScreen({Key? key}) : super(key: key);

  @override
  State<AddInquiryScreen> createState() => _AddInquiryScreenState();
}

class _AddInquiryScreenState extends State<AddInquiryScreen> {
  AddInquiryController addInquiryController = Get.put(AddInquiryController());

  @override
  void initState() {
    addInquiryController.getInquiryNo();
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
              'Add Inquiry',
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
              child: GetBuilder<AddInquiryController>(
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
                                      'No : ${controller.inquiryNo}',
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
                                  child: TextFormField(
                                    controller: controller.nameController,
                                    onChanged: (val) {},
                                    decoration: InputDecoration(
                                      border: controller.outlineInputBorder,
                                      focusedBorder:
                                          controller.outlineInputBorder,
                                      enabledBorder:
                                          controller.outlineInputBorder,
                                      hintText: 'Name',
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 100,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    controller: controller.mobileController,
                                    onChanged: (val) {},
                                    decoration: InputDecoration(
                                      border: controller.outlineInputBorder,
                                      focusedBorder:
                                          controller.outlineInputBorder,
                                      enabledBorder:
                                          controller.outlineInputBorder,
                                      hintText: 'Mobile No',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                // Expanded(
                                //   child: TextFormField(
                                //     controller: controller.interestController,
                                //     onChanged: (val) {},
                                //     decoration: InputDecoration(
                                //       border: controller.outlineInputBorder,
                                //       focusedBorder:
                                //           controller.outlineInputBorder,
                                //       enabledBorder:
                                //           controller.outlineInputBorder,
                                //       hintText: 'Interest',
                                //     ),
                                //   ),
                                // ),
                                // SizedBox(
                                //   width: 50,
                                // ),
                                Expanded(
                                  child: TextFormField(
                                    controller: controller.referenceController,
                                    onChanged: (val) {},
                                    decoration: InputDecoration(
                                      border: controller.outlineInputBorder,
                                      focusedBorder:
                                          controller.outlineInputBorder,
                                      enabledBorder:
                                          controller.outlineInputBorder,
                                      hintText: 'Reference',
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                // Expanded(
                                //   child: TextFormField(
                                //     controller: controller.callController,
                                //     onChanged: (val) {},
                                //     decoration: InputDecoration(
                                //       border: controller.outlineInputBorder,
                                //       focusedBorder:
                                //           controller.outlineInputBorder,
                                //       enabledBorder:
                                //           controller.outlineInputBorder,
                                //       hintText: 'Called',
                                //     ),
                                //   ),
                                // ),

                                Expanded(
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: AppColor.grey400)),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Theme(
                                      data: ThemeData(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                          hint: Text(
                                            controller.selectStatusType.isEmpty
                                                ? "Status"
                                                : controller.selectStatusType,
                                            style: TextStyle(
                                              color: AppColor.mainColor,
                                            ),
                                          ),
                                          onChanged: (val) {
                                            controller
                                                .updateSelectStatusType(val!);
                                          },
                                          items: ['Follow Up', 'Not Interested']
                                              .map((String items) {
                                            return DropdownMenuItem(
                                              value: items,
                                              child: Text(
                                                '$items',
                                                style: TextStyle(),
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              controller: controller.noteController,
                              maxLines: 2,
                              onChanged: (val) {},
                              decoration: InputDecoration(
                                border: controller.outlineInputBorder,
                                focusedBorder: controller.outlineInputBorder,
                                enabledBorder: controller.outlineInputBorder,
                                hintText: 'Note',
                              ),
                            ),
                            SizedBox(
                              height: 50,
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
                                      controller.resetValue();
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
                                      controller.resetValue();
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
                                    onPressed: () {
                                      controller.addInquiry(context);
                                    },
                                    child: Text('Save'),
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
