import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/student_controller.dart';
import '../../widget/app_color.dart';

class StudentDetailsScreen extends StatefulWidget {
  const StudentDetailsScreen({Key? key}) : super(key: key);

  @override
  State<StudentDetailsScreen> createState() => _StudentDetailsScreenState();
}

class _StudentDetailsScreenState extends State<StudentDetailsScreen> {
  StudentController studentController = Get.put(StudentController());

  @override
  void initState() {
    studentController.getStudData();
    studentController.installmentData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return GetBuilder<StudentController>(
      builder: (controller) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  InkWell(
                      onTap: () {
                        controller.updateOpenDetails(false);
                      },
                      child: Icon(Icons.arrow_back_ios_new)),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Student Details',
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
                child: Center(
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 1150),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Align(
                          //   alignment: Alignment.topRight,
                          //   child: InkWell(
                          //     onTap: () {
                          //       // controller.pickImage();
                          //     },
                          //     child: Container(
                          //       height: 150,
                          //       width: 150,
                          //       clipBehavior: Clip.antiAliasWithSaveLayer,
                          //       decoration: BoxDecoration(
                          //           color: AppColor.grey300,
                          //           borderRadius: BorderRadius.circular(10)),
                          //       child: Center(
                          //         child: Icon(
                          //           Icons.camera_alt_outlined,
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          SizedBox(
                            height: 60,
                          ),
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
                                    'Roll  No : ${controller.studData['rollNo']}',
                                    style: TextStyle(
                                        letterSpacing: 3, fontSize: 16),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: AppColor.grey400,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'Admission Date :${controller.studData['date']}',
                                    style: TextStyle(
                                        letterSpacing: 3, fontSize: 16),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: controller.nameController,
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
                                width: 20,
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: controller.emailController,
                                  decoration: InputDecoration(
                                    border: controller.outlineInputBorder,
                                    focusedBorder:
                                        controller.outlineInputBorder,
                                    enabledBorder:
                                        controller.outlineInputBorder,
                                    hintText: 'Email',
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              InkWell(
                                borderRadius: BorderRadius.circular(10),
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
                                      'BirthDate : ${controller.studData['dob']}',
                                      style: TextStyle(
                                          letterSpacing: 3, fontSize: 16),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: controller.educationController,
                                  decoration: InputDecoration(
                                    border: controller.outlineInputBorder,
                                    focusedBorder:
                                        controller.outlineInputBorder,
                                    enabledBorder:
                                        controller.outlineInputBorder,
                                    hintText: 'Education',
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: controller.mobileNumberController,
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
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller:
                                      controller.parentMobileNumberController,
                                  decoration: InputDecoration(
                                    border: controller.outlineInputBorder,
                                    focusedBorder:
                                        controller.outlineInputBorder,
                                    enabledBorder:
                                        controller.outlineInputBorder,
                                    hintText: 'Parent Mobile No',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          TextFormField(
                            controller: controller.addressController,
                            maxLines: 3,
                            decoration: InputDecoration(
                              border: controller.outlineInputBorder,
                              focusedBorder: controller.outlineInputBorder,
                              enabledBorder: controller.outlineInputBorder,
                              hintText: 'Address',
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),

                          Row(
                            children: List.generate(
                                controller.courseList.length,
                                (index) => Row(
                                      children: [
                                        Checkbox(
                                          activeColor: AppColor.mainColor,
                                          value: controller.courseDetails
                                              .contains(
                                                  controller.courseList[index]),
                                          onChanged: (value) {
                                            controller.changeSelectedCourses(
                                                controller.courseList[index]);
                                          },
                                        ),
                                        Text(
                                          '${controller.courseList[index]}',
                                          style: TextStyle(
                                            color: AppColor.blackColor,
                                            fontSize: 15,
                                          ),
                                        ),
                                        SizedBox(width: 20),
                                      ],
                                    )),
                          ),

                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller:
                                      controller.courseDurationController,
                                  decoration: InputDecoration(
                                    border: controller.outlineInputBorder,
                                    focusedBorder:
                                        controller.outlineInputBorder,
                                    enabledBorder:
                                        controller.outlineInputBorder,
                                    hintText: 'Duration',
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: controller.installmentController,
                                  decoration: InputDecoration(
                                    border: controller.outlineInputBorder,
                                    focusedBorder:
                                        controller.outlineInputBorder,
                                    enabledBorder:
                                        controller.outlineInputBorder,
                                    hintText: 'Installment',
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: controller.feesController,
                                  decoration: InputDecoration(
                                    border: controller.outlineInputBorder,
                                    focusedBorder:
                                        controller.outlineInputBorder,
                                    enabledBorder:
                                        controller.outlineInputBorder,
                                    hintText: 'Total Fees',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),

                          ///old--------------------------------------------------------------------

                          // Column(
                          //   children: [
                          //     Align(
                          //       alignment: Alignment.topLeft,
                          //       child: Text(
                          //         'Installment Details  : ',
                          //         style: TextStyle(
                          //             color: AppColor.blackColor,
                          //             fontSize: 20,
                          //             fontWeight: FontWeight.w600),
                          //       ),
                          //     ),
                          //     SizedBox(
                          //       height: 20,
                          //     ),
                          //     Row(
                          //       children: [
                          //         SizedBox(
                          //           width: 5,
                          //         ),
                          //         Expanded(
                          //           child: Column(
                          //             children: List.generate(
                          //               controller.installment.length,
                          //               (columnIndex) => Container(
                          //                 height: 45,
                          //                 width: double.infinity,
                          //                 decoration: BoxDecoration(
                          //                   borderRadius:
                          //                       BorderRadius.circular(1),
                          //                   border: Border.all(
                          //                       color: AppColor.grey400),
                          //                 ),
                          //                 child: Row(
                          //                   mainAxisAlignment:
                          //                       MainAxisAlignment.center,
                          //                   children: List.generate(
                          //                     controller
                          //                         .installmentHeading.length,
                          //                     (rowIndex) => Expanded(
                          //                       child: Container(
                          //                         height: 45,
                          //                         width: double.infinity,
                          //                         decoration: BoxDecoration(
                          //                           border: Border(
                          //                             right: BorderSide(
                          //                                 color:
                          //                                     AppColor.grey400),
                          //                           ),
                          //                         ),
                          //                         child: columnIndex == 0
                          //                             ? Align(
                          //                                 alignment:
                          //                                     Alignment.center,
                          //                                 child: Text(
                          //                                   '${controller.installmentHeading[rowIndex]}',
                          //                                   style: TextStyle(
                          //                                       letterSpacing:
                          //                                           2,
                          //                                       fontSize: 15,
                          //                                       fontWeight:
                          //                                           FontWeight
                          //                                               .w400),
                          //                                 ),
                          //                               )
                          //                             : Row(
                          //                                 mainAxisAlignment:
                          //                                     MainAxisAlignment
                          //                                         .center,
                          //                                 children: [
                          //                                   rowIndex == 0
                          //                                       ? Align(
                          //                                           alignment:
                          //                                               Alignment
                          //                                                   .center,
                          //                                           child: Text(
                          //                                               '${controller.installment[columnIndex]['installment_no']}'))
                          //                                       : rowIndex == 1
                          //                                           ? Center(
                          //                                               child: Text(
                          //                                                   '${DateFormat.yMd().format(
                          //                                                 DateTime.parse(
                          //                                                     '${controller.installment[columnIndex]['installment_date']}'),
                          //                                               )}'),
                          //                                             )
                          //                                           : rowIndex ==
                          //                                                   2
                          //                                               ? Center(
                          //                                                   child:
                          //                                                       Text('${controller.installment[columnIndex]['amount']}'),
                          //                                                 )
                          //                                               : Center(
                          //                                                   child:
                          //                                                       Text('${controller.installment[columnIndex]['paymenttype']}'),
                          //                                                 ),
                          //                                 ],
                          //                               ),
                          //                       ),
                          //                     ),
                          //                   ),
                          //                 ),
                          //               ),
                          //             ),
                          //           ),
                          //         ),
                          //         SizedBox(
                          //           width: 20,
                          //         ),
                          //         InkWell(
                          //           child: Container(
                          //             height: 45,
                          //             width: 45,
                          //             decoration: BoxDecoration(
                          //               color: AppColor.grey300,
                          //               borderRadius: BorderRadius.all(
                          //                 Radius.circular(15),
                          //               ),
                          //             ),
                          //             child: Icon(Icons.add,
                          //                 color: Colors.black, size: 20),
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //   ],
                          // ),
                          //
                          // SizedBox(
                          //   height: 20,
                          // ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: width * 0.565,
                                height: 50,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: List.generate(
                                    controller.installmentHeading.length,
                                    (headingIndex) => Expanded(
                                      child: Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                          border: Border(
                                            top: BorderSide(
                                                color: AppColor.grey400,
                                                width: 2),
                                            right: BorderSide(
                                                color: AppColor.grey400,
                                                width: 2),
                                            bottom: BorderSide(
                                                color: AppColor.grey400,
                                                width: 2),
                                            left: BorderSide(
                                                color: AppColor.grey400,
                                                width:
                                                    headingIndex == 0 ? 2 : 0),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                              '${controller.installmentHeading[headingIndex]}'),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                  style: ButtonStyle(
                                    padding: MaterialStatePropertyAll(
                                        EdgeInsets.symmetric(vertical: 19)),
                                    backgroundColor: MaterialStatePropertyAll(
                                      AppColor.mainColor,
                                    ),
                                  ),
                                  onPressed: () {
                                    controller.addTextEditingController();
                                    // controller.controllers.add([
                                    //   TextEditingController(),
                                    //   TextEditingController(),
                                    //   TextEditingController(),
                                    //   TextEditingController(),
                                    //   TextEditingController(),
                                    // ]);
                                  },
                                  child: const Text('+')),
                            ],
                          ),

                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: width * 0.599,
                              child: ListView.builder(
                                itemCount: controller.controllers.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) => Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: width * 0.565,
                                      height: 50,
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  border: Border(
                                                    right: BorderSide(
                                                        color: AppColor.grey400,
                                                        width: 2),
                                                    left: BorderSide(
                                                        color: AppColor.grey400,
                                                        width: 2),
                                                    bottom: BorderSide(
                                                        color: AppColor.grey400,
                                                        width: 2),
                                                  ),
                                                ),
                                                child: TextField(
                                                  textAlign: TextAlign.center,
                                                  controller: controller
                                                      .controllers[index][0],
                                                  decoration: InputDecoration(
                                                    hintText: 'Installment No',
                                                    hintStyle: TextStyle(
                                                        fontSize: 15,
                                                        color:
                                                            AppColor.grey400),
                                                    focusedBorder:
                                                        InputBorder.none,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  border: Border(
                                                    bottom: BorderSide(
                                                        color: AppColor.grey400,
                                                        width: 2),
                                                    right: BorderSide(
                                                        color: AppColor.grey400,
                                                        width: 2),
                                                  ),
                                                ),
                                                child: TextField(
                                                  textAlign: TextAlign.center,
                                                  controller: controller
                                                      .controllers[index][1],
                                                  decoration: InputDecoration(
                                                    hintStyle: TextStyle(
                                                        fontSize: 15,
                                                        color:
                                                            AppColor.grey400),
                                                    hintText: 'Receipt No',
                                                    focusedBorder:
                                                        InputBorder.none,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  border: Border(
                                                    bottom: BorderSide(
                                                        color: AppColor.grey400,
                                                        width: 2),
                                                    right: BorderSide(
                                                        color: AppColor.grey400,
                                                        width: 2),
                                                  ),
                                                ),
                                                child: TextField(
                                                  textAlign: TextAlign.center,
                                                  controller: controller
                                                      .controllers[index][2],
                                                  decoration: InputDecoration(
                                                    hintStyle: TextStyle(
                                                        fontSize: 15,
                                                        color:
                                                            AppColor.grey400),
                                                    hintText: 'Date',
                                                    focusedBorder:
                                                        InputBorder.none,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  border: Border(
                                                    bottom: BorderSide(
                                                        color: AppColor.grey400,
                                                        width: 2),
                                                    right: BorderSide(
                                                        color: AppColor.grey400,
                                                        width: 2),
                                                  ),
                                                ),
                                                child: TextField(
                                                  textAlign: TextAlign.center,
                                                  controller: controller
                                                      .controllers[index][3],
                                                  decoration: InputDecoration(
                                                    hintStyle: TextStyle(
                                                        fontSize: 15,
                                                        color:
                                                            AppColor.grey400),
                                                    hintText: 'Amount',
                                                    focusedBorder:
                                                        InputBorder.none,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  border: Border(
                                                    bottom: BorderSide(
                                                        color: AppColor.grey400,
                                                        width: 2),
                                                    right: BorderSide(
                                                        color: AppColor.grey400,
                                                        width: 2),
                                                  ),
                                                ),
                                                child: TextField(
                                                  textAlign: TextAlign.center,
                                                  controller: controller
                                                      .controllers[index][4],
                                                  decoration: InputDecoration(
                                                    hintStyle: TextStyle(
                                                        fontSize: 15,
                                                        color:
                                                            AppColor.grey400),
                                                    hintText: 'PaymentMode',
                                                    focusedBorder:
                                                        InputBorder.none,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ]),
                                    ),
                                    SizedBox(
                                      width: 9,
                                    ),
                                    ElevatedButton(
                                        style: ButtonStyle(
                                          padding: MaterialStatePropertyAll(
                                              EdgeInsets.symmetric(
                                                  vertical: 19)),
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                            AppColor.mainColor,
                                          ),
                                        ),
                                        onPressed: () {
                                          controller
                                              .removeTextEditingController(
                                                  index);
                                        },
                                        child: const Text('-'))
                                  ],
                                ),
                              ),
                            ),
                          ),

                          /// ---------------------- ///

                          SizedBox(
                            height: 40,
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
                                controller.updateStudentDetails(context);
                              },
                              child: Text('Update'),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
