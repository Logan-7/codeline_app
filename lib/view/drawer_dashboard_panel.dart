import 'package:codeline_app/controller/dashboard_controller.dart';
import 'package:codeline_app/controller/inquiry_controller.dart';
import 'package:codeline_app/view/dashboard/dash_board_screen.dart';
import 'package:codeline_app/view/fees_history/fees_history_screen.dart';
import 'package:codeline_app/view/fees_history/fees_screen.dart';
import 'package:codeline_app/view/inquiry/add_inquiry_screen.dart';
import 'package:codeline_app/view/inquiry/inquiry_screen.dart';
import 'package:codeline_app/view/student/add_student_screen.dart';
import 'package:codeline_app/view/student/student_list_screen.dart';
import 'package:codeline_app/widget/app_bar.dart';
import 'package:codeline_app/widget/app_color.dart';
import 'package:codeline_app/widget/dashboard_pannel.dart';
import 'package:codeline_app/widget/dashboard_view.dart';
import 'package:codeline_app/widget/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DashBoardController dashBoardController = Get.put(DashBoardController());
  InquiryController inquiryController = Get.put(InquiryController());
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColor.bgColor,
      appBar: customAppBar(
          context: context,
          onPress: () {
            _scaffoldKey.currentState!.openDrawer();
          }),
      drawer: Responsive.isMobile(context)
          ? DashBoardPanel(
              drawerKey: _scaffoldKey,
              inquiryController: inquiryController,
            )
          : SizedBox(),
      body: Row(
        children: [
          Responsive.isMobile(context)
              ? SizedBox()
              : DashBoardPanel(
                  drawerKey: _scaffoldKey,
                  inquiryController: inquiryController,
                ),
          Obx(
            () {
              return Expanded(
                child: dashBoardController.currentScreen.value ==
                        DashBoardPanelScreens.dashboard
                    ? DashboardScreen()
                    : dashBoardController.currentScreen.value ==
                            DashBoardPanelScreens.studentList
                        ? StudentListScreen()
                        : dashBoardController.currentScreen.value ==
                                DashBoardPanelScreens.inquiryList
                            ? InquiryScreen()
                            : dashBoardController.currentScreen.value ==
                                    DashBoardPanelScreens.addStudent
                                ? AddStudentScreen()
                                : dashBoardController.currentScreen.value ==
                                        DashBoardPanelScreens.fees
                                    ? FeesScreen()
                                    : dashBoardController.currentScreen.value ==
                                            DashBoardPanelScreens.addInquiry
                                        ? AddInquiryScreen()
                                        :

                                        // : dashBoardController
                                        //             .currentScreen.value ==
                                        //         DashBoardPanelScreens
                                        //             .addDevloper
                                        //     ? AddDevloperScreen()
                                        //     : dashBoardController
                                        //                 .currentScreen.value ==
                                        //             DashBoardPanelScreens
                                        //                 .devloper
                                        //         ? DevloperScreen()
                                        //         :

                                        FeesHistoryScreen(),
              );
            },
          )
        ],
      ),
    );
  }
}
