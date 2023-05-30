import 'package:codeline_app/controller/certificates_controller.dart';
import 'package:codeline_app/widget/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CertificateScreen extends StatefulWidget {
  const CertificateScreen({Key? key}) : super(key: key);

  @override
  State<CertificateScreen> createState() => _CertificateScreenState();
}

class _CertificateScreenState extends State<CertificateScreen> {
  CertificatesController certificatesController =
      Get.put(CertificatesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'Certificates',
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
              child: GetBuilder<CertificatesController>(
                builder: (controller) {
                  return Center(
                    child: Container(
                      constraints: BoxConstraints(maxWidth: 900),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            /// date picker

                            Align(
                              alignment: Alignment.topRight,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(10),
                                onTap: () {
                                  controller.selectedDate(context);
                                },
                                child: Container(
                                  height: 55,
                                  width: 250,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: AppColor.grey400,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      controller.selectDate == null
                                          ? 'Select Date'
                                          : '${DateFormat.yMd().format(controller.selectDate!)}',
                                      style: TextStyle(
                                          letterSpacing: 3, fontSize: 16),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),

                            /// name and gender
                            Row(
                              children: [
                                /// gender
                                Container(
                                  height: 50,
                                  width: 130,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border:
                                          Border.all(color: AppColor.grey400)),
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Theme(
                                    data: ThemeData(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        hint: Text(
                                          controller.genderType.isEmpty
                                              ? "Select"
                                              : controller.genderType,
                                          style: TextStyle(
                                            color: AppColor.mainColor,
                                          ),
                                        ),
                                        onChanged: (val) {
                                          controller.updateGenderType(val!);
                                          controller.updateGenderValue(val);
                                        },
                                        items: [
                                          'Mr.',
                                          'Mrs.',
                                          'Ms.',
                                        ].map((String items) {
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
                                SizedBox(
                                  width: 20,
                                ),

                                /// first name textField
                                Expanded(
                                  child: TextFormField(
                                    controller: controller.firstNameController,
                                    onChanged: (val) {},
                                    decoration: InputDecoration(
                                      border: controller.outlineInputBorder,
                                      focusedBorder:
                                          controller.outlineInputBorder,
                                      enabledBorder:
                                          controller.outlineInputBorder,
                                      hintText: 'First Name',
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    controller: controller.middleNameController,
                                    onChanged: (val) {},
                                    decoration: InputDecoration(
                                      border: controller.outlineInputBorder,
                                      focusedBorder:
                                          controller.outlineInputBorder,
                                      enabledBorder:
                                          controller.outlineInputBorder,
                                      hintText: 'Middle Name',
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),

                                /// last name textField
                                Expanded(
                                  child: TextFormField(
                                    controller: controller.lastNameController,
                                    onChanged: (val) {},
                                    decoration: InputDecoration(
                                      border: controller.outlineInputBorder,
                                      focusedBorder:
                                          controller.outlineInputBorder,
                                      enabledBorder:
                                          controller.outlineInputBorder,
                                      hintText: 'Last Name',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),

                            /// certificates type

                            Row(
                              children: [
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
                                            controller.certificateType.isEmpty
                                                ? "Certificate Type"
                                                : controller.certificateType,
                                            style: TextStyle(
                                              color: AppColor.mainColor,
                                            ),
                                          ),
                                          onChanged: (val) {
                                            controller
                                                .updateCertificateType(val!);
                                          },
                                          items: [
                                            'Course Completion Certificates',
                                            'Experience certificate',
                                            'Internship Offer Letter',
                                            'Internship Completion  Certificate'
                                          ].map((String items) {
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

                            /// other details

                            controller.certificateType ==
                                        'Course Completion Certificates' ||
                                    controller.certificateType.isEmpty
                                ? SizedBox()
                                : Column(
                                    children: [
                                      SelectDateMethods(controller: controller),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      controller.certificateType ==
                                              'Experience certificate'
                                          ? TextFormField(
                                              controller: controller
                                                  .occupationController,
                                              onChanged: (val) {},
                                              decoration: InputDecoration(
                                                border: controller
                                                    .outlineInputBorder,
                                                focusedBorder: controller
                                                    .outlineInputBorder,
                                                enabledBorder: controller
                                                    .outlineInputBorder,
                                                hintText: 'Occupation',
                                              ),
                                            )
                                          : controller.certificateType ==
                                                  'Internship Offer Letter'
                                              ? Column(
                                                  children: [
                                                    TextFormField(
                                                      controller: controller
                                                          .educationController,
                                                      onChanged: (val) {},
                                                      decoration:
                                                          InputDecoration(
                                                        border: controller
                                                            .outlineInputBorder,
                                                        focusedBorder: controller
                                                            .outlineInputBorder,
                                                        enabledBorder: controller
                                                            .outlineInputBorder,
                                                        hintText:
                                                            'School / College Name',
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 30,
                                                    ),
                                                    TextFormField(
                                                      controller: controller
                                                          .descriptionController,
                                                      maxLines: 2,
                                                      onChanged: (val) {},
                                                      decoration:
                                                          InputDecoration(
                                                        border: controller
                                                            .outlineInputBorder,
                                                        focusedBorder: controller
                                                            .outlineInputBorder,
                                                        enabledBorder: controller
                                                            .outlineInputBorder,
                                                        hintText: 'Description',
                                                      ),
                                                    )
                                                  ],
                                                )
                                              : Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: TextFormField(
                                                            controller: controller
                                                                .educationController,
                                                            onChanged: (val) {},
                                                            decoration:
                                                                InputDecoration(
                                                              border: controller
                                                                  .outlineInputBorder,
                                                              focusedBorder:
                                                                  controller
                                                                      .outlineInputBorder,
                                                              enabledBorder:
                                                                  controller
                                                                      .outlineInputBorder,
                                                              hintText:
                                                                  'School / College Name',
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 50),
                                                            child:
                                                                TextFormField(
                                                              controller: controller
                                                                  .projectTitleController,
                                                              maxLines: 1,
                                                              onChanged:
                                                                  (val) {},
                                                              decoration:
                                                                  InputDecoration(
                                                                border: controller
                                                                    .outlineInputBorder,
                                                                focusedBorder:
                                                                    controller
                                                                        .outlineInputBorder,
                                                                enabledBorder:
                                                                    controller
                                                                        .outlineInputBorder,
                                                                hintText:
                                                                    'Project Title',
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
                                                      controller: controller
                                                          .descriptionController,
                                                      maxLines: 2,
                                                      onChanged: (val) {},
                                                      decoration:
                                                          InputDecoration(
                                                        border: controller
                                                            .outlineInputBorder,
                                                        focusedBorder: controller
                                                            .outlineInputBorder,
                                                        enabledBorder: controller
                                                            .outlineInputBorder,
                                                        hintText:
                                                            'Description (optional)',
                                                      ),
                                                    )
                                                  ],
                                                ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                    ],
                                  ),

                            Center(
                              child: SizedBox(
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
                                    controller.addCertificatesData(context);
                                    // controller.certificateType ==
                                    //         'Course Completion Certificates'
                                    //     ? Get.to(() =>
                                    //         CourseCompletionCertificate(
                                    //           certificatesType:
                                    //               controller.certificateType,
                                    //           collegeName: controller
                                    //               .educationController.text,
                                    //           description: controller
                                    //               .descriptionController.text,
                                    //           firstName: controller
                                    //               .firstNameController.text,
                                    //           middleName: controller
                                    //               .middleNameController.text,
                                    //           lastName: controller
                                    //               .lastNameController.text,
                                    //           gender: controller.genderType,
                                    //           occupation: controller
                                    //               .occupationController.text,
                                    //           selectDate: controller.selectDate,
                                    //           firstDate:
                                    //               controller.selectFirstDate,
                                    //           lastDate:
                                    //               controller.selectLastDate,
                                    //           genderPronounce:
                                    //               controller.genderValue,
                                    //           genderPronounce1:
                                    //               controller.genderValue1,
                                    //         ))
                                    //     : controller.certificateType ==
                                    //             'Experience certificate'
                                    //         ? Get.to(() =>
                                    //             ExperienceCertificate(
                                    //               certificatesType: controller
                                    //                   .certificateType,
                                    //               collegeName: controller
                                    //                   .educationController.text,
                                    //               description: controller
                                    //                   .descriptionController
                                    //                   .text,
                                    //               firstName: controller
                                    //                   .firstNameController.text,
                                    //               middleName: controller
                                    //                   .middleNameController
                                    //                   .text,
                                    //               lastName: controller
                                    //                   .lastNameController.text,
                                    //               gender: controller.genderType,
                                    //               occupation: controller
                                    //                   .occupationController
                                    //                   .text,
                                    //               selectDate:
                                    //                   controller.selectDate,
                                    //               firstDate: controller
                                    //                   .selectFirstDate,
                                    //               lastDate:
                                    //                   controller.selectLastDate,
                                    //               genderPronounce1:
                                    //                   controller.genderValue1,
                                    //             ))
                                    //         : Get.to(() =>
                                    //             InternshipCompletionCertificate(
                                    //               certificatesType: controller
                                    //                   .certificateType,
                                    //               collegeName: controller
                                    //                   .educationController.text,
                                    //               description: controller
                                    //                   .descriptionController
                                    //                   .text,
                                    //               firstName: controller
                                    //                   .firstNameController.text,
                                    //               middleName: controller
                                    //                   .middleNameController
                                    //                   .text,
                                    //               lastName: controller
                                    //                   .lastNameController.text,
                                    //               gender: controller.genderType,
                                    //               occupation: controller
                                    //                   .occupationController
                                    //                   .text,
                                    //               selectDate:
                                    //                   controller.selectDate,
                                    //               firstDate: controller
                                    //                   .selectFirstDate,
                                    //               lastDate:
                                    //                   controller.selectLastDate,
                                    //               months: controller
                                    //                   .differenceDays(context),
                                    //             ));
                                  },
                                  child: Text('Generate'),
                                ),
                              ),
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

  Column SelectDateMethods({CertificatesController? controller}) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  controller.selectedFirstDate(context);
                },
                child: Container(
                  height: 55,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColor.grey400,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      controller!.selectFirstDate == null
                          ? 'Select First Date'
                          : '${DateFormat.yMd().format(controller.selectFirstDate!)}',
                      style: TextStyle(letterSpacing: 3, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 100,
            ),
            Expanded(
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  controller.selectedLastDate(context);
                },
                child: Container(
                  height: 55,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColor.grey400,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      controller.selectLastDate == null
                          ? 'Select Last Date'
                          : '${DateFormat.yMd().format(controller.selectLastDate!)}',
                      style: TextStyle(letterSpacing: 3, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
