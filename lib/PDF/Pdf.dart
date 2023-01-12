import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:open_document/open_document.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf_invoice_generator_flutter/model/product.dort';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class CustomRow {
  final String itemName;
  final String itemPrice;
  final String amount;
  final String total;
  final String vat;

  CustomRow(this.itemName, this.itemPrice, this.amount, this.total, this.vat);
}

class pdfInvoiceService {
  Future<Uint8List> createHelloWord() {
    final pdf pw.Document();
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        biuld: (pw.Context context) {
          return pw.Center(child: pw.Text("Hello World"));
        },
      ),
    );
    return pdf.save();
  }

  Future<Uint8List> createInvoice(List<Product> soldProducts) async {
    final pdf = pw.Document();
    final List<CustomRow> elements = [
      CustomRow("itemName", "itemPrice", "amount", "total", "vat"),
      for (var product in soldProducts)
      CustomRow(
        product.name,
        product.price.toStringAsFixed(2),
        product.amount.toStringAsFixed(2),
        (product.price * product.amount).toStringAsFixed(2),
        (product.vatInPercent / 100 * product.price).toStringAsFixed(2),
      ),
      CustomRow(
        "Sub Total",
        "",
        "",
        "",
        "${getSubTotal(soldProducts)} EUR",
      ),
      CustomRow(
        "Vat Total",
        "",
        "",
        "",
        "${getVatTotal(soldProducts)} EUR",
      ),
      CustomRow(
        "Total",
        "",
        "",
        "",
        "${(double.parse(getSubTotal(soldProducts)) + double.parse(getVatTotal(soldProducts))).toStringAsFixed(2)} EUR ",
      )
    ];

    final image = (await rootBundle.load("assets/pensador.webp")).buffer.asUint8ClampedList();
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            children: [
              pw.Image(pw.MemoryImage(image), width: 150, height: 150, fit: pw.BoxFit.cover),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Column(
                    children:[
                      pw.Text("Customer Name"),
                      pw.Text("Customer Adress"),
                      pw.Text("Customer City"),
                    ],),
                  pw.Column(
                    children:[
                      pw.Text("Customer Name"),
                      pw.Text("Customer Adress"),
                      pw.Text("Customer City"),
                    ],
                  ),
                ]
              )
            ],
            );
        })
    );
    return pdf.save();
  }

  Future<void> savePdfFile(String fileName, Uint8List byteList) async {
    final output = await getTemporaryDirectory();
    var filePath = "S{autput.path}/$fileName.pdf";
    final file = File(filePath);
    await file.writeAsBytes(byteList);
    await OpenDocument.openDocument(filePath: filePath);
  }
}