class Invoice {
  final String companyName;
  final String companyWebsite;
  final String companyEmail;
  final String companyPhone;
  final String businessAddress;
  final String taxId;
  final String billedTo;
  final String invoiceNumber;
  final String invoiceAmount;
  final String subject;
  final String invoiceDate;
  final String dueDate;
  final List<InvoiceItem> items;
  final double subtotal;
  final double tax;
  final double total;

  Invoice({
    required this.companyName,
    required this.companyWebsite,
    required this.companyEmail,
    required this.companyPhone,
    required this.businessAddress,
    required this.taxId,
    required this.billedTo,
    required this.invoiceNumber,
    required this.invoiceAmount,
    required this.subject,
    required this.invoiceDate,
    required this.dueDate,
    required this.items,
    required this.subtotal,
    required this.tax,
    required this.total,
  });
}

class InvoiceItem {
  final String description;
  final int quantity;
  final double rate;
  final double amount;

  InvoiceItem({
    required this.description,
    required this.quantity,
    required this.rate,
    required this.amount,
  });
}