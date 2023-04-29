import 'package:codeline_app/controller/fees_history_controller.dart';
import 'package:codeline_app/view/dashboard/widget/header_value.dart';
import 'package:codeline_app/widget/app_color.dart';
import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeesHistoryScreen extends StatefulWidget {
  const FeesHistoryScreen({Key? key}) : super(key: key);

  @override
  State<FeesHistoryScreen> createState() => _FeesHistoryScreenState();
}

class _FeesHistoryScreenState extends State<FeesHistoryScreen> {
  FeesHistoryController feesHistoryController =
      Get.put(FeesHistoryController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FeesHistoryController>(
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
                      'Fees History',
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
                Row(
                  children: [
                    Text(
                      'No',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    heading(name: 'Roll No'),
                    heading(name: 'Name'),
                    heading(name: 'Instalment No'),
                    Container(width: 50, height: 50, color: AppColor.grey100)
                  ],
                ),
                Expanded(
                  child: FutureBuilder(
                    future: controller.getFeesHistory(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Document>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        var feesData = snapshot.data;
                        return feesData!.isEmpty
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
                                  return feesData[index]['name']
                                          .toString()
                                          .toLowerCase()
                                          .contains(
                                            controller.searchData.toLowerCase(),
                                          )
                                      ? Divider()
                                      : SizedBox();
                                },
                                itemBuilder: (context, index) {
                                  return feesData[index]['name']
                                          .toString()
                                          .toLowerCase()
                                          .contains(
                                            controller.searchData.toLowerCase(),
                                          )
                                      ? Row(
                                          children: [
                                            Text(
                                              '${index + 1}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              ),
                                            ),
                                            value(
                                                name:
                                                    '${feesData[index]['no']}'),
                                            value(
                                                name:
                                                    '${feesData[index]['name']}'),
                                            value(
                                              name:
                                                  ' ${feesData[index]['instalment']}',
                                            ),
                                            Container(
                                                width: 50,
                                                color: AppColor.grey100)
                                          ],
                                        )
                                      // Container(
                                      //         padding: EdgeInsets.all(10),
                                      //         margin: EdgeInsets.all(10),
                                      //         decoration: BoxDecoration(
                                      //             color: AppColor.whiteColor,
                                      //             borderRadius:
                                      //                 BorderRadius.circular(10)),
                                      //         child: Column(
                                      //           crossAxisAlignment:
                                      //               CrossAxisAlignment.start,
                                      //           children: [
                                      //             buildRow(
                                      //               heading: 'Name',
                                      //               answer:
                                      //                   ':   ${feesData[index]['name']}',
                                      //             ),
                                      //             // SizedBox(
                                      //             //   height: 5,
                                      //             // ),
                                      //             // buildRow(
                                      //             //   heading: 'Date',
                                      //             //   answer:
                                      //             //       ':   ${feesData[index]['date']}',
                                      //             // ),
                                      //             SizedBox(
                                      //               height: 5,
                                      //             ),
                                      //             buildRow(
                                      //               heading: 'No',
                                      //               answer:
                                      //                   ':   ${feesData[index]['no']}',
                                      //             ),
                                      //             SizedBox(
                                      //               height: 5,
                                      //             ),
                                      //             buildRow(
                                      //               heading: 'Instalment No',
                                      //               answer:
                                      //                   ':   ${feesData[index]['instalment']}',
                                      //             ),
                                      //           ],
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
          flex: 2,
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
