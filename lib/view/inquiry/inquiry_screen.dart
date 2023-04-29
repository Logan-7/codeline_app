import 'package:codeline_app/controller/inquiry_controller.dart';
import 'package:codeline_app/view/dashboard/widget/header_value.dart';
import 'package:codeline_app/view/inquiry/edit_inquiry_screen.dart';
import 'package:codeline_app/widget/app_color.dart';
import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InquiryScreen extends StatefulWidget {
  const InquiryScreen({Key? key}) : super(key: key);

  @override
  State<InquiryScreen> createState() => _InquiryScreenState();
}

class _InquiryScreenState extends State<InquiryScreen> {
  InquiryController inquiryController = Get.put(InquiryController());
  Widget build(BuildContext context) {
    return GetBuilder<InquiryController>(
      builder: (controller) {
        return Scaffold(
          body: controller.openInquiry == false
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            'Inquiry',
                            style: TextStyle(
                                color: AppColor.mainColor,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Transform.rotate(
                            angle: 1.555,
                            child: Container(
                              height: 40,
                              width: 40,
                              child: Divider(
                                color: AppColor.blackColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Container(
                              height: 40,
                              child: TextFormField(
                                controller: controller.searchController,
                                onChanged: (val) {
                                  controller.getSearchData(val);
                                },
                                cursorColor: AppColor.mainColor,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Icon(Icons.search,
                                      color: AppColor.grey400),
                                  hintText: 'Search here....',
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Divider(
                        color: AppColor.grey400,
                      ),
                      Row(
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
                              width: 50, height: 50, color: AppColor.grey100)
                        ],
                      ),
                      Expanded(
                        child: FutureBuilder(
                          future: controller.getInquiryList(),
                          builder: (BuildContext context,
                              AsyncSnapshot<List<Document>> snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              var inquiryListData = snapshot.data;
                              return inquiryListData!.isEmpty
                                  ? Text(
                                      'No Fees History',
                                      style: TextStyle(
                                          color: AppColor.mainColor,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
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
                                                    alignment: Alignment.center,
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
                                                      child: Text('Follow Up'),
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
                        height: 15,
                      ),
                    ],
                  ),
                )
              : UpdateInquiryScreen(),
        );
      },
    );
  }
}

buildRow(
    {String? heading = '',
    String? answer = '',
    Color answerColor = Colors.black}) {
  return Row(
    children: [
      Expanded(
        flex: 1,
        child: Container(
          child: Text('$heading'.toUpperCase()),
        ),
      ),
      Expanded(
        flex: 20,
        child: Container(
          child: Text(
            '$answer'.toUpperCase(),
            style: TextStyle(color: answerColor),
          ),
        ),
      ),
    ],
  );
}
