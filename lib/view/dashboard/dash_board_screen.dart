import 'package:codeline_app/controller/inquiry_controller.dart';
import 'package:codeline_app/view/dashboard/widget/header_value.dart';
import 'package:codeline_app/view/inquiry/edit_inquiry_screen.dart';
import 'package:codeline_app/widget/app_color.dart';
import 'package:codeline_app/widget/images_path.dart';
import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  InquiryController inquiryController = Get.put(InquiryController());
  List data = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InquiryController>(
      builder: (controller) {
        return Scaffold(
          body: controller.openInquiry == true
              ? UpdateInquiryScreen()
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Welcome Admin',
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
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            /// STUDENT
                            Column(
                              children: [
                                InkWell(
                                  borderRadius: BorderRadius.circular(10000),
                                  onTap: () {
                                    controller.updateDashboardIndex(0);
                                  },
                                  child: buildDashboardImage(
                                      image: AppImages.student, index: 0),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FutureBuilder(
                                      future: controller.getStudentList(),
                                      builder: (BuildContext context,
                                          AsyncSnapshot<List<Document>>
                                              snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.done) {
                                          var studentListData = snapshot.data;
                                          return Text(
                                            '${studentListData?.length}',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          );
                                        } else if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return Text(
                                            '',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
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
                                    Text(
                                      'Total Student',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: AppColor.grey400),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            /// INQUIRY

                            Column(
                              children: [
                                InkWell(
                                  borderRadius: BorderRadius.circular(10000),
                                  onTap: () {
                                    controller.updateDashboardIndex(1);
                                  },
                                  child: buildDashboardImage(
                                      image: AppImages.work, index: 1),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FutureBuilder(
                                      future: controller.getInquiryList(),
                                      builder: (BuildContext context,
                                          AsyncSnapshot<List<Document>>
                                              snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.done) {
                                          var studentListData = snapshot.data;
                                          return Text(
                                            '${studentListData?.length}',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          );
                                        } else if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return Text(
                                            '',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
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
                                    Text(
                                      'Total Inquiry',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: AppColor.grey400),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            /// CURRENT DEMO

                            Column(
                              children: [
                                InkWell(
                                  borderRadius: BorderRadius.circular(10000),
                                  onTap: () {
                                    controller.updateDashboardIndex(2);
                                  },
                                  child: buildDashboardImage(
                                      image: AppImages.chart, index: 2),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FutureBuilder(
                                      future: controller.getInquiryList(),
                                      builder: (BuildContext context,
                                          AsyncSnapshot<List<Document>>
                                              snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.done) {
                                          var studentListData = snapshot.data;
                                          List data = [];

                                          try {
                                            for (int i = 0;
                                                i < studentListData!.length;
                                                i++) {
                                              if (studentListData[i]
                                                      ['status'] ==
                                                  'Demo Started') {
                                                data.add(i);
                                              }
                                            }
                                          } catch (e) {
                                            print('-----ERROR----$e');
                                          }

                                          return Text(
                                            '${data.length}',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          );
                                        } else if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return Text(
                                            '',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
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
                                    Text(
                                      'Current Demo',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: AppColor.grey400),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            /// COMPLETE STUDENT
                            Column(
                              children: [
                                InkWell(
                                  borderRadius: BorderRadius.circular(10000),
                                  onTap: () {
                                    controller.updateDashboardIndex(3);
                                  },
                                  child: buildDashboardImage(
                                      image: AppImages.badge, index: 3),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FutureBuilder(
                                      future: controller.getInquiryList(),
                                      builder: (BuildContext context,
                                          AsyncSnapshot<List<Document>>
                                              snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.done) {
                                          var studentListData = snapshot.data;
                                          List data = [];

                                          try {
                                            for (int i = 0;
                                                i < studentListData!.length;
                                                i++) {
                                              if (studentListData[i]
                                                      ['status'] ==
                                                  'Joined') {
                                                data.add(i);
                                              }
                                            }
                                          } catch (e) {
                                            print('-----ERROR----$e');
                                          }
                                          return Text(
                                            '${data.length}',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          );
                                        } else if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return Text(
                                            '',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
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
                                    Text(
                                      'Complete Student',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: AppColor.grey400),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 100,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Inquiry',
                            style: TextStyle(
                                color: AppColor.mainColor,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        controller.selectedDashboardIndex == 1
                            ? Row(
                                children: [
                                  Text(
                                    'No',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  heading(name: 'Name'),
                                  heading(name: 'Mobile No'),
                                  heading(name: 'Status'),
                                  heading(name: 'Note'),
                                  Container(
                                    height: 50,
                                    width: 200,
                                    color: AppColor.grey100,
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Follow Up',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  Container(
                                      width: 50,
                                      height: 50,
                                      color: AppColor.grey100)
                                ],
                              )
                            : Row(
                                children: [
                                  Text(
                                    'No',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  heading(name: 'Name'),
                                  heading(name: 'Email'),
                                  heading(name: 'DOB'),
                                  heading(name: 'Mobile No'),
                                ],
                              ),
                        Expanded(
                          child: FutureBuilder(
                            future: controller.getInquiryData(),
                            builder: (BuildContext context,
                                AsyncSnapshot<List<Document>> snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                var inquiryListData = snapshot.data;
                                return inquiryListData!.isEmpty
                                    ? Center(
                                        child: Text(
                                          'No Inquiry',
                                          style: TextStyle(
                                              color: AppColor.mainColor,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    : ListView.separated(
                                        separatorBuilder:
                                            (BuildContext context, int index) {
                                          return inquiryListData[index]['name']
                                                  .toString()
                                                  .toLowerCase()
                                                  .contains(
                                                    controller.searchData
                                                        .toLowerCase(),
                                                  )
                                              ? Divider()
                                              : SizedBox();
                                        },
                                        itemBuilder: (context, index) {
                                          var status = inquiryListData[index]
                                                  ['status']
                                              .toString()
                                              .toLowerCase();
                                          return inquiryListData[index]['name']
                                                  .toString()
                                                  .toLowerCase()
                                                  .contains(
                                                    controller.searchData
                                                        .toLowerCase(),
                                                  )
                                              ? Row(
                                                  children: [
                                                    Text(
                                                      '${index + 1}',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                    value(
                                                        name:
                                                            '${inquiryListData[index]['name']}'),
                                                    value(
                                                        name:
                                                            ' ${inquiryListData[index]['mobile']}'),
                                                    value(
                                                      name:
                                                          ' ${inquiryListData[index]['status']}',
                                                      color: status ==
                                                              'Follow Up'
                                                                  .toLowerCase()
                                                          ? AppColor.blueColor
                                                          : status ==
                                                                  'Demo Started'
                                                                      .toLowerCase()
                                                              ? AppColor
                                                                  .yellowColor
                                                              : status ==
                                                                      'Joined'
                                                                          .toLowerCase()
                                                                  ? AppColor
                                                                      .greenColor
                                                                  : AppColor
                                                                      .redColor,
                                                    ),
                                                    value(
                                                        name:
                                                            '${inquiryListData[index]['note']}'),
                                                    Container(
                                                      height: 50,
                                                      width: 200,
                                                      alignment:
                                                          Alignment.center,
                                                      child: ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                backgroundColor:
                                                                    AppColor
                                                                        .mainColor),
                                                        onPressed: () {
                                                          controller
                                                              .updateStudentId(
                                                                  inquiryListData[
                                                                          index]
                                                                      .id);

                                                          controller
                                                              .updateOpenInquiry(
                                                                  true);
                                                        },
                                                        child:
                                                            Text('Follow Up'),
                                                      ),
                                                    ),
                                                    Container(
                                                        width: 50,
                                                        color: AppColor.grey100)
                                                  ],
                                                )
                                              // InkWell(
                                              //         onTap: () {
                                              //           controller.updateStudentId(
                                              //               inquiryListData[index]
                                              //                   .id);
                                              //
                                              //           controller
                                              //               .updateOpenInquiry(true);
                                              //         },
                                              //         child: Container(
                                              //           padding: EdgeInsets.all(10),
                                              //           margin: EdgeInsets.all(10),
                                              //           decoration: BoxDecoration(
                                              //               color:
                                              //                   AppColor.whiteColor,
                                              //               borderRadius:
                                              //                   BorderRadius.circular(
                                              //                       10)),
                                              //           child: Column(
                                              //             crossAxisAlignment:
                                              //                 CrossAxisAlignment
                                              //                     .start,
                                              //             children: [
                                              //               buildRow(
                                              //                   heading: 'No',
                                              //                   answer:
                                              //                       ':   ${inquiryListData[index]['no']}'),
                                              //               SizedBox(
                                              //                 height: 5,
                                              //               ),
                                              //               buildRow(
                                              //                   heading: 'Name',
                                              //                   answer:
                                              //                       ':   ${inquiryListData[index]['name']}'),
                                              //               SizedBox(
                                              //                 height: 5,
                                              //               ),
                                              //               buildRow(
                                              //                   heading: 'Number',
                                              //                   answer:
                                              //                       ':   ${inquiryListData[index]['mobile']}'),
                                              //               SizedBox(
                                              //                 height: 5,
                                              //               ),
                                              //               buildRow(
                                              //                 heading: 'Status',
                                              //                 answer:
                                              //                     ':   ${inquiryListData[index]['status']}',
                                              //                 answerColor: inquiryListData[
                                              //                                     index]
                                              //                                 [
                                              //                                 'status']
                                              //                             .toString()
                                              //                             .toLowerCase() ==
                                              //                         'Follow Up'
                                              //                             .toLowerCase()
                                              //                     ? AppColor.blueColor
                                              //                     : AppColor.redColor,
                                              //               ),
                                              //               SizedBox(
                                              //                 height: 5,
                                              //               ),
                                              //               buildRow(
                                              //                   heading: 'Note',
                                              //                   answer:
                                              //                       ':   ${inquiryListData[index]['note']}'),
                                              //             ],
                                              //           ),
                                              //         ),
                                              //       )
                                              : SizedBox();
                                        },
                                        itemCount: snapshot.data!.length,
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
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // controller.selectedDashboardIndex == 1
                        //     ? InquiryData(controller: controller, data: data)
                        //     : StudentData(controller: controller),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }

  Container buildDashboardImage({String? image, int? index}) {
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColor.mainColor, width: 7),
      ),
      child: Center(
        child: Image.asset(
          image!,
          height: index == 0 ? 90 : 70,
          width: index == 0 ? 90 : 70,
        ),
      ),
    );
  }
}
