import 'package:codeline_app/controller/add_student_controller.dart';
import 'package:codeline_app/widget/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddStudentScreen extends StatefulWidget {
  const AddStudentScreen({Key? key}) : super(key: key);

  @override
  State<AddStudentScreen> createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  AddStudentController addStudentController = Get.put(AddStudentController());

  @override
  void initState() {
    addStudentController.getRollNo();
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
              'Add Student',
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
              child: GetBuilder<AddStudentController>(
                builder: (controller) {
                  return Center(
                    child: Container(
                      constraints: BoxConstraints(maxWidth: 1150),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: InkWell(
                                onTap: () {
                                  controller.pickImage();
                                },
                                child: Container(
                                  height: 150,
                                  width: 150,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  decoration: BoxDecoration(
                                      color: AppColor.grey300,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: controller.pickedFileBytes != null
                                      ? Image.memory(
                                          controller.pickedFileBytes!,
                                          fit: BoxFit.cover,
                                        )
                                      : Center(
                                          child: Icon(
                                            Icons.camera_alt_outlined,
                                          ),
                                        ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
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
                                      'Roll No : ${controller.rollNo}',
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
                                  onTap: () {
                                    controller.selectDobDate(context);
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
                                        controller.selectedDate == null
                                            ? 'DOB'
                                            : '${DateFormat.yMd().format(controller.selectedDate!)}',
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
                                    controller:
                                        controller.mobileNumberController,
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
                                )
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Education  : ',
                                  style: TextStyle(
                                      color: AppColor.blackColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          ...List.generate(
                                            4,
                                            (index) {
                                              return Expanded(
                                                child: Container(
                                                  height: 50,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    border: Border(
                                                      bottom: BorderSide(),
                                                      top: BorderSide(),
                                                      left: BorderSide(),
                                                      right: BorderSide(
                                                        color: index == 3
                                                            ? Colors.black
                                                            : Colors
                                                                .transparent,
                                                      ),
                                                    ),
                                                  ),
                                                  child: Text(
                                                    '${controller.education[index]}',
                                                    style: TextStyle(
                                                        color:
                                                            AppColor.blackColor,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                          IconButton(
                                            splashRadius: 20,
                                            onPressed: () {
                                              controller
                                                  .updateEducationLength();
                                            },
                                            icon: Icon(Icons.add),
                                          )
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          ...List.generate(
                                            controller.educationLength,
                                            (index1) {
                                              return Row(
                                                children: [
                                                  ...List.generate(
                                                    4,
                                                    (index) {
                                                      return Expanded(
                                                        child: Container(
                                                          height: 50,
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      10),
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border(
                                                              bottom:
                                                                  BorderSide(),
                                                              top: BorderSide(),
                                                              left:
                                                                  BorderSide(),
                                                              right: BorderSide(
                                                                color: index ==
                                                                        3
                                                                    ? Colors
                                                                        .black
                                                                    : Colors
                                                                        .transparent,
                                                              ),
                                                            ),
                                                          ),
                                                          child: TextFormField(
                                                            controller: controller
                                                                    .educationDetailsController[
                                                                index1][index],
                                                            onChanged: (val) {
                                                              print(
                                                                  '--------$val');
                                                              controller
                                                                  .addValueToEducationList(
                                                                value: val,
                                                                index: index1,
                                                                rowIndex: index,
                                                              );
                                                            },
                                                            textAlign: TextAlign
                                                                .center,
                                                            decoration:
                                                                InputDecoration(
                                                              border:
                                                                  InputBorder
                                                                      .none,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                  IconButton(
                                                    splashRadius: 20,
                                                    onPressed: () {
                                                      controller
                                                          .removeEducationLength(
                                                              index1);
                                                    },
                                                    icon: Icon(
                                                      Icons.remove,
                                                    ),
                                                  )
                                                ],
                                              );
                                            },
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                runSpacing: 30,
                                spacing: 10,
                                children: [
                                  Text(
                                    'Course  : ',
                                    style: TextStyle(
                                        color: AppColor.blackColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),

                                  /// C/C++
                                  Checkbox(
                                    activeColor: AppColor.mainColor,
                                    value: controller.iscCPlus,
                                    onChanged: (value) {
                                      controller.updateCCPlus();
                                    },
                                  ),
                                  Text(
                                    'C/C++',
                                    style: TextStyle(
                                      color: AppColor.blackColor,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(width: 20),

                                  /// DART
                                  Checkbox(
                                    activeColor: AppColor.mainColor,
                                    value: controller.isDart,
                                    onChanged: (value) {
                                      controller.updateDart();
                                    },
                                  ),
                                  Text(
                                    'Dart',
                                    style: TextStyle(
                                      color: AppColor.blackColor,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(width: 20),

                                  ///FLUTTER
                                  Checkbox(
                                    activeColor: AppColor.mainColor,
                                    value: controller.isFlutter,
                                    onChanged: (value) {
                                      controller.updateFlutter();
                                    },
                                  ),
                                  Text(
                                    'Flutter',
                                    style: TextStyle(
                                      color: AppColor.blackColor,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(width: 20),

                                  ///UI/UX
                                  Checkbox(
                                    activeColor: AppColor.mainColor,
                                    value: controller.isUiUx,
                                    onChanged: (value) {
                                      controller.updateUiUx();
                                    },
                                  ),
                                  Text(
                                    'UI/UX',
                                    style: TextStyle(
                                      color: AppColor.blackColor,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(width: 20),

                                  ///FULL STACK
                                  Checkbox(
                                    activeColor: AppColor.mainColor,
                                    value: controller.isFullStack,
                                    onChanged: (value) {
                                      controller.updateFullStack();
                                    },
                                  ),
                                  Text(
                                    'FULL STACK',
                                    style: TextStyle(
                                      color: AppColor.blackColor,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(width: 20),

                                  ///WEB
                                  Checkbox(
                                    activeColor: AppColor.mainColor,
                                    value: controller.isWeb,
                                    onChanged: (value) {
                                      controller.updateWeb();
                                    },
                                  ),
                                  Text(
                                    'Web',
                                    style: TextStyle(
                                      color: AppColor.blackColor,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(width: 20),

                                  /// NODE JS
                                  Checkbox(
                                    activeColor: AppColor.mainColor,
                                    value: controller.isNodeJs,
                                    onChanged: (value) {
                                      controller.updateNodeJs();
                                    },
                                  ),
                                  Text(
                                    'Node Js',
                                    style: TextStyle(
                                      color: AppColor.blackColor,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
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
                                    controller:
                                        controller.installmentController,
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
                                controller.loader == false
                                    ? SizedBox(
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
                                            controller
                                                .addStudentToFirebase(context);
                                          },
                                          child: Text('Save'),
                                        ),
                                      )
                                    : CircularProgressIndicator(),
                              ],
                            ),
                            SizedBox(
                              height: 40,
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
}
