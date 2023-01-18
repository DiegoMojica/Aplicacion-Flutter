import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
// import 'package:pdf/src/pdf/color.dart';

Future<Uint8List> generatePdf(final PdfPageFormat format) async {
  final doc = pw.Document(title: 'PRUEBA FLUTTER');
  final logoImage = pw.MemoryImage(
    (await rootBundle.load('assets/pensador.webp')).buffer.asUint8List(),
  );
  final footerImage = pw.MemoryImage(
    (await rootBundle.load('assets/footer.png')).buffer.asUint8List(),
  );
  // final font=await rootBundle.load('Lato');
  // final ttf=pw.Font.ttf(font);

  final pageTheme = await _myPageTheme(format);

  doc.addPage(pw.MultiPage(
      pageTheme: pageTheme,
      // pageFormat: PdfPageFormat.a4,
      header: (final context) =>
          pw.Row(mainAxisAlignment: pw.MainAxisAlignment.center, children: [
            pw.Image(
              logoImage,
              fit: pw.BoxFit.contain,
              width: 240,
            ),
          ]),
      // footer: (final context)=>
      // pw.Container(
      //   height: 50,
      //   width: 700,
      //   decoration: pw.BoxDecoration(
      //     color: PdfColor.fromInt(0xFF0B287F)
      // )
      // ),
      build: (final context) => [
            pw.Container(
                padding: const pw.EdgeInsets.only(left: 25, bottom: 20),
                child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    children: [
                      pw.Padding(padding: const pw.EdgeInsets.only(top: 0)),
                      pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Text(
                              'Nombre',
                              style: pw.TextStyle(
                                fontSize: 30.0,
                                fontWeight: pw.FontWeight.bold,
                                color: PdfColor.fromInt(0xFF0B287F)
                              ),
                            ),
                            pw.Column(
                                crossAxisAlignment:
                                    pw.CrossAxisAlignment.center,
                                children: [
                                  pw.Container(
                                    height: 30,
                                    width: 500,
                                    decoration: pw.BoxDecoration(
                                        boxShadow: [
                                          const pw.BoxShadow(
                                              color: PdfColors.grey300,
                                              blurRadius: 15.0,
                                              offset: PdfPoint(0.0, 5.0))
                                        ],
                                        color: PdfColors.white,
                                        border: pw.Border.all(
                                            width: 1, color: PdfColors.grey400
                                            ),
                                        borderRadius: const pw.BorderRadius.all(
                                            pw.Radius.circular(6))),
                                  )
                                ]),
                            pw.Row(children: [
                              pw.Padding(
                                padding: const pw.EdgeInsets.only(top: 15),
                                child: pw.Text(
                                  'Código',
                                  style: pw.TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: pw.FontWeight.bold,
                                  color: PdfColor.fromInt(0xFF0B287F)
                                  ),
                                ),
                              ),
                              pw.Padding(
                                padding: const pw.EdgeInsets.only(
                                    top: 15, left: 195),
                                child: pw.Text(
                                  'Cargo',
                                  style: pw.TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: pw.FontWeight.bold,
                                  color: PdfColor.fromInt(0xFF0B287F)
                                  ),
                                ),
                              )
                            ]),
                            pw.Row(children: [
                              pw.Padding(
                                padding: const pw.EdgeInsets.only(top: 3),
                                child: pw.Container(
                                  height: 30,
                                  width: 210,
                                  decoration: pw.BoxDecoration(
                                        boxShadow: [
                                          const pw.BoxShadow(
                                              color: PdfColors.grey300,
                                              blurRadius: 15.0,
                                              offset: PdfPoint(0.0, 5.0))
                                        ],
                                        color: PdfColors.white,
                                        border: pw.Border.all(
                                            width: 1, color: PdfColors.grey400
                                            ),
                                        borderRadius: const pw.BorderRadius.all(
                                            pw.Radius.circular(6))),
                                ),
                              ),
                              pw.Padding(
                                  padding: const pw.EdgeInsets.only(
                                      top: 3, left: 80),
                                  child: pw.Container(
                                    height: 30,
                                    width: 210,
                                    decoration: pw.BoxDecoration(
                                        boxShadow: [
                                          const pw.BoxShadow(
                                              color: PdfColors.grey300,
                                              blurRadius: 15.0,
                                              offset: PdfPoint(0.0, 5.0))
                                        ],
                                        color: PdfColors.white,
                                        border: pw.Border.all(
                                            width: 1, color: PdfColors.grey400
                                            ),
                                        borderRadius: const pw.BorderRadius.all(
                                            pw.Radius.circular(6))),
                                  ))
                            ]),
                            pw.Padding(
                              padding: const pw.EdgeInsets.only(top: 15),
                              child: pw.Text(
                                'Descripción dependencia',
                                style:  pw.TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: pw.FontWeight.bold,
                                  color: PdfColor.fromInt(0xFF0B287F)
                                ),
                              ),
                            ),
                            pw.Column(
                                crossAxisAlignment:
                                    pw.CrossAxisAlignment.center,
                                children: [
                                  pw.Padding(
                                      padding: const pw.EdgeInsets.only(top: 3),
                                      child: pw.Container(
                                        height: 30,
                                        width: 500,
                                        decoration: pw.BoxDecoration(
                                        boxShadow: [
                                          const pw.BoxShadow(
                                              color: PdfColors.grey300,
                                              blurRadius: 15.0,
                                              offset: PdfPoint(0.0, 5.0))
                                        ],
                                        color: PdfColors.white,
                                        border: pw.Border.all(
                                            width: 1, color: PdfColors.grey400
                                            ),
                                        borderRadius: const pw.BorderRadius.all(
                                            pw.Radius.circular(6))),
                                      ))
                                ]),
                            pw.Padding(
                              padding: const pw.EdgeInsets.only(top: 15),
                              child: pw.Text(
                                'Correo',
                                style: pw.TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: pw.FontWeight.bold,
                                  color: PdfColor.fromInt(0xFF0B287F)
                                ),
                              ),
                            ),
                            pw.Column(
                                crossAxisAlignment:
                                    pw.CrossAxisAlignment.center,
                                children: [
                                  pw.Padding(
                                      padding: const pw.EdgeInsets.only(top: 3),
                                      child: pw.Container(
                                        height: 30,
                                        width: 500,
                                        decoration: pw.BoxDecoration(
                                        boxShadow: [
                                          const pw.BoxShadow(
                                              color: PdfColors.grey300,
                                              blurRadius: 15.0,
                                              offset: PdfPoint(0.0, 5.0))
                                        ],
                                        color: PdfColors.white,
                                        border: pw.Border.all(
                                            width: 1, color: PdfColors.grey400
                                            ),
                                        borderRadius: const pw.BorderRadius.all(
                                            pw.Radius.circular(6))),
                                      ))
                                ]),
                            pw.Padding(
                              padding: const pw.EdgeInsets.only(top: 15),
                              child: pw.Text(
                                'Operador / Responsable',
                                style: pw.TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: pw.FontWeight.bold,
                                  color: PdfColor.fromInt(0xFF0B287F)
                                ),
                              ),
                            ),
                            pw.Column(
                                crossAxisAlignment:
                                    pw.CrossAxisAlignment.center,
                                children: [
                                  pw.Padding(
                                      padding: const pw.EdgeInsets.only(top: 3),
                                      child: pw.Container(
                                        height: 30,
                                        width: 500,
                                        decoration: pw.BoxDecoration(
                                        boxShadow: [
                                          const pw.BoxShadow(
                                              color: PdfColors.grey300,
                                              blurRadius: 15.0,
                                              offset: PdfPoint(0.0, 5.0))
                                        ],
                                        color: PdfColors.white,
                                        border: pw.Border.all(
                                            width: 1, color: PdfColors.grey400
                                            ),
                                        borderRadius: const pw.BorderRadius.all(
                                            pw.Radius.circular(6))),
                                      ))
                                ]),
                          ])
                    ]))
          ]));

  return doc.save();
}

Future<pw.PageTheme> _myPageTheme(PdfPageFormat format) async {
  final logoImage = pw.MemoryImage(
    (await rootBundle.load('assets/pensador.webp')).buffer.asUint8List(),
  );
  return pw.PageTheme(
      margin: const pw.EdgeInsets.symmetric(
          horizontal: 1 * PdfPageFormat.cm, vertical: 0.5 * PdfPageFormat.cm),
      textDirection: pw.TextDirection.ltr,
      orientation: pw.PageOrientation.portrait,
      buildBackground: (final context) => pw.FullPage(
          ignoreMargins: true,
          child: pw.Watermark(
              angle: 0,
              child: pw.Opacity(
                  opacity: 0,
                  child: pw.Image(
                      alignment: pw.Alignment.center,
                      logoImage,
                      fit: pw.BoxFit.cover)))));
}

Future<void> saveAsFile(
  final BuildContext context,
  final LayoutCallback build,
  final PdfPageFormat pageFormat,
) async {
  final bytes = await build(pageFormat);

  final appDocDir = await getApplicationDocumentsDirectory();
  final appDocPath = appDocDir.path;
  final file = File('$appDocPath/document.pdf');
  print('guardado como archivo ${file.path}...');
  await file.writeAsBytes(bytes);
  await OpenFile.open(file.path);
}

void showPrintedToast(final BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Documento procesado correctamente!')));
}

void showSharedToast(final BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Documento compartido correctamente!')));
}
