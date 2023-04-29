import 'package:codeline_app/controller/inquiry_controller.dart';
import 'package:codeline_app/view/inquiry/edit_inquiry_screen.dart';
import 'package:codeline_app/widget/app_color.dart';
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
                      children: [
                        Wrap(
                          spacing: 50,
                          children: [
                            Container(
                              height: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                  color: AppColor.mainColor.withAlpha(100),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Total Student',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
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
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
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
                                ],
                              ),
                            ),
                            Container(
                              height: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                  color: AppColor.mainColor.withAlpha(100),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Total Inquiry',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
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
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
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
                                ],
                              ),
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
                        Row(
                          children: [
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
                                width: 50, height: 50, color: AppColor.grey100)
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: FutureBuilder(
                            future: controller.getInquiryList(),
                            builder: (BuildContext context,
                                AsyncSnapshot<List<Document>> snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                DateTime todayDate = DateTime.now();
                                DateTime threeDayAgoTime =
                                    todayDate.subtract(Duration(days: 3));
                                var inquiryListData = snapshot.data;
                                return ListView.separated(
                                  itemBuilder: (context, index) {
                                    return threeDayAgoTime.isBefore(
                                            inquiryListData![index]
                                                ['followUpdate'])
                                        ? Row(
                                            children: [
                                              value(
                                                  name:
                                                      '${inquiryListData[index]['name']}'),
                                              value(
                                                  name:
                                                      ' ${inquiryListData[index]['mobile']}'),
                                              value(
                                                name:
                                                    ' ${inquiryListData[index]['status']}',
                                                color: inquiryListData[index]
                                                                ['status']
                                                            .toString()
                                                            .toLowerCase() ==
                                                        'Follow Up'
                                                            .toLowerCase()
                                                    ? AppColor.blueColor
                                                    : AppColor.redColor,
                                              ),
                                              value(
                                                  name:
                                                      '${inquiryListData[index]['note']}'),
                                              Container(
                                                height: 50,
                                                width: 200,
                                                alignment: Alignment.center,
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    controller.updateStudentId(
                                                        inquiryListData[index]
                                                            .id);

                                                    controller
                                                        .updateOpenInquiry(
                                                            true);
                                                  },
                                                  child: Text('Follow Up'),
                                                ),
                                              ),
                                              Container(
                                                  width: 50,
                                                  color: AppColor.grey100)
                                            ],
                                          )
                                        : SizedBox();
                                  },
                                  itemCount: snapshot.data!.length,
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return threeDayAgoTime.isBefore(
                                            inquiryListData![index]['date'])
                                        ? Divider()
                                        : SizedBox();
                                  },
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
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}

Expanded heading({String? name}) {
  return Expanded(
    child: Container(
      height: 50,
      color: AppColor.grey100,
      alignment: Alignment.center,
      child: Text(
        '$name',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    ),
  );
}

Expanded value({String? name, Color color = Colors.black}) {
  return Expanded(
    child: Container(
      height: 50,
      alignment: Alignment.center,
      child: Text(
        '$name',
        style: TextStyle(fontSize: 15, color: color),
      ),
    ),
  );
}
// controller.updateStudentId(
// inquiryListData[index].id);
//
// controller
//     .updateOpenInquiry(true);
// Container(
// padding: EdgeInsets.all(10),
// margin: EdgeInsets.all(10),
// decoration: BoxDecoration(
// color: AppColor.whiteColor,
// borderRadius:
// BorderRadius.circular(10)),
// child: Column(
// crossAxisAlignment:
// CrossAxisAlignment.start,
// children: [
// buildRow(
// heading: 'No',
// answer:
// ':   ${inquiryListData![index]['no']}'),
// SizedBox(
// height: 5,
// ),
// buildRow(
// heading: 'Name',
// answer:
// ':   ${inquiryListData[index]['name']}'),
// SizedBox(
// height: 5,
// ),
// buildRow(
// heading: 'Number',
// answer:
// ':   ${inquiryListData[index]['mobile']}'),
// SizedBox(
// height: 5,
// ),
// buildRow(
// heading: 'Status',
// answer:
// ':   ${inquiryListData[index]['status']}',
// answerColor: inquiryListData[
// index]
// ['status']
// .toString()
//     .toLowerCase() ==
// 'Follow Up'
// .toLowerCase()
// ? AppColor.blueColor
//     : AppColor.redColor,
// ),
// SizedBox(
// height: 5,
// ),
// buildRow(
// heading: 'Note',
// answer:
// ':   ${inquiryListData[index]['note']}'),
// ],
// ),
// ),
