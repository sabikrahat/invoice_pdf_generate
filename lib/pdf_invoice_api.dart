import 'dart:io';
import 'package:flutter/services.dart';
import 'file_handle_api.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfInvoiceApi {
  static Future<File> generate(PdfColor color, pw.Font fontFamily) async {
    final pdf = pw.Document();

    final iconImage =
        (await rootBundle.load('assets/icon.png')).buffer.asUint8List();

    final tableHeaders = [
      'Description',
      'Quantity',
      'Unit Price',
      'VAT',
      'Total',
    ];

    final tableData = [
      [
        'Coffee',
        '7',
        '\$ 5',
        '1 %',
        '\$ 35',
      ],
      [
        'Blue Berries',
        '5',
        '\$ 10',
        '2 %',
        '\$ 50',
      ],
      [
        'Water',
        '1',
        '\$ 3',
        '1.5 %',
        '\$ 3',
      ],
      [
        'Apple',
        '6',
        '\$ 8',
        '2 %',
        '\$ 48',
      ],
      [
        'Lunch',
        '3',
        '\$ 90',
        '12 %',
        '\$ 270',
      ],
      [
        'Drinks',
        '2',
        '\$ 15',
        '0.5 %',
        '\$ 30',
      ],
      [
        'Lemon',
        '4',
        '\$ 7',
        '0.5 %',
        '\$ 28',
      ],
    ];

    pdf.addPage(
      pw.MultiPage(
        build: (context) {
          return [
            pw.Row(
              children: [
                pw.Image(
                  pw.MemoryImage(iconImage),
                  height: 72,
                  width: 72,
                ),
                pw.SizedBox(width: 1 * PdfPageFormat.mm),
                pw.Column(
                  mainAxisSize: pw.MainAxisSize.min,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      'INVOICE',
                      style: pw.TextStyle(
                        fontSize: 17.0,
                        fontWeight: pw.FontWeight.bold,
                        color: color,
                        font: fontFamily,
                      ),
                    ),
                    pw.Text(
                      'Flutter Approach',
                      style: pw.TextStyle(
                        fontSize: 15.0,
                        color: color,
                        font: fontFamily,
                      ),
                    ),
                  ],
                ),
                pw.Spacer(),
                pw.Column(
                  mainAxisSize: pw.MainAxisSize.min,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      'John Doe',
                      style: pw.TextStyle(
                        fontSize: 15.5,
                        fontWeight: pw.FontWeight.bold,
                        color: color,
                        font: fontFamily,
                      ),
                    ),
                    pw.Text(
                      'john@gmail.com',
                      style: pw.TextStyle(
                        fontSize: 14.0,
                        color: color,
                        font: fontFamily,
                      ),
                    ),
                    pw.Text(
                      DateTime.now().toString(),
                      style: pw.TextStyle(
                        fontSize: 14.0,
                        color: color,
                        font: fontFamily,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            pw.SizedBox(height: 1 * PdfPageFormat.mm),
            pw.Divider(),
            pw.SizedBox(height: 1 * PdfPageFormat.mm),
            pw.Text(
              'Dear John,\nLorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique accusantium nemo autem. Veritatis obcaecati tenetur iure eius earum ut molestias architecto voluptate aliquam nihil, eveniet aliquid culpa officia aut! Impedit sit sunt quaerat, odit, tenetur error',
              textAlign: pw.TextAlign.justify,
              style: pw.TextStyle(
                fontSize: 14.0,
                color: color,
                font: fontFamily,
              ),
            ),
            pw.SizedBox(height: 5 * PdfPageFormat.mm),

            ///
            /// PDF Table Create
            ///
            pw.Table.fromTextArray(
              headers: tableHeaders,
              data: tableData,
              border: null,
              headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
              headerDecoration:
                  const pw.BoxDecoration(color: PdfColors.grey300),
              cellHeight: 30.0,
              cellAlignments: {
                0: pw.Alignment.centerLeft,
                1: pw.Alignment.centerRight,
                2: pw.Alignment.centerRight,
                3: pw.Alignment.centerRight,
                4: pw.Alignment.centerRight,
              },
            ),
            pw.Divider(),
            pw.Container(
              alignment: pw.Alignment.centerRight,
              child: pw.Row(
                children: [
                  pw.Spacer(flex: 6),
                  pw.Expanded(
                    flex: 4,
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Row(
                          children: [
                            pw.Expanded(
                              child: pw.Text(
                                'Net total',
                                style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold,
                                  color: color,
                                  font: fontFamily,
                                ),
                              ),
                            ),
                            pw.Text(
                              '\$ 464',
                              style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold,
                                color: color,
                                font: fontFamily,
                              ),
                            ),
                          ],
                        ),
                        pw.Row(
                          children: [
                            pw.Expanded(
                              child: pw.Text(
                                'Vat 19.5 %',
                                style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold,
                                  color: color,
                                  font: fontFamily,
                                ),
                              ),
                            ),
                            pw.Text(
                              '\$ 90.48',
                              style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold,
                                color: color,
                                font: fontFamily,
                              ),
                            ),
                          ],
                        ),
                        pw.Divider(),
                        pw.Row(
                          children: [
                            pw.Expanded(
                              child: pw.Text(
                                'Total amount due',
                                style: pw.TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: pw.FontWeight.bold,
                                  color: color,
                                  font: fontFamily,
                                ),
                              ),
                            ),
                            pw.Text(
                              '\$ 554.48',
                              style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold,
                                color: color,
                                font: fontFamily,
                              ),
                            ),
                          ],
                        ),
                        pw.SizedBox(height: 2 * PdfPageFormat.mm),
                        pw.Container(height: 1, color: PdfColors.grey400),
                        pw.SizedBox(height: 0.5 * PdfPageFormat.mm),
                        pw.Container(height: 1, color: PdfColors.grey400),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ];
        },
        footer: (context) {
          return pw.Column(
            mainAxisSize: pw.MainAxisSize.min,
            children: [
              pw.Divider(),
              pw.SizedBox(height: 2 * PdfPageFormat.mm),
              pw.Text(
                'Flutter Approach',
                style:
                    pw.TextStyle(fontWeight: pw.FontWeight.bold, color: color, font: fontFamily),
              ),
              pw.SizedBox(height: 1 * PdfPageFormat.mm),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.Text(
                    'Address: ',
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold, color: color, font: fontFamily),
                  ),
                  pw.Text(
                    'Merul Badda, Anandanagor, Dhaka 1212',
                    style: pw.TextStyle(color: color, font: fontFamily),
                  ),
                ],
              ),
              pw.SizedBox(height: 1 * PdfPageFormat.mm),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.Text(
                    'Email: ',
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold, color: color, font: fontFamily),
                  ),
                  pw.Text(
                    'flutterapproach@gmail.com',
                    style: pw.TextStyle(color: color, font: pw.Font.courier()),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );

    return FileHandleApi.saveDocument(name: 'my_invoice.pdf', pdf: pdf);
  }
}
