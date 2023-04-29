import 'package:codeline_app/controller/dashboard_controller.dart';
import 'package:codeline_app/controller/inquiry_controller.dart';
import 'package:codeline_app/widget/app_color.dart';
import 'package:codeline_app/widget/dashboard_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'tiles.dart';

class DashBoardPanel extends StatelessWidget {
  final drawerKey;
  final InquiryController inquiryController;

  const DashBoardPanel(
      {super.key, required this.drawerKey, required this.inquiryController});

  /// update __icon__ and __text__ color when button is pressed in
  /// dashboard panel
  ///
  /// default color white
  Color _updateColor(Rx<DashBoardPanelScreens> currentScreen,
      DashBoardPanelScreens dashBoardPanelScreens, bool hover,
      {required BuildContext context}) {
    if (currentScreen.value == dashBoardPanelScreens || hover == true) {
      return AppColor.whiteColor;
    }
    return AppColor.mainColor;
  }

  final double iconHeight = 22;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230,
      height: Get.height,
      color: AppColor.whiteColor,
      child: GetX<DashBoardController>(
        init: DashBoardController(),
        builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),

                /// 0
                MouseRegion(
                  onEnter: (e) {
                    controller.updateHover(true);
                  },
                  onExit: (e) {
                    controller.updateHover(false);
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 10,
                        height: 45,
                        margin: EdgeInsets.only(right: 20, bottom: 5),
                        decoration: BoxDecoration(
                          color: controller.currentScreen.value ==
                                  DashBoardPanelScreens.dashboard
                              ? AppColor.mainColor
                              : controller.hover.value == true
                                  ? AppColor.mainColor.withAlpha(100)
                                  : Colors.transparent,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                      ),
                      Container(
                        width: 180,
                        height: 45,
                        margin: EdgeInsets.only(right: 20, bottom: 5),
                        decoration: BoxDecoration(
                          color: controller.currentScreen.value ==
                                  DashBoardPanelScreens.dashboard
                              ? AppColor.mainColor
                              : controller.hover.value == true
                                  ? AppColor.mainColor.withAlpha(100)
                                  : Colors.transparent,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: CustomTile(
                          textColor: _updateColor(
                              controller.currentScreen,
                              DashBoardPanelScreens.dashboard,
                              controller.hover.value,
                              context: context),
                          titleMessage: "Dashboard",
                          onTap: () {
                            controller.currentScreen.value =
                                DashBoardPanelScreens.dashboard;
                            inquiryController.updateOpenInquiry(false);

                            drawerKey.currentState!.closeDrawer();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                /// 1
                MouseRegion(
                  onEnter: (e) {
                    controller.updateHover1(true);
                  },
                  onExit: (e) {
                    controller.updateHover1(false);
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 10,
                        height: 45,
                        margin: EdgeInsets.only(right: 20, bottom: 5),
                        decoration: BoxDecoration(
                          color: controller.currentScreen.value ==
                                  DashBoardPanelScreens.studentList
                              ? AppColor.mainColor
                              : controller.hover1.value == true
                                  ? AppColor.mainColor.withAlpha(100)
                                  : Colors.transparent,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                      ),
                      Container(
                        width: 180,
                        height: 45,
                        margin: EdgeInsets.only(right: 20, bottom: 5),
                        decoration: BoxDecoration(
                          color: controller.currentScreen.value ==
                                  DashBoardPanelScreens.studentList
                              ? AppColor.mainColor
                              : controller.hover1.value == true
                                  ? AppColor.mainColor.withAlpha(100)
                                  : Colors.transparent,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: CustomTile(
                          textColor: _updateColor(
                              controller.currentScreen,
                              DashBoardPanelScreens.studentList,
                              controller.hover1.value,
                              context: context),
                          titleMessage: "Student List",
                          onTap: () {
                            controller.currentScreen.value =
                                DashBoardPanelScreens.studentList;
                            drawerKey.currentState!.closeDrawer();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                /// 2
                MouseRegion(
                  onEnter: (e) {
                    controller.updateHover2(true);
                  },
                  onExit: (e) {
                    controller.updateHover2(false);
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 10,
                        height: 45,
                        margin: EdgeInsets.only(right: 20, bottom: 5),
                        decoration: BoxDecoration(
                          color: controller.currentScreen.value ==
                                  DashBoardPanelScreens.inquiryList
                              ? AppColor.mainColor
                              : controller.hover2.value == true
                                  ? AppColor.mainColor.withAlpha(100)
                                  : Colors.transparent,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                      ),
                      Container(
                        width: 180,
                        height: 45,
                        margin: EdgeInsets.only(right: 20, bottom: 5),
                        decoration: BoxDecoration(
                          color: controller.currentScreen.value ==
                                  DashBoardPanelScreens.inquiryList
                              ? AppColor.mainColor
                              : controller.hover2.value == true
                                  ? AppColor.mainColor.withAlpha(100)
                                  : Colors.transparent,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: CustomTile(
                          textColor: _updateColor(
                              controller.currentScreen,
                              DashBoardPanelScreens.inquiryList,
                              controller.hover2.value,
                              context: context),
                          titleMessage: "Inquiry List",
                          onTap: () {
                            controller.currentScreen.value =
                                DashBoardPanelScreens.inquiryList;
                            inquiryController.updateOpenInquiry(false);
                            drawerKey.currentState!.closeDrawer();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                /// 3
                MouseRegion(
                  onEnter: (e) {
                    controller.updateHover3(true);
                  },
                  onExit: (e) {
                    controller.updateHover3(false);
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 10,
                        height: 45,
                        margin: EdgeInsets.only(right: 20, bottom: 5),
                        decoration: BoxDecoration(
                          color: controller.currentScreen.value ==
                                  DashBoardPanelScreens.addStudent
                              ? AppColor.mainColor
                              : controller.hover3.value == true
                                  ? AppColor.mainColor.withAlpha(100)
                                  : Colors.transparent,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                      ),
                      Container(
                        width: 180,
                        height: 45,
                        margin: EdgeInsets.only(right: 20, bottom: 5),
                        decoration: BoxDecoration(
                          color: controller.currentScreen.value ==
                                  DashBoardPanelScreens.addStudent
                              ? AppColor.mainColor
                              : controller.hover3.value == true
                                  ? AppColor.mainColor.withAlpha(100)
                                  : Colors.transparent,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: CustomTile(
                          textColor: _updateColor(
                              controller.currentScreen,
                              DashBoardPanelScreens.addStudent,
                              controller.hover3.value,
                              context: context),
                          titleMessage: "Add Student",
                          onTap: () {
                            controller.currentScreen.value =
                                DashBoardPanelScreens.addStudent;
                            drawerKey.currentState!.closeDrawer();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                /// 6
                MouseRegion(
                  onEnter: (e) {
                    controller.updateHover6(true);
                  },
                  onExit: (e) {
                    controller.updateHover6(false);
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 10,
                        height: 45,
                        margin: EdgeInsets.only(right: 20, bottom: 5),
                        decoration: BoxDecoration(
                          color: controller.currentScreen.value ==
                                  DashBoardPanelScreens.addInquiry
                              ? AppColor.mainColor
                              : controller.hover6.value == true
                                  ? AppColor.mainColor.withAlpha(100)
                                  : Colors.transparent,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                      ),
                      Container(
                        width: 180,
                        height: 45,
                        margin: EdgeInsets.only(right: 20, bottom: 5),
                        decoration: BoxDecoration(
                          color: controller.currentScreen.value ==
                                  DashBoardPanelScreens.addInquiry
                              ? AppColor.mainColor
                              : controller.hover6.value == true
                                  ? AppColor.mainColor.withAlpha(100)
                                  : Colors.transparent,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: CustomTile(
                          textColor: _updateColor(
                              controller.currentScreen,
                              DashBoardPanelScreens.addInquiry,
                              controller.hover6.value,
                              context: context),
                          titleMessage: "Add Inquiry",
                          onTap: () {
                            controller.currentScreen.value =
                                DashBoardPanelScreens.addInquiry;
                            drawerKey.currentState!.closeDrawer();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                /// 7
                // MouseRegion(
                //   onEnter: (e) {
                //     controller.updateHover7(true);
                //   },
                //   onExit: (e) {
                //     controller.updateHover7(false);
                //   },
                //   child: Row(
                //     children: [
                //       Container(
                //         width: 10,
                //         height: 45,
                //         margin: EdgeInsets.only(right: 20, bottom: 5),
                //         decoration: BoxDecoration(
                //           color: controller.currentScreen.value ==
                //                   DashBoardPanelScreens.addDevloper
                //               ? AppColor.mainColor
                //               : controller.hover7.value == true
                //                   ? AppColor.mainColor.withAlpha(100)
                //                   : Colors.transparent,
                //           borderRadius: BorderRadius.only(
                //             topRight: Radius.circular(10),
                //             bottomRight: Radius.circular(10),
                //           ),
                //         ),
                //       ),
                //       Container(
                //         width: 180,
                //         height: 45,
                //         margin: EdgeInsets.only(right: 20, bottom: 5),
                //         decoration: BoxDecoration(
                //           color: controller.currentScreen.value ==
                //                   DashBoardPanelScreens.addDevloper
                //               ? AppColor.mainColor
                //               : controller.hover7.value == true
                //                   ? AppColor.mainColor.withAlpha(100)
                //                   : Colors.transparent,
                //           borderRadius: BorderRadius.circular(14),
                //         ),
                //         child: CustomTile(
                //           textColor: _updateColor(
                //               controller.currentScreen,
                //               DashBoardPanelScreens.addDevloper,
                //               controller.hover7.value,
                //               context: context),
                //           titleMessage: "Add Devloper",
                //           onTap: () {
                //             controller.currentScreen.value =
                //                 DashBoardPanelScreens.addDevloper;
                //             drawerKey.currentState!.closeDrawer();
                //           },
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                //
                // /// 8
                // MouseRegion(
                //   onEnter: (e) {
                //     controller.updateHover8(true);
                //   },
                //   onExit: (e) {
                //     controller.updateHover8(false);
                //   },
                //   child: Row(
                //     children: [
                //       Container(
                //         width: 10,
                //         height: 45,
                //         margin: EdgeInsets.only(right: 20, bottom: 5),
                //         decoration: BoxDecoration(
                //           color: controller.currentScreen.value ==
                //                   DashBoardPanelScreens.devloper
                //               ? AppColor.mainColor
                //               : controller.hover8.value == true
                //                   ? AppColor.mainColor.withAlpha(100)
                //                   : Colors.transparent,
                //           borderRadius: BorderRadius.only(
                //             topRight: Radius.circular(10),
                //             bottomRight: Radius.circular(10),
                //           ),
                //         ),
                //       ),
                //       Container(
                //         width: 180,
                //         height: 45,
                //         margin: EdgeInsets.only(right: 20, bottom: 5),
                //         decoration: BoxDecoration(
                //           color: controller.currentScreen.value ==
                //                   DashBoardPanelScreens.devloper
                //               ? AppColor.mainColor
                //               : controller.hover8.value == true
                //                   ? AppColor.mainColor.withAlpha(100)
                //                   : Colors.transparent,
                //           borderRadius: BorderRadius.circular(14),
                //         ),
                //         child: CustomTile(
                //           textColor: _updateColor(
                //               controller.currentScreen,
                //               DashBoardPanelScreens.devloper,
                //               controller.hover8.value,
                //               context: context),
                //           titleMessage: "Devloper",
                //           onTap: () {
                //             controller.currentScreen.value =
                //                 DashBoardPanelScreens.devloper;
                //             drawerKey.currentState!.closeDrawer();
                //           },
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // const SizedBox(
                //   height: 10,
                // ),

                /// 4
                MouseRegion(
                  onEnter: (e) {
                    controller.updateHover4(true);
                  },
                  onExit: (e) {
                    controller.updateHover4(false);
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 10,
                        height: 45,
                        margin: EdgeInsets.only(right: 20, bottom: 5),
                        decoration: BoxDecoration(
                          color: controller.currentScreen.value ==
                                  DashBoardPanelScreens.fees
                              ? AppColor.mainColor
                              : controller.hover4.value == true
                                  ? AppColor.mainColor.withAlpha(100)
                                  : Colors.transparent,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                      ),
                      Container(
                        width: 180,
                        height: 45,
                        margin: EdgeInsets.only(right: 20, bottom: 5),
                        decoration: BoxDecoration(
                          color: controller.currentScreen.value ==
                                  DashBoardPanelScreens.fees
                              ? AppColor.mainColor
                              : controller.hover4.value == true
                                  ? AppColor.mainColor.withAlpha(100)
                                  : Colors.transparent,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: CustomTile(
                          titleMessage: "Fees",
                          textColor: _updateColor(
                              controller.currentScreen,
                              DashBoardPanelScreens.fees,
                              controller.hover4.value,
                              context: context),
                          onTap: () {
                            controller.currentScreen.value =
                                DashBoardPanelScreens.fees;
                            drawerKey.currentState!.closeDrawer();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                /// 5
                MouseRegion(
                  onEnter: (e) {
                    controller.updateHover5(true);
                  },
                  onExit: (e) {
                    controller.updateHover5(false);
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 10,
                        height: 45,
                        margin: EdgeInsets.only(right: 20, bottom: 5),
                        decoration: BoxDecoration(
                          color: controller.currentScreen.value ==
                                  DashBoardPanelScreens.feesHistory
                              ? AppColor.mainColor
                              : controller.hover5.value == true
                                  ? AppColor.mainColor.withAlpha(100)
                                  : Colors.transparent,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                      ),
                      Container(
                        width: 180,
                        height: 45,
                        margin: EdgeInsets.only(right: 20, bottom: 5),
                        decoration: BoxDecoration(
                          color: controller.currentScreen.value ==
                                  DashBoardPanelScreens.feesHistory
                              ? AppColor.mainColor
                              : controller.hover5.value == true
                                  ? AppColor.mainColor.withAlpha(100)
                                  : Colors.transparent,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: CustomTile(
                          titleMessage: "Fees History",
                          textColor: _updateColor(
                              controller.currentScreen,
                              DashBoardPanelScreens.feesHistory,
                              controller.hover5.value,
                              context: context),
                          onTap: () {
                            controller.currentScreen.value =
                                DashBoardPanelScreens.feesHistory;
                            drawerKey.currentState!.closeDrawer();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
