// ignore_for_file: library_prefixes
import 'package:codeline_app/widget/dashboard_view.dart';
import 'package:get/get.dart';

class DashBoardController extends GetxController {
  Rx<DashBoardPanelScreens> currentScreen = DashBoardPanelScreens.dashboard.obs;

  var hover = false.obs;
  var hover1 = false.obs;
  var hover2 = false.obs;
  var hover3 = false.obs;
  var hover4 = false.obs;
  var hover5 = false.obs;
  var hover6 = false.obs;
  var hover7 = false.obs;
  var hover8 = false.obs;

  updateHover(bool val) {
    hover.value = val;
    update();
  }

  updateHover1(bool val) {
    hover1.value = val;
    update();
  }

  updateHover2(bool val) {
    hover2.value = val;
    update();
  }

  updateHover3(bool val) {
    hover3.value = val;
    update();
  }

  updateHover4(bool val) {
    hover4.value = val;
    update();
  }

  updateHover5(bool val) {
    hover5.value = val;
    update();
  }

  updateHover6(bool val) {
    hover6.value = val;
    update();
  }

  updateHover7(bool val) {
    hover7.value = val;
    update();
  }

  updateHover8(bool val) {
    hover8.value = val;
    update();
  }
}