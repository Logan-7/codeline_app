import 'dart:typed_data';

import 'package:codeline_app/widget/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class InternshipOfferLater extends StatelessWidget {
  const InternshipOfferLater({
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
            height: 45,
          ),
          pw.Text(
            '$gender ${firstName.toString().capitalizeFirst} ${lastName.toString().capitalizeFirst}',
            textAlign: pw.TextAlign.justify,
            style: pw.TextStyle(
              fontSize: 12.5,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
          pw.SizedBox(height: 15),
          pw.Text(
            '$collegeName',
            textAlign: pw.TextAlign.justify,
            style: pw.TextStyle(
              fontSize: 12.5,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
          pw.SizedBox(height: 15),
          pw.Row(children: [
            pw.Text(
              'Dear ',
              textAlign: pw.TextAlign.justify,
              style: pw.TextStyle(fontSize: 12.5),
            ),
            pw.Text(
              '${firstName.toString().capitalizeFirst}',
              textAlign: pw.TextAlign.justify,
              style: pw.TextStyle(
                fontSize: 12.5,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
          ]),
          pw.SizedBox(height: 15),
          pw.RichText(
            textAlign: pw.TextAlign.justify,
            text: pw.TextSpan(
              text:
                  'In Reference to your application, we would like to congratulate you on being selected for an internship with',
              children: [
                pw.TextSpan(
                  text: ' Codeline Infotech',
                  style: pw.TextStyle(
                      fontSize: 12, fontWeight: pw.FontWeight.bold),
                ),
                pw.TextSpan(
                  text: ' from',
                  style: pw.TextStyle(
                    fontSize: 12,
                  ),
                ),
                pw.TextSpan(
                  text: ' Surat.',
                  style: pw.TextStyle(
                      fontSize: 12, fontWeight: pw.FontWeight.bold),
                ),
                pw.TextSpan(
                  text: ' Your training is scheduled to start on ',
                  style: pw.TextStyle(
                    fontSize: 12,
                  ),
                ),
                pw.TextSpan(
                  text: '${DateFormat('d MMMM').format(firstDate!)} ',
                  style: pw.TextStyle(
                      fontSize: 12, fontWeight: pw.FontWeight.bold),
                ),
                pw.TextSpan(
                  text: 'for a period of',
                  style: pw.TextStyle(
                    fontSize: 12,
                  ),
                ),
                pw.TextSpan(
                  text: ' $months Months.',
                  style: pw.TextStyle(
                      fontSize: 12, fontWeight: pw.FontWeight.bold),
                ),
                pw.TextSpan(
                  text: ' All of us at',
                  style: pw.TextStyle(
                    fontSize: 12,
                  ),
                ),
                pw.TextSpan(
                  text: ' Codeline Infotech',
                  style: pw.TextStyle(
                      fontSize: 12, fontWeight: pw.FontWeight.bold),
                ),
                pw.TextSpan(
                  text: ' are excited that you will be joining our team.',
                  style: pw.TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          pw.SizedBox(height: 15),
          pw.Text(
            'In your internship, we will include training and focus on learning flutter development and new skills and gaining a deeper understanding of concepts through hands-on mobile application of the knowledge you learned',
            textAlign: pw.TextAlign.justify,
            style: pw.TextStyle(
              fontSize: 12,
            ),
          ),
          pw.SizedBox(height: 15),
          pw.Text(
            'Information about the project and technical platform will be shared with you before the commencement of your training Congratulations to you and we are excited to work with you',
            textAlign: pw.TextAlign.justify,
            style: pw.TextStyle(
              fontSize: 12,
            ),
          ),
          pw.SizedBox(height: 50),
          pw.RichText(
            text: pw.TextSpan(
                text: 'Duration: ',
                style: pw.TextStyle(
                  fontSize: 12,
                ),
                children: [
                  pw.TextSpan(
                    text: '$months Months',
                    style: pw.TextStyle(
                      fontSize: 12,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  )
                ]),
          ),
          pw.SizedBox(height: 40),
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
