class Shipment {
  final String code;
  final int id;
  final String date;
  final String statusName;
  final String customerName;

  Shipment({
    required this.code,
    required this.id,
    required this.date,
    required this.statusName,
    required this.customerName,
  });

  factory Shipment.fromJson(Map<String, dynamic> json) {
    return Shipment(
      code: json['code'] ?? '',
      id: json['id'] ?? 0,
      date: json['date'] ?? '',
      statusName: json['status']?['name'] ?? '',
      customerName: json['customer']?['name'] ?? '',
    );
  }
  Shipment.empty()
      : code = '',
        id = 0,
        date = '',
        statusName = '',
        customerName = '';
}
