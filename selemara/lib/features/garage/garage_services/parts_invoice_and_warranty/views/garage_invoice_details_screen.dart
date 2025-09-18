import 'dart:io';

import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:selemara/core/constants/app_colors.dart';
import 'package:selemara/core/widgets/app_text.dart';

import '../../../../../core/constants/app_responsive.dart';
import '../widgets/invoice_row_text.dart';
import '../widgets/three_column_text_row.dart';



// Models
class Company {
  final String name;
  final String website;
  final String email;
  final String phone;
  final String businessAddress;
  final String taxId;

  Company({
    required this.name,
    required this.website,
    required this.email,
    required this.phone,
    required this.businessAddress,
    required this.taxId,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      name: json['name'],
      website: json['website'],
      email: json['email'],
      phone: json['phone'],
      businessAddress: json['businessAddress'],
      taxId: json['taxId'],
    );
  }
}

class BillTo {
  final String name;
  final String businessAddress;
  final String phone;

  BillTo({
    required this.name,
    required this.businessAddress,
    required this.phone,
  });

  factory BillTo.fromJson(Map<String, dynamic> json) {
    return BillTo(
      name: json['name'],
      businessAddress: json['businessAddress'],
      phone: json['phone'],
    );
  }
}

class InvoiceInfo {
  final String number;
  final String amount;
  final String currency;
  final String date;
  final String dueDate;

  InvoiceInfo({
    required this.number,
    required this.amount,
    required this.currency,
    required this.date,
    required this.dueDate,
  });

  factory InvoiceInfo.fromJson(Map<String, dynamic> json) {
    return InvoiceInfo(
      number: json['number'],
      amount: json['amount'],
      currency: json['currency'],
      date: json['date'],
      dueDate: json['dueDate'],
    );
  }
}

class InvoiceItem {
  final String name;
  final String description;
  final int quantity;
  final String rate;
  final String amount;

  InvoiceItem({
    required this.name,
    required this.description,
    required this.quantity,
    required this.rate,
    required this.amount,
  });

  factory InvoiceItem.fromJson(Map<String, dynamic> json) {
    return InvoiceItem(
      name: json['name'],
      description: json['description'] ?? '',
      quantity: json['quantity'],
      rate: json['rate'],
      amount: json['amount'],
    );
  }
}

class Tax {
  final String percentage;
  final String amount;

  Tax({required this.percentage, required this.amount});

  factory Tax.fromJson(Map<String, dynamic> json) {
    return Tax(percentage: json['percentage'], amount: json['amount']);
  }
}

class InvoiceData {
  final Company company;
  final BillTo billTo;
  final InvoiceInfo invoice;
  final List<InvoiceItem> items;
  final String subtotal;
  final Tax tax;
  final String total;
  final String note;
  final String terms;
  final String paymentNote;

  InvoiceData({
    required this.company,
    required this.billTo,
    required this.invoice,
    required this.items,
    required this.subtotal,
    required this.tax,
    required this.total,
    required this.note,
    required this.terms,
    required this.paymentNote,
  });

  factory InvoiceData.fromJson(Map<String, dynamic> json) {
    return InvoiceData(
      company: Company.fromJson(json['company']),
      billTo: BillTo.fromJson(json['billTo']),
      invoice: InvoiceInfo.fromJson(json['invoice']),
      items:
          (json['items'] as List)
              .map((item) => InvoiceItem.fromJson(item))
              .toList(),
      subtotal: json['subtotal'],
      tax: Tax.fromJson(json['tax']),
      total: json['total'],
      note: json['note'],
      terms: json['terms'],
      paymentNote: json['paymentNote'],
    );
  }
}

// API Service

class InvoiceApiService {
  static Future<InvoiceData> fetchInvoiceData(String invoiceId) async {
    await Future.delayed(
      const Duration(milliseconds: 800),
    ); // Simulate API delay

    final mockData = {
      "company": {
        "name": "CarCloud",
        "website": "www.website.com",
        "email": "carcloud@email.com",
        "phone": "+0 (000) 000000",
        "businessAddress": "City, State, IN - 000 000",
        "taxId": "TAX ID 00000000000XX",
      },
      "billTo": {
        "name": "Md xyz",
        "businessAddress": "City, Country - 00000",
        "phone": "+0 (000) 123-4567",
      },
      "invoice": {
        "number": "#ARZ324-01",
        "amount": "\$4,950.00",
        "currency": "USD",
        "date": "01 Aug, 2023",
        "dueDate": "15 Aug, 2023",
      },
      "items": [
        {
          "name": "Oil Change",
          "description": "ITEM DETAIL",
          "quantity": 1,
          "rate": "\$250",
          "amount": "\$250",
        },
        {
          "name": "Oil Change & Filter",
          "description": "",
          "quantity": 1,
          "rate": "\$250",
          "amount": "\$250",
        },
        {
          "name": "AC Service",
          "description": "",
          "quantity": 1,
          "rate": "\$150",
          "amount": "\$150",
        },
      ],
      "subtotal": "\$650",
      "tax": {"percentage": "10%", "amount": "\$65"},
      "total": "\$715",
      "note": "Thanks for the business.",
      "terms": "Terms & Conditions",
      "paymentNote": "Please pay within 15 days of receiving this invoice.",
    };

    return InvoiceData.fromJson(mockData);
  }

  static Future<void> downloadInvoicePDF(InvoiceData invoice) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        build:
            (context) => [
              pw.Text(
                "Invoice",
                style: pw.TextStyle(
                  fontSize: 24,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(height: 20),

              // Company info
              pw.Text("Company: ${invoice.company.name}"),
              pw.Text("Email: ${invoice.company.email}"),
              pw.Text("Phone: ${invoice.company.phone}"),
              pw.SizedBox(height: 10),

              // Bill to
              pw.Text("Bill To: ${invoice.billTo.name}"),
              pw.Text(invoice.billTo.businessAddress),
              pw.Text(invoice.billTo.phone),
              pw.SizedBox(height: 10),

              // Invoice info
              pw.Text("Invoice Number: ${invoice.invoice.number}"),
              pw.Text("Invoice Date: ${invoice.invoice.date}"),
              pw.Text("Due Date: ${invoice.invoice.dueDate}"),
              pw.SizedBox(height: 20),

              // Items Table
              pw.Table.fromTextArray(
                headers: ["Item", "Qty", "Rate", "Amount"],
                data:
                    invoice.items
                        .map(
                          (item) => [
                            item.name,
                            item.quantity.toString(),
                            item.rate,
                            item.amount,
                          ],
                        )
                        .toList(),
              ),
              pw.SizedBox(height: 20),

              // Totals
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.end,
                children: [
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.end,
                    children: [
                      pw.Text("Subtotal: ${invoice.subtotal}"),
                      pw.Text(
                        "Tax (${invoice.tax.percentage}): ${invoice.tax.amount}",
                      ),
                      pw.Text(
                        "Total: ${invoice.total}",
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              pw.SizedBox(height: 20),

              // Notes
              pw.Text("Note: ${invoice.note}"),
              pw.Text("Terms: ${invoice.terms}"),
              pw.Text("Payment: ${invoice.paymentNote}"),
            ],
      ),
    );

    // 📂 Save to device
    final dir = await getApplicationDocumentsDirectory();
    final file = File("${dir.path}/${invoice.invoice.number}.pdf");
    await file.writeAsBytes(await pdf.save());

    // 🔥 Auto open the PDF
    await OpenFile.open(file.path);
  }
}

class GarageInvoiceDetailsScreen extends StatelessWidget {
  final InvoiceData invoiceData;
  final res = AppResponsive();

  GarageInvoiceDetailsScreen({Key? key, required this.invoiceData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(context),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      AppText(
                        "CarClowd",
                        color: AppColors.primaryTextColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                      SizedBox(height: res.hp(5)),

                      InvoiceRowText(
                        leftText: "www.website.com",
                        rightText: "Business address",
                      ),
                      SizedBox(height: res.hp(2)),

                      InvoiceRowText(
                        leftText: "carclowd@email.com",
                        rightText: "City, State, IN - 000 000",
                      ),
                      SizedBox(height: res.hp(2)),

                      InvoiceRowText(
                        leftText: "+91 00000 00000",
                        rightText: "TAX ID 00XXXXX1234X0XX",
                      ),

                      SizedBox(height: res.hp(36)),
                      ThreeColumnTextRow(
                        firstText: "Billed to,",
                        secondText: "Invoice number",
                        thirdText: "Invoice of (USD)",
                      ),
                      const SizedBox(height: 2),
                      ThreeColumnTextRow(
                        firstColor: AppColors.primaryTextColor,
                        firstFontWeight: FontWeight.w600,
                        secondColor: AppColors.primaryTextColor,
                        secondFontWeight: FontWeight.w600,
                        firstFontSize: 11,
                        thirdColor: AppColors.greenColor,
                        thirdFontWeight: FontWeight.w700,
                        thirdFontSize: 16,

                        secondFontSize: 11,

                        firstText: "Md xyz",
                        secondText: "#AB2324-01",
                        thirdText: "\$4,950.00}",
                      ),

                      SizedBox(height: res.hp(2)),
                      AppText(
                        "Business address",
                        color: Color(0xFF5E6470),
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                      AppText(
                        "City, Country - 00000",
                        color: Color(0xFF5E6470),
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                      AppText(
                        "+0 (000) 123-4567",
                        color: Color(0xFF5E6470),
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),

                      SizedBox(height: res.hp(8)),
                      ThreeColumnTextRow(
                        firstText: "Subject ",
                        secondText: "Invoice date",
                        thirdText: "Due date",
                      ),

                      _buildItemsTable(),
                      const SizedBox(height: 20),
                      _buildTotals(),
                      const SizedBox(height: 20),
                      Text(
                        invoiceData.note,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        "Terms & Conditions",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade800,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        invoiceData.paymentNote,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            _buildDownloadButton(context),
          ],
        ),
      ),
    );
  }

  // ---------- UI Sections ------------

  Widget _buildAppBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(
              Icons.chevron_left,
              size: 28,
              color: Colors.black,
            ),
          ),
          const SizedBox(width: 8),
          const Text(
            "Invoice Details",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCompanySection() {
    final company = invoiceData.company;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                company.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                company.website,
                style: _smallGreyText(),
                overflow: TextOverflow.ellipsis,
              ),
              Text(company.email, style: _smallGreyText()),
              Text(company.phone, style: _smallGreyText()),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                company.businessAddress,
                style: _smallGreyText(),
                textAlign: TextAlign.end,
              ),
              const SizedBox(height: 4),
              Text(
                company.taxId,
                style: _smallGreyText(),
                textAlign: TextAlign.end,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBillToAndInvoiceSection() {
    final billTo = invoiceData.billTo;
    final invoice = invoiceData.invoice;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Billed to
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Billed to,", style: _smallGreyText()),
              const SizedBox(height: 6),
              Text(
                billTo.name,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 4),
              Text(billTo.businessAddress, style: _normalText()),
              Text(billTo.phone, style: _normalText()),
            ],
          ),
        ),

        // Invoice info
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("Invoice number", style: _smallGreyText()),
              const SizedBox(height: 4),
              Text(
                invoice.number,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 12),
              Text("Invoice of (${invoice.currency})", style: _smallGreyText()),
              const SizedBox(height: 4),
              Text(
                invoice.amount,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSubjectAndDates() {
    final invoice = invoiceData.invoice;
    return Row(
      children: [
        // Subject
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Subject", style: _smallGreyText()),
              const SizedBox(height: 4),
              Text(
                invoiceData.items.first.name,
                style: _normalText(),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        // Invoice date
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Invoice date", style: _smallGreyText()),
              const SizedBox(height: 4),
              Text(invoice.date, style: _normalText()),
            ],
          ),
        ),
        // Due date
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Due date", style: _smallGreyText()),
              const SizedBox(height: 4),
              Text(invoice.dueDate, style: _normalText()),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildItemsTable() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: const [
              Expanded(
                flex: 2,
                child: AppText(
                  "ITEM DETAIL",

                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              Expanded(
                child: Text(
                  "QTY",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  "RATE",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  "AMOUNT",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
        const Divider(),
        ...invoiceData.items.map((item) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Row(
              children: [
                Expanded(flex: 2, child: Text(item.name, style: _normalText())),
                Expanded(
                  child: Text(
                    "${item.quantity}",
                    textAlign: TextAlign.center,
                    style: _normalText(),
                  ),
                ),
                Expanded(
                  child: Text(
                    item.rate,
                    textAlign: TextAlign.center,
                    style: _normalText(),
                  ),
                ),
                Expanded(
                  child: Text(
                    item.amount,
                    textAlign: TextAlign.end,
                    style: _normalText(),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ],
    );
  }

  Widget _buildTotals() {
    final data = invoiceData;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _rowText("Subtotal", data.subtotal),
        _rowText("Tax (${data.tax.percentage})", data.tax.amount),
        const Divider(),
        _rowText("Total", data.total, bold: true),
      ],
    );
  }

  Widget _buildDownloadButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: ElevatedButton.icon(
        onPressed: () async {
          await InvoiceApiService.downloadInvoicePDF(invoiceData);

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("PDF saved for ${invoiceData.invoice.number}"),
            ),
          );
        },
        icon: const Icon(Icons.download),
        label: const Text("Download"),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          minimumSize: const Size(double.infinity, 50),
        ),
      ),
    );
  }

  // ---------- Helpers ------------

  static TextStyle _smallGreyText() =>
      TextStyle(fontSize: 12, color: Colors.grey.shade700);

  static TextStyle _normalText() =>
      const TextStyle(fontSize: 14, color: Colors.black);

  Widget _rowText(String left, String right, {bool bold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            left,
            style: TextStyle(
              fontSize: 14,
              fontWeight: bold ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
          Text(
            right,
            style: TextStyle(
              fontSize: 14,
              fontWeight: bold ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
