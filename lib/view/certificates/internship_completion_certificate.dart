import 'dart:typed_data';

import 'package:codeline_app/widget/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class InternshipCompletionCertificate extends StatelessWidget {
  const InternshipCompletionCertificate({
    Key? key,
    this.gender,
    this.firstName,
    this.lastName,
    this.certificatesType,
    this.occupation,
    this.collegeName,
    this.description,
    this.selectDate,
    this.firstDate,
    this.lastDate,
    this.middleName,
    this.months,
    this.genderPronounce,
    this.genderPronounce1,
    this.genderPronounce2,
    this.projectTitle,
  }) : super(key: key);

  final String? gender;
  final String? firstName;
  final String? middleName;
  final String? lastName;
  final String? certificatesType;
  final DateTime? selectDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final String? occupation;
  final String? collegeName;
  final String? description;
  final int? months;
  final String? genderPronounce;
  final String? genderPronounce1;
  final String? genderPronounce2;
  final String? projectTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.mainColor,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text('Certificates'),
      ),
      body: PdfPreview(
        build: (format) => generatePdf('Certificates'),
      ),
    );
  }

  Future<Uint8List> generatePdf(String title) async {
    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);
    final font = await PdfGoogleFonts.calligraffittiRegular();
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (context) {
          return pw.Column(
            children: [
              pw.Expanded(child: certificateContent(font)),
            ],
          );
        },
      ),
    );
    return pdf.save();
  }

  pw.Container certificateContent(pw.Font font) {
    print('${Get.height}');
    return pw.Container(
        child: pw.Padding(
      padding: pw.EdgeInsets.only(left: 15),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.SizedBox(
            height: 40,
          ),
          pw.Align(
            alignment: pw.Alignment.topRight,
            child: pw.RichText(
              text: pw.TextSpan(
                text: 'Date: ',
                style: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold,
                  fontSize: 12,
                ),
                children: [
                  pw.TextSpan(
                    text:
                        '${'${DateFormat('dd/MM/yyyy').format(selectDate!)}'}',
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.normal, fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
          pw.SizedBox(
            height: 65,
          ),
          pw.Align(
            alignment: pw.Alignment.center,
            child: pw.Text('$certificatesType',
                style: pw.TextStyle(
                  fontSize: 22,
                  fontWeight: pw.FontWeight.bold,
                )),
          ),
          pw.SizedBox(
            height: 90,
          ),
          pw.Text(
            'TO WHOM IT MAY CONCERN,',
            textAlign: pw.TextAlign.justify,
            style: pw.TextStyle(
              fontSize: 12.5,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
          pw.SizedBox(height: 30),
          pw.RichText(
            textAlign: pw.TextAlign.justify,
            text: pw.TextSpan(
              text: 'This is to certify that ',
              children: [
                pw.TextSpan(
                  text: '$gender $firstName $middleName $lastName, ',
                  style: pw.TextStyle(
                      fontSize: 12, fontWeight: pw.FontWeight.bold),
                ),
                pw.TextSpan(
                  text: 'student of ',
                  style: pw.TextStyle(
                    fontSize: 12,
                  ),
                ),
                pw.TextSpan(
                  text: '$collegeName ',
                  style: pw.TextStyle(
                      fontSize: 12, fontWeight: pw.FontWeight.bold),
                ),
                pw.TextSpan(
                  text:
                      'has successfully completed $genderPronounce1 internship from ${DateFormat('d MMMM yyyy').format(firstDate!)} to ${DateFormat('d MMMM yyyy').format(lastDate!)}. ',
                  style: pw.TextStyle(
                    fontSize: 12,
                  ),
                ),
                pw.TextSpan(
                  text:
                      "During this period, $genderPronounce2 undertook a project titled $projectTitle, This project aimed to buy sell and buy Stationary items. As a part of this project, $genderPronounce2 has worked on front end of the App.",
                  style: pw.TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          pw.SizedBox(height: 20),
          pw.Text(
            'During $genderPronounce1 internship period, we have found $genderPronounce to be dedicated and knowledgeable about the subject and $genderPronounce1 performance toward the completion of the project has been satisfactory.',
            textAlign: pw.TextAlign.justify,
            style: pw.TextStyle(
              fontSize: 12,
            ),
          ),
          pw.SizedBox(height: 20),
          pw.Text(
            '$firstName has been sincere, hardworking, and punctual about meeting the project schedule and deadlines',
            textAlign: pw.TextAlign.justify,
            style: pw.TextStyle(
              fontSize: 12,
            ),
          ),
          pw.SizedBox(height: 20),
          pw.Text(
            'We wish $genderPronounce all the best for $genderPronounce1 upcoming career.',
            textAlign: pw.TextAlign.justify,
            style: pw.TextStyle(
              fontSize: 12,
            ),
          ),
          pw.SizedBox(height: 30),
          pw.Text(
            'Nevil Vaghasiya',
            textAlign: pw.TextAlign.justify,
            style: pw.TextStyle(fontSize: 12.5, fontWeight: pw.FontWeight.bold),
          ),
          pw.SizedBox(height: 5),
          pw.Text(
            'CODELINE INFOTECH LLP',
            textAlign: pw.TextAlign.justify,
            style: pw.TextStyle(fontSize: 12.5, fontWeight: pw.FontWeight.bold),
          ),
          pw.SizedBox(height: 70),
          pw.Text(
            'Authorized Signature',
            textAlign: pw.TextAlign.justify,
            style: pw.TextStyle(fontSize: 12),
          )
        ],
      ),
    ));
  }
}
