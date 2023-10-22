import 'package:flutter/material.dart';
import 'package:invoice_pdf_generate/file_handle_api.dart';
import 'package:invoice_pdf_generate/pdf_invoice_api.dart';
import 'package:pdf/pdf.dart';

class GenerateInvoiceWidget extends StatelessWidget {
  const GenerateInvoiceWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.picture_as_pdf,
            size: 72.0,
            color: Colors.white,
          ),
          const SizedBox(height: 15.0),
          const Text(
            'Generate Invoice',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 30.0),
          ElevatedButton(
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 8.0),
              child: Text(
                'Invoice PDF',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            onPressed: () async {
              // generate pdf file
              // final pdfFile = await PdfInvoiceApi.generate(PdfColors.black, PdfPageFormat.a4);

              // opening the pdf file
              // FileHandleApi.openFile(pdfFile);
            },
          ),
        ],
      ),
    );
  }
}
