import 'package:codeline_app/controller/inquiry_controller.dart';
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
          body: Padding(
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
                            prefixIcon:
                                Icon(Icons.search, color: AppColor.grey400),
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
                Expanded(
                  child: FutureBuilder(
                    future: controller.getInquiryList(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Document>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        var inquiryListData = snapshot.data;
                        return inquiryListData!.isEmpty
                            ? Text(
                                'No Fees History',
                                style: TextStyle(
                                    color: AppColor.mainColor,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              )
                            : ListView.builder(
                                itemBuilder: (context, index) {
                                  return inquiryListData[index]['name']
                                          .toString()
                                          .toLowerCase()
                                          .contains(
                                            controller.searchData.toLowerCase(),
                                          )
                                      ? Container(
                                          padding: EdgeInsets.all(10),
                                          margin: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              color: AppColor.whiteColor,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              buildRow(
                                                  heading: 'No',
                                                  answer:
                                                      ':   ${inquiryListData[index]['no']}'),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              buildRow(
                                                  heading: 'Name',
                                                  answer:
                                                      ':   ${inquiryListData[index]['name']}'),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              buildRow(
                                                  heading: 'Number',
                                                  answer:
                                                      ':   ${inquiryListData[index]['mobile']}'),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              buildRow(
                                                heading: 'Status',
                                                answer:
                                                    ':   ${inquiryListData[index]['called']}',
                                                answerColor: inquiryListData[
                                                                index]['called']
                                                            .toString()
                                                            .toLowerCase() ==
                                                        'call'
                                                    ? AppColor.blueColor
                                                    : AppColor.redColor,
                                              ),
                                            ],
                                          ),
                                        )
                                      : SizedBox();
                                },
                                itemCount: snapshot.data?.length,
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
          ),
        );
      },
    );
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
}
