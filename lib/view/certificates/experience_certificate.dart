import 'dart:typed_data';

import 'package:codeline_app/widget/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class ExperienceCertificate extends StatelessWidget {
  const ExperienceCertificate({
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
    this.genderPronounce1,
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
  final String? genderPronounce1;

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
            height: 50,
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
            height: 40,
          ),
          pw.Text(
            'TO WHOM IT MAY CONCERN,',
            textAlign: pw.TextAlign.justify,
            style: pw.TextStyle(
              fontSize: 12,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
          pw.SizedBox(height: 10),
          pw.RichText(
            textAlign: pw.TextAlign.justify,
            text: pw.TextSpan(
              text: 'This is to certify that ',
              style:
                  pw.TextStyle(fontWeight: pw.FontWeight.normal, fontSize: 12),
              children: [
                pw.TextSpan(
                  text:
                      '${'$gender ${firstName.toString().capitalizeFirst} ${lastName.toString().capitalizeFirst} '}',
                  style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold, fontSize: 12),
                ),
                pw.TextSpan(
                  text:
                      'was an employee of Codeline Infotech from ${DateFormat('d MMMM y').format(firstDate!)} to ${DateFormat('d MMMM y').format(lastDate!)} as a Flutter developer.',
                  style: pw.TextStyle(fontSize: 11.5),
                ),
              ],
            ),
          ),
          pw.SizedBox(height: 10),
          pw.Text(
            textAlign: pw.TextAlign.justify,
            '$gender $firstName $lastName was appointed on a full-time (40 hrs. per week) paid basis in Technology Department at Surat. $gender $firstName $lastName has performed the following duties during ${genderPronounce1} employment with us.',
            style: pw.TextStyle(fontSize: 11.5),
          ),
          pw.SizedBox(height: 10),
          pw.Padding(
            padding: pw.EdgeInsets.only(left: 20, right: 30),
            child: pw.Container(
              child: pw.Column(
                children: [
                  pw.Row(
                    children: [
                      pw.Container(
                        height: 5,
                        width: 5,
                        decoration: pw.BoxDecoration(
                          color: PdfColors.black,
                          shape: pw.BoxShape.circle,
                        ),
                      ),
                      pw.SizedBox(width: 10),
                      pw.Text(
                          'Develop Mobile Application Software using Flutter and related Mobile technologies.',
                          textAlign: pw.TextAlign.justify,
                          style: pw.TextStyle(fontSize: 11.5))
                    ],
                  ),
                  pw.SizedBox(height: 3),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    children: [
                      pw.Container(
                        height: 5,
                        width: 5,
                        decoration: pw.BoxDecoration(
                          color: PdfColors.black,
                          shape: pw.BoxShape.circle,
                        ),
                      ),
                      pw.SizedBox(width: 10),
                      pw.Text(
                          'Responsible for maintaining and handling the Firebase database.',
                          textAlign: pw.TextAlign.justify,
                          style: pw.TextStyle(fontSize: 11.5))
                    ],
                  ),
                  pw.SizedBox(height: 5),
                  pw.Row(
                    children: [
                      pw.Padding(
                        padding: pw.EdgeInsets.only(bottom: 15),
                        child: pw.Container(
                          height: 5,
                          width: 5,
                          decoration: pw.BoxDecoration(
                            color: PdfColors.black,
                            shape: pw.BoxShape.circle,
                          ),
                        ),
                      ),
                      pw.SizedBox(width: 10),
                      pw.Text(
                          'Responsible for documentation of code, processes, and other feature specification\ndocuments. ',
                          textAlign: pw.TextAlign.justify,
                          style: pw.TextStyle(fontSize: 11.5))
                    ],
                  ),
                  pw.SizedBox(height: 5),
                  pw.Row(
                    children: [
                      pw.Container(
                        height: 5,
                        width: 5,
                        decoration: pw.BoxDecoration(
                          color: PdfColors.black,
                          shape: pw.BoxShape.circle,
                        ),
                      ),
                      pw.SizedBox(width: 10),
                      pw.Text(
                          'Analyzing & resolving technical problems to ensure business continuity',
                          textAlign: pw.TextAlign.justify,
                          style: pw.TextStyle(fontSize: 11.5))
                    ],
                  ),
                  pw.SizedBox(height: 5),
                  pw.Row(
                    children: [
                      pw.Padding(
                        padding: pw.EdgeInsets.only(bottom: 15),
                        child: pw.Container(
                          height: 5,
                          width: 5,
                          decoration: pw.BoxDecoration(
                            color: PdfColors.black,
                            shape: pw.BoxShape.circle,
                          ),
                        ),
                      ),
                      pw.SizedBox(width: 10),
                      pw.Text(
                          'Responsible for communicating with team and support staff regarding programming \nneeds and performance',
                          textAlign: pw.TextAlign.justify,
                          style: pw.TextStyle(fontSize: 11.5))
                    ],
                  ),
                  pw.SizedBox(height: 5),
                  pw.Row(
                    children: [
                      pw.Padding(
                        padding: pw.EdgeInsets.only(bottom: 15),
                        child: pw.Container(
                          height: 5,
                          width: 5,
                          decoration: pw.BoxDecoration(
                            color: PdfColors.black,
                            shape: pw.BoxShape.circle,
                          ),
                        ),
                      ),
                      pw.SizedBox(width: 10),
                      pw.Text(
                          'Testing new programs to ensure that logic and syntax are correct, and that program\nresults are accurate',
                          textAlign: pw.TextAlign.justify,
                          style: pw.TextStyle(fontSize: 11.5))
                    ],
                  ),
                  pw.SizedBox(height: 5),
                  pw.Row(
                    children: [
                      pw.Container(
                        height: 5,
                        width: 5,
                        decoration: pw.BoxDecoration(
                          color: PdfColors.black,
                          shape: pw.BoxShape.circle,
                        ),
                      ),
                      pw.SizedBox(width: 10),
                      pw.Text(
                          'Assist junior-level programmers with programming assignments and mentoring them.',
                          textAlign: pw.TextAlign.justify,
                          style: pw.TextStyle(fontSize: 11.5))
                    ],
                  ),
                  pw.SizedBox(height: 5),
                  pw.Row(
                    children: [
                      pw.Padding(
                        padding: pw.EdgeInsets.only(bottom: 15),
                        child: pw.Container(
                          height: 5,
                          width: 5,
                          decoration: pw.BoxDecoration(
                            color: PdfColors.black,
                            shape: pw.BoxShape.circle,
                          ),
                        ),
                      ),
                      pw.SizedBox(width: 10),
                      pw.Text(
                          'Deal with offshore customers to resolve technical problems and understand their\nrequirements.',
                          textAlign: pw.TextAlign.justify,
                          style: pw.TextStyle(fontSize: 11.5))
                    ],
                  ),
                ],
              ),
            ),
          ),
          pw.SizedBox(height: 10),
          pw.Text(
            '$firstName has been sincere, hardworking, and punctual about meeting the project schedule and deadlines.',
            textAlign: pw.TextAlign.justify,
            style: pw.TextStyle(fontSize: 11.5),
          ),
          pw.SizedBox(height: 10),
          pw.Text(
            'Please feel free to contact me if you have any questions regarding $gender $firstName $lastName employment with us.',
            textAlign: pw.TextAlign.justify,
            style: pw.TextStyle(fontSize: 11.5),
          ),
          pw.SizedBox(height: 20),
          pw.Text(
            'CODELINE INFOTECH LLP',
            textAlign: pw.TextAlign.justify,
            style: pw.TextStyle(fontSize: 11.5, fontWeight: pw.FontWeight.bold),
          ),
          pw.SizedBox(height: 60),
          pw.Text(
            'Authorized Signature',
            textAlign: pw.TextAlign.justify,
            style: pw.TextStyle(fontSize: 11.5),
          )
        ],
      ),
    ));
  }
}
