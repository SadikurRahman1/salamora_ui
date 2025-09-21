import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/invoice_controller.dart';
import '../model/invoice_details_model.dart';


class InvoiceDetailsScreen extends StatelessWidget {
  final InvoiceController controller = Get.put(InvoiceController());

  InvoiceDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Invoice Details',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.invoice.value == null) {
          return const Center(child: CircularProgressIndicator());
        }

        final invoice = controller.invoice.value!;

        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Company Header
                        _buildCompanyHeader(invoice),

                        const SizedBox(height: 30),

                        // Invoice Info
                        _buildInvoiceInfo(invoice),

                        const SizedBox(height: 10),

                        // Items Table
                        _buildItemsTable(invoice),

                        const SizedBox(height: 5),

                        // Total Section
                        _buildTotalSection(invoice),

                        const SizedBox(height: 30),

                        // Footer
                        _buildFooter(),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Download Button
            // আপনার existing code এর download button section টা এটা দিয়ে replace করুন

// Download Button
            Container(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: Obx(() => ElevatedButton(
                  onPressed: controller.isDownloading.value ? null : controller.downloadInvoice,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2C3E50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: controller.isDownloading.value
                      ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Downloading...',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  )
                      : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.download, color: Colors.white),
                      SizedBox(width: 8),
                      Text(
                        'Download',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                )),
              ),
            ),

// Optional: Print button ও add করতে পারেন
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: Obx(() => ElevatedButton(
                  onPressed: controller.isDownloading.value ? null : controller.printInvoice,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: const BorderSide(color: Color(0xFF2C3E50)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.print, color: Color(0xFF2C3E50)),
                      SizedBox(width: 8),
                      Text(
                        'Print',
                        style: TextStyle(
                          color: Color(0xFF2C3E50),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                )),
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget _buildCompanyHeader(Invoice invoice) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          invoice.companyName,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        // const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                Text(
                  invoice.companyWebsite,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
                Text(
                  invoice.companyEmail,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
                Text(
                  invoice.companyPhone,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
              ],
            ),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Business address',
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                  Text(
                    invoice.businessAddress,
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                  // const SizedBox(height: 5),
                  Text(
                    invoice.taxId,
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInvoiceInfo(Invoice invoice) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Billed to,',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  "MD,xyz",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Invoice number',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  invoice.invoiceNumber,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            // const SizedBox(width: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  'Invoice of (USD)',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  invoice.invoiceAmount,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ],
        ),

        const SizedBox(height: 10),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Business address',
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
            Text(
              invoice.businessAddress,
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
            Text(
              invoice.taxId,
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Subject',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  invoice.subject,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 50),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Invoice date',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  invoice.invoiceDate,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  'Due date',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  invoice.dueDate,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildItemsTable(Invoice invoice) {
    return Column(
      children: [
        // Table Header
        Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
          ),
          child: const Row(
            children: [
              Expanded(
                flex: 3,
                child: Text(
                  'ITEM DETAIL',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  'QTY',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Text(
                  'RATE',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Text(
                  'AMOUNT',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ),

        // Table Rows
        ...invoice.items.map(
          (item) => Container(
            padding: const EdgeInsets.symmetric(vertical: 6),
            decoration: BoxDecoration(
              // border: Border(bottom: BorderSide(color: Colors.grey[200]!)),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    item.description,
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
                Expanded(
                  child: Text(
                    item.quantity.toString(),
                    style: const TextStyle(fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Text(
                    '\$${item.rate.toInt()}',
                    style: const TextStyle(fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Text(
                    '\$${item.amount.toInt()}',
                    style: const TextStyle(fontSize: 14),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
          ),
        ),
        Divider()
      ],
    );
  }

  Widget _buildTotalSection(Invoice invoice) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Expanded(flex: 4, child: SizedBox()),
            Expanded(flex: 3, child: Text("Subtotal")),
            Text("\$400", style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Expanded(flex: 4, child: SizedBox()),
            Expanded(flex: 3, child: Text("Tax (10%)")),
            Text("\$40", style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [SizedBox(width: 180, child: const Divider())],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Expanded(flex: 4, child: SizedBox()),
            Expanded(
              flex: 3,
              child: Text(
                "Total",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              "\$440",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFooter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Thanks for the business.',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 15),
        const Text(
          'Terms & Conditions',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 5),
        Text(
          'Please pay within 15 days of receiving this invoice.',
          style: TextStyle(fontSize: 12, color: Colors.grey[600]),
        ),
      ],
    );
  }
}

// import 'package:flutter/material.dart';
//
// class InvoiceDetailsScreen extends StatelessWidget {
//   const InvoiceDetailsScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         leading: const BackButton(color: Colors.black),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: const Text(
//           "Invoice Details",
//           style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Header Info
//             Text("CarCloud", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: const [
//
//                     Text("www.website.com"),
//                     Text("carclowd@email.com"),
//                     Text("+91 00000 00000"),
//                   ],
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: const [
//                     Text("Business address"),
//                     Text("City, State, IN - 000 000"),
//                     Text("TAX ID 00XXXX1234XXX"),
//                   ],
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),
//
//             // Invoice Info
//             Container(
//               padding: const EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.grey.shade300),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // top row
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text("Billed to,",),
//                           Text("Md xyz"),
//                         ],
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: const [
//                           Text("Invoice number"),
//                           Text("#AB2324-01", style: TextStyle(fontWeight: FontWeight.bold)),
//                           ],
//                       ),
//
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         children: const [
//                           Text("Invoice of (USD)"),
//                           Text("\$4,950.00",
//                               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green)),
//                         ],
//                       ),
//                     ],
//                   ),
//
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text("Business address"),
//                       Text("City, Country - 00000"),
//                       Text("+0 (000) 123-4567"),
//                     ],
//                   ),
//                   const SizedBox(height: 16),
//
//                   // Dates
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: const [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text("Subject"),
//                           Text("Oil Change", style: TextStyle(fontWeight: FontWeight.bold)),
//                         ],
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Text("Invoice date"),
//                           Text("01 Aug, 2023", style: TextStyle(fontWeight: FontWeight.bold)),
//                         ],
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         children: [
//                           Text("Due date"),
//                           Text("15 Aug, 2023", style: TextStyle(fontWeight: FontWeight.bold)),
//                         ],
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 16),
//
//                   // Table Header
//                   Container(
//                     padding: const EdgeInsets.symmetric(vertical: 8),
//                     color: Colors.grey.shade200,
//                     child: const Row(
//                       children: [
//                         Expanded(flex: 3, child: Text("ITEM DETAIL",)),
//                         Expanded(flex: 1, child: Text("QTY", )),
//                         Expanded(flex: 1, child: Text("RATE",)),
//                         Expanded(flex: 0, child: Text("AMOUNT",)),
//                       ],
//                     ),
//                   ),
//
//                   // Items
//                   const Row(
//                     children: [
//                       Expanded(flex: 3, child: Text("Oil Change & Filter")),
//                       Expanded(flex: 1, child: Text("1")),
//                       Expanded(flex: 1, child: Text("\$250")),
//                       Expanded(flex: 0, child: Text("\$250")),
//                     ],
//                   ),
//                   const Row(
//                     children: [
//                       Expanded(flex: 3, child: Text("AC Service")),
//                       Expanded(flex: 1, child: Text("1")),
//                       Expanded(flex: 1, child: Text("\$150")),
//                       Expanded(flex: 0, child: Text("\$150")),
//                     ],
//                   ),
//                   const Divider(),
//
//                   // Summary
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: const [
//                       Expanded(flex: 4, child: SizedBox()),
//                       Expanded(flex: 3, child: Text("Subtotal")),
//                       Text("\$400", style: TextStyle(fontWeight: FontWeight.bold)),
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: const [
//                       Expanded(flex: 4, child: SizedBox()),
//                       Expanded(flex: 3, child: Text("Tax (10%")),
//                       Text("\$40", style: TextStyle(fontWeight: FontWeight.bold)),
//                     ],
//                   ),
//                   SizedBox(
//                     width: double.infinity,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         SizedBox(width: 180, child: const Divider()),
//                       ],
//                     ),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: const [
//                       Expanded(flex: 4,child: SizedBox()),
//                       Expanded(flex: 3,child: Text("Total  ", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
//                       Text("\$440",
//                             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,)),
//                     ],
//                   ),
//
//                   const SizedBox(height: 12),
//                   const Text("Thanks for the business."),
//                 ],
//               ),
//             ),
//
//             const SizedBox(height: 20),
//             const Text(
//               "Terms & Conditions",
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             const Text("Please pay within 15 days of receiving this invoice."),
//             const SizedBox(height: 30),
//
//             // Download Button
//             Center(
//               child: ElevatedButton.icon(
//                 onPressed: () {},
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.black,
//                   padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//                 ),
//                 icon: const Icon(Icons.download, color: Colors.white),
//                 label: const Text("Download", style: TextStyle(color: Colors.white)),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
