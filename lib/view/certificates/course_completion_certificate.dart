import 'dart:typed_data';

import 'package:codeline_app/widget/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class CourseCompletionCertificate extends StatefulWidget {
  const CourseCompletionCertificate({
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
    this.genderPronounce,
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
  final String? genderPronounce;
  final String? genderPronounce1;

  @override
  State<CourseCompletionCertificate> createState() =>
      _CourseCompletionCertificateState();
}

class _CourseCompletionCertificateState
    extends State<CourseCompletionCertificate> {
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
      padding: pw.EdgeInsets.only(left: 10),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.SizedBox(
            height: 50,
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
                        '${'${DateFormat('dd/MM/yyyy').format(widget.selectDate!)}'}',
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.normal, fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
          pw.SizedBox(
            height: 80,
          ),
          pw.Align(
            alignment: pw.Alignment.center,
            child: pw.Text('${widget.certificatesType}',
                style: pw.TextStyle(
                  fontSize: 22,
                  fontWeight: pw.FontWeight.bold,
                )),
          ),
          pw.SizedBox(
            height: 50,
          ),
          pw.Text(
            'TO WHOM IT MAY CONCERN,',
            textAlign: pw.TextAlign.justify,
            style: pw.TextStyle(
              fontSize: 12,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
          pw.SizedBox(height: 40),
          pw.RichText(
            textAlign: pw.TextAlign.justify,
            text: pw.TextSpan(
              text: 'This is to certify that ',
              style: pw.TextStyle(
                  fontWeight: pw.FontWeight.normal, fontSize: 12.5),
              children: [
                pw.TextSpan(
                  text:
                      '${'${widget.gender} ${widget.firstName.toString().capitalizeFirst} ${widget.middleName.toString().capitalizeFirst} ${widget.lastName.toString().capitalizeFirst} '}',
                  style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold, fontSize: 12.5),
                ),
                pw.TextSpan(
                  text:
                      'has successfully completed ${widget.genderPronounce1} ',
                  style: pw.TextStyle(fontSize: 12),
                ),
                pw.TextSpan(
                  text: 'FLUTTER APP DEVELOPMENT',
                  style: pw.TextStyle(
                    fontSize: 12.5,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
                pw.TextSpan(
                  text: ' course from ',
                  style: pw.TextStyle(
                    fontSize: 12,
                  ),
                ),
                pw.TextSpan(
                  text: 'August 2022 ',
                  style: pw.TextStyle(
                    fontSize: 12.5,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
                pw.TextSpan(
                  text: 'to ',
                  style: pw.TextStyle(
                    fontSize: 12,
                  ),
                ),
                pw.TextSpan(
                  text: 'April 2023.',
                  style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold, fontSize: 12.5),
                ),
              ],
            ),
          ),
          pw.SizedBox(height: 20),
          pw.Text(
            'During ${widget.genderPronounce1} course period, we have found ${widget.genderPronounce} to be dedicated and knowledgeable about the subject and ${widget.genderPronounce1} performance toward completion of the course has been satisfactory.',
            textAlign: pw.TextAlign.justify,
            style: pw.TextStyle(fontSize: 12.5),
          ),
          pw.SizedBox(height: 20),
          pw.Text(
            '${widget.firstName.toString().capitalizeFirst} has been sincere, hardworking, and punctual about the course lectures and task deadlines.',
            textAlign: pw.TextAlign.justify,
            style: pw.TextStyle(fontSize: 12.5),
          ),
          pw.SizedBox(height: 30),
          pw.Text(
            'We wish ${widget.genderPronounce} all the best for ${widget.genderPronounce1} upcoming career.',
            textAlign: pw.TextAlign.justify,
            style: pw.TextStyle(fontSize: 12.5),
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
