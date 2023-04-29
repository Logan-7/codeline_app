import 'package:codeline_app/controller/student_controller.dart';
import 'package:codeline_app/view/dashboard/widget/hesder_value.dart';
import 'package:codeline_app/widget/app_color.dart';
import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentListScreen extends StatefulWidget {
  const StudentListScreen({Key? key}) : super(key: key);

  @override
  State<StudentListScreen> createState() => _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen> {
  StudentController studentController = Get.put(StudentController());

  Widget build(BuildContext context) {
    return GetBuilder<StudentController>(
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
                      'Students',
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
                    future: controller.getStudentList(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Document>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        var studentListData = snapshot.data;
                        return studentListData!.isEmpty
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
                                  return studentListData[index]['name']
                                          .toString()
                                          .toLowerCase()
                                          .contains(
                                            controller.searchData.toLowerCase(),
                                          )
                                      ? Divider()
                                      : SizedBox();
                                },
                                itemBuilder: (context, index) {
                                  return studentListData[index]['name']
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
                                                    '${studentListData[index]['rollNo']}'),
                                            value(
                                                name:
                                                    '${studentListData[index]['name']}'),
                                            value(
                                              name:
                                                  ' ${studentListData[index]['instalment']}',
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
                                      //                 heading: 'Name',
                                      //                 answer:
                                      //                     ':   ${studentListData[index]['name']}'),
                                      //             SizedBox(
                                      //               height: 5,
                                      //             ),
                                      //             buildRow(
                                      //                 heading: 'RollNo',
                                      //                 answer:
                                      //                     ':   ${studentListData[index]['rollNo']}'),
                                      //             SizedBox(
                                      //               height: 5,
                                      //             ),
                                      //             buildRow(
                                      //                 heading: 'Instalment No',
                                      //                 answer:
                                      //                     ':   ${studentListData[index]['instalment']}'),
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
