// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../model/invoice_details_model.dart';
//
// class InvoiceController extends GetxController {
//   var isLoading = false.obs;
//   var invoice = Rx<Invoice?>(null);
//
//   @override
//   void onInit() {
//     super.onInit();
//     loadInvoiceData();
//   }
//
//   void loadInvoiceData() {
//     // Sample data - replace with your actual data source
//     invoice.value = Invoice(
//       companyName: "CarCloud",
//       companyWebsite: "www.carcloud.com",
//       companyEmail: "carcloud@email.com",
//       companyPhone: "+91 00000 00000",
//       businessAddress: "City, State, IN - 000 000",
//       taxId: "TAX ID 00000000124000X",
//       billedTo:
//       "Mr xyz\nCompany name\nCity, Country - 000000\nIN 0000 123 4567",
//       invoiceNumber: "#AB2324-01",
//       invoiceAmount: "\$4,950.00",
//       subject: "Oil Change",
//       invoiceDate: "01 Aug, 2023",
//       dueDate: "15 Aug, 2023",
//       items: [
//         InvoiceItem(
//           description: "Oil Change & Filter",
//           quantity: 1,
//           rate: 250,
//           amount: 250,
//         ),
//         InvoiceItem(
//           description: "Motor Change",
//           quantity: 1,
//           rate: 550,
//           amount: 550,
//         ),
//         InvoiceItem(
//           description: "AC Service",
//           quantity: 1,
//           rate: 150,
//           amount: 150,
//         ),
//       ],
//       subtotal: 400,
//       tax: 40,
//       total: 440,
//     );
//   }
//
//   void downloadInvoice() {
//     Get.snackbar(
//       "Download",
//       "Invoice downloaded successfully",
//       snackPosition: SnackPosition.BOTTOM,
//       backgroundColor: Colors.green,
//       colorText: Colors.white,
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import '../model/invoice_details_model.dart';

class InvoiceController extends GetxController {
  var isLoading = false.obs;
  var invoice = Rx<Invoice?>(null);
  var isDownloading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadInvoiceData();
  }

  void loadInvoiceData() {
    // Sample data - replace with your actual data source
    invoice.value = Invoice(
      companyName: "CarCloud",
      companyWebsite: "www.carcloud.com",
      companyEmail: "carcloud@email.com",
      companyPhone: "+91 00000 00000",
      businessAddress: "City, State, IN - 000 000",
      taxId: "TAX ID 00000000124000X",
      billedTo: "Mr xyz\nCompany name\nCity, Country - 000000\nIN 0000 123 4567",
      invoiceNumber: "#AB2324-01",
      invoiceAmount: "\$4,950.00",
      subject: "Oil Change",
      invoiceDate: "01 Aug, 2023",
      dueDate: "15 Aug, 2023",
      items: [
        InvoiceItem(
          description: "Oil Change & Filter",
          quantity: 1,
          rate: 250,
          amount: 250,
        ),
        InvoiceItem(
          description: "AC Service",
          quantity: 1,
          rate: 150,
          amount: 150,
        ),
      ],
      subtotal: 400,
      tax: 40,
      total: 440,
    );
  }

  // PDF generate এবং download করার method
  Future<void> downloadInvoice() async {
    try {
      isDownloading.value = true;

      // Permission check করা
      await _requestPermission();

      // PDF generate করা
      final pdf = await _generatePDF();

      // File save করা
      await _savePDF(pdf);

      Get.snackbar(
        "Success",
        "Invoice downloaded successfully",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        icon: const Icon(Icons.check_circle, color: Colors.white),
      );
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to download invoice: $e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        icon: const Icon(Icons.error, color: Colors.white),
      );
    } finally {
      isDownloading.value = false;
    }
  }

  // Permission request করা
  Future<void> _requestPermission() async {
    if (Platform.isAndroid) {
      var status = await Permission.storage.status;
      if (!status.isGranted) {
        await Permission.storage.request();
      }

      // Android 13+ এর জন্য
      var photosStatus = await Permission.photos.status;
      if (!photosStatus.isGranted) {
        await Permission.photos.request();
      }
    }
  }

  // PDF generate করার method
  Future<pw.Document> _generatePDF() async {
    final pdf = pw.Document();
    final invoiceData = invoice.value!;

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(20),
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // Company Header
              _buildPDFHeader(invoiceData),
              pw.SizedBox(height: 30),

              // Invoice Info
              _buildPDFInvoiceInfo(invoiceData),
              pw.SizedBox(height: 30),

              // Items Table
              _buildPDFItemsTable(invoiceData),
              pw.SizedBox(height: 20),

              // Total Section
              _buildPDFTotalSection(invoiceData),
              pw.SizedBox(height: 30),

              // Footer
              _buildPDFFooter(),
            ],
          );
        },
      ),
    );

    return pdf;
  }

  // PDF header build করা
  pw.Widget _buildPDFHeader(Invoice invoiceData) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          invoiceData.companyName,
          style: pw.TextStyle(
            fontSize: 24,
            fontWeight: pw.FontWeight.bold,
          ),
        ),
        pw.SizedBox(height: 5),
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(invoiceData.companyWebsite, style: const pw.TextStyle(fontSize: 12)),
                pw.Text(invoiceData.companyEmail, style: const pw.TextStyle(fontSize: 12)),
                pw.Text(invoiceData.companyPhone, style: const pw.TextStyle(fontSize: 12)),
              ],
            ),
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.end,
              children: [
                pw.Text('Business address', style: const pw.TextStyle(fontSize: 12)),
                pw.Text(invoiceData.businessAddress, style: const pw.TextStyle(fontSize: 12)),
                pw.Text(invoiceData.taxId, style: const pw.TextStyle(fontSize: 12)),
              ],
            ),
          ],
        ),
      ],
    );
  }

  // PDF invoice info build করা
  pw.Widget _buildPDFInvoiceInfo(Invoice invoiceData) {
    return pw.Column(
      children: [
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text('Billed to,', style: const pw.TextStyle(fontSize: 10)),
                pw.Text('MD,xyz', style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold)),
              ],
            ),
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.center,
              children: [
                pw.Text('Invoice number', style: const pw.TextStyle(fontSize: 10)),
                pw.Text(invoiceData.invoiceNumber, style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold)),
              ],
            ),
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.end,
              children: [
                pw.Text('Invoice of (USD)', style: const pw.TextStyle(fontSize: 10)),
                pw.Text(invoiceData.invoiceAmount, style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold)),
              ],
            ),
          ],
        ),
        pw.SizedBox(height: 20),
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text('Subject', style: const pw.TextStyle(fontSize: 10)),
                pw.Text(invoiceData.subject, style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold)),
              ],
            ),
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.center,
              children: [
                pw.Text('Invoice date', style: const pw.TextStyle(fontSize: 10)),
                pw.Text(invoiceData.invoiceDate, style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold)),
              ],
            ),
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.end,
              children: [
                pw.Text('Due date', style: const pw.TextStyle(fontSize: 10)),
                pw.Text(invoiceData.dueDate, style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold)),
              ],
            ),
          ],
        ),
      ],
    );
  }

  // PDF items table build করা
  pw.Widget _buildPDFItemsTable(Invoice invoiceData) {
    return pw.Column(
      children: [
        // Table Header
        pw.Container(
          padding: const pw.EdgeInsets.all(8),
          decoration: const pw.BoxDecoration(
            border: pw.Border(bottom: pw.BorderSide()),
          ),
          child: pw.Row(
            children: [
              pw.Expanded(flex: 3, child: pw.Text('ITEM DETAIL', style: pw.TextStyle(fontWeight: pw.FontWeight.bold))),
              pw.Expanded(child: pw.Text('QTY', style: pw.TextStyle(fontWeight: pw.FontWeight.bold), textAlign: pw.TextAlign.center)),
              pw.Expanded(child: pw.Text('RATE', style: pw.TextStyle(fontWeight: pw.FontWeight.bold), textAlign: pw.TextAlign.center)),
              pw.Expanded(child: pw.Text('AMOUNT', style: pw.TextStyle(fontWeight: pw.FontWeight.bold), textAlign: pw.TextAlign.right)),
            ],
          ),
        ),
        // Table Rows
        ...invoiceData.items.map((item) => pw.Container(
          padding: const pw.EdgeInsets.all(8),
          child: pw.Row(
            children: [
              pw.Expanded(flex: 3, child: pw.Text(item.description)),
              pw.Expanded(child: pw.Text(item.quantity.toString(), textAlign: pw.TextAlign.center)),
              pw.Expanded(child: pw.Text('\$${item.rate.toInt()}', textAlign: pw.TextAlign.center)),
              pw.Expanded(child: pw.Text('\$${item.amount.toInt()}', textAlign: pw.TextAlign.right)),
            ],
          ),
        )),
      ],
    );
  }

  // PDF total section build করা
  pw.Widget _buildPDFTotalSection(Invoice invoiceData) {
    return pw.Column(
      children: [
        pw.Divider(),
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.end,
          children: [
            pw.SizedBox(width: 200),
            pw.Expanded(child: pw.Text('Subtotal')),
            pw.Text('\$${invoiceData.subtotal.toInt()}', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
          ],
        ),
        pw.SizedBox(height: 5),
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.end,
          children: [
            pw.SizedBox(width: 200),
            pw.Expanded(child: pw.Text('Tax (10%)')),
            pw.Text('\$${invoiceData.tax.toInt()}', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
          ],
        ),
        pw.Divider(),
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.end,
          children: [
            pw.SizedBox(width: 200),
            pw.Expanded(child: pw.Text('Total', style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold))),
            pw.Text('\$${invoiceData.total.toInt()}', style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold)),
          ],
        ),
      ],
    );
  }

  // PDF footer build করা
  pw.Widget _buildPDFFooter() {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text('Thanks for the business.', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
        pw.SizedBox(height: 15),
        pw.Text('Terms & Conditions', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
        pw.SizedBox(height: 5),
        pw.Text('Please pay within 15 days of receiving this invoice.'),
      ],
    );
  }

  // PDF file save করা
  Future<void> _savePDF(pw.Document pdf) async {
    final bytes = await pdf.save();

    if (Platform.isAndroid) {
      final directory = await getExternalStorageDirectory();
      final downloadsDir = Directory('/storage/emulated/0/Download');

      if (await downloadsDir.exists()) {
        final fileName = 'Invoice_${invoice.value!.invoiceNumber.replaceAll('#', '')}_${DateTime.now().millisecondsSinceEpoch}.pdf';
        final file = File('${downloadsDir.path}/$fileName');
        await file.writeAsBytes(bytes);
      }
    } else if (Platform.isIOS) {
      final directory = await getApplicationDocumentsDirectory();
      final fileName = 'Invoice_${invoice.value!.invoiceNumber.replaceAll('#', '')}_${DateTime.now().millisecondsSinceEpoch}.pdf';
      final file = File('${directory.path}/$fileName');
      await file.writeAsBytes(bytes);
    }
  }

  // Alternative: Printing dialog open করা
  Future<void> printInvoice() async {
    try {
      isDownloading.value = true;
      final pdf = await _generatePDF();
      await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => pdf.save());
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to print invoice: $e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isDownloading.value = false;
    }
  }
}