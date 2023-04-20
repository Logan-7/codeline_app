import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ElevatedButton(
            //   onPressed: () async {
            //     CollectionReference studentCollection =
            //         Firestore.instance.collection('FeesHistory');
            //
            //     List<Document> data = await studentCollection.get();
            //     // 2020-01-02
            //     for (int i = 0; i < data.length; i++) {
            //       String date =
            //           '${data[i]['date'].toString().split('/').last}-${data[i]['date'].toString().split('/')[0]}-${data[i]['date'].toString().split('/').first}';
            //
            //       DateTime time = DateTime.parse(date);
            //       print('--------TIME----$time');
            //       await Firestore.instance
            //           .collection('FeesHistory')
            //           .document(data[i].id)
            //           .update({'date': time});
            //     }
            //   },
            //   child: Text('data'),
            // ),
          ],
        ),
      ),
    );
  }
}
