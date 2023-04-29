import 'package:codeline_app/controller/inquiry_controller.dart';
import 'package:codeline_app/widget/app_color.dart';
import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class UpdateInquiryScreen extends StatefulWidget {
  const UpdateInquiryScreen({Key? key}) : super(key: key);

  @override
  State<UpdateInquiryScreen> createState() => _UpdateInquiryScreenState();
}

class _UpdateInquiryScreenState extends State<UpdateInquiryScreen> {
  InquiryController inquiryController = Get.put(InquiryController());
  DropDownController dropDownController = Get.put(DropDownController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InquiryController>(
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () {
                        controller.updateOpenInquiry(false);
                      },
                      child: Icon(Icons.arrow_back_ios_new)),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Edit Inquiry',
                    style: TextStyle(
                        color: AppColor.mainColor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Divider(
                color: AppColor.grey400,
              ),
              Expanded(
                child: FutureBuilder(
                  future: controller.getParticularInquiryList(),
                  builder:
                      (BuildContext context, AsyncSnapshot<Document> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      var inquiryData = snapshot.data;
                      controller.nameController.text =
                          inquiryData!['name'].toString().toUpperCase();
                      controller.mobileController.text = inquiryData['mobile'];
                      controller.noteController.text = inquiryData['note'];
                      dropDownController.selectStatusType.value =
                          inquiryData['status'];
                      dropDownController.followUpTime =
                          inquiryData['followUpdate'];
                      return Center(
                        child: Container(
                          constraints: BoxConstraints(maxWidth: 900),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          '',
                                          style: TextStyle(
                                              letterSpacing: 3, fontSize: 16),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          height: 50,
                                          width: 250,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                              color: AppColor.grey400,
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'No : ${inquiryData!['no']}',
                                              style: TextStyle(
                                                  letterSpacing: 3,
                                                  fontSize: 16),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Follow Up Date',
                                          style: TextStyle(
                                              letterSpacing: 3, fontSize: 16),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        GetBuilder<DropDownController>(
                                          builder: (controller) {
                                            return InkWell(
                                              onTap: () {
                                                dropDownController
                                                    .updateFollowUpTime(
                                                        context);
                                              },
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Container(
                                                height: 50,
                                                width: 250,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                    color: AppColor.grey400,
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    dropDownController
                                                                .followUpTime ==
                                                            null
                                                        ? 'Select Follow Date'
                                                        : '${DateFormat('dd/MM/yyyy').format(dropDownController.followUpTime!)}',
                                                    style: TextStyle(
                                                        letterSpacing: 3,
                                                        fontSize: 16),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        )
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Inquiry Date',
                                          style: TextStyle(
                                              letterSpacing: 3, fontSize: 16),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          height: 50,
                                          width: 250,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                              color: AppColor.grey400,
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${DateFormat('dd/MM/yyyy').format(DateTime.now())}',
                                              style: TextStyle(
                                                  letterSpacing: 3,
                                                  fontSize: 16),
                                            ),
                                          ),
                                        ),
                                      ],
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
                                Obx(
                                  () => Container(
                                    height: 50,
                                    width: Get.width,
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
                                            dropDownController.selectStatusType
                                                    .value.isEmpty
                                                ? "Status"
                                                : dropDownController
                                                    .selectStatusType.value,
                                            style: TextStyle(
                                              color: AppColor.mainColor,
                                            ),
                                          ),
                                          onChanged: (val) {
                                            dropDownController
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
                                SizedBox(
                                  height: 30,
                                ),
                                TextFormField(
                                  controller: controller.noteController,
                                  maxLines: 2,
                                  onChanged: (val) {},
                                  decoration: InputDecoration(
                                    border: controller.outlineInputBorder,
                                    focusedBorder:
                                        controller.outlineInputBorder,
                                    enabledBorder:
                                        controller.outlineInputBorder,
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
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                        ),
                                        onPressed: () {
                                          controller.updateParticularInquiry(
                                              dropDownController
                                                  .selectStatusType.value,
                                              dropDownController.followUpTime!,
                                              context);
                                        },
                                        child: Text('Update'),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: AppColor.mainColor,
                        ),
                      );
                    } else {
                      return Text(
                        'Try Again',
                        style: TextStyle(
                            color: AppColor.mainColor,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      );
                    }
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
