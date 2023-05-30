// import 'package:flutter/material.dart';
//
// class demo extends StatefulWidget {
//   const demo({Key? key}) : super(key: key);
//
//   @override
//   State<demo> createState() => _demoState();
// }
//
// class _demoState extends State<demo> {
//   var data;
//
//   List<List<TextEditingController>> controllers = [];
//   List<Map> installmentDetails = [];
//
//   void instalmentDetails() {
//     data['installmentDetails'].forEach((element) {
//       installmentDetails.add(element);
//     });
//
//     if (installmentDetails != [] || installmentDetails.isNotEmpty) {
//       for (var i = 0; i < installmentDetails.length; i++) {
//         controllers.add([
//           TextEditingController(text: installmentDetails[i]['amount']),
//           TextEditingController(text: installmentDetails[i]['amount']),
//           TextEditingController(text: installmentDetails[i]['amount']),
//           TextEditingController(text: installmentDetails[i]['amount']),
//           TextEditingController(text: installmentDetails[i]['amount']),
//         ]);
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           controllers.add([
//             TextEditingController(),
//             TextEditingController(),
//             TextEditingController(),
//             TextEditingController(),
//             TextEditingController(),
//           ]);
//         },
//       ),
//       body: Column(
//         children: [
//           Column(
//             children: List.generate(controllers.length, (index) {
//               return Row(
//                 children: [
//                   TextFormField(controller: controllers[index][0]),
//                   TextFormField(controller: controllers[index][1]),
//                   TextFormField(controller: controllers[index][2]),
//                   TextFormField(controller: controllers[index][3]),
//                   TextFormField(controller: controllers[index][4]),
//                 ],
//               );
//             }),
//           ),
//           ElevatedButton(
//               onPressed: () {
//                 controllers.forEach((element) {
//                   installmentDetails = [];
//
//                   installmentDetails.add({
//                     "amount": element[0],
//                     "amoun": element[1],
//                     "amount": element[2],
//                     "amount": element[3],
//                     "amount": element[4],
//                   });
//                 });
//               },
//               child: Text('Update'))
//         ],
//       ),
//     );
//   }
// }
