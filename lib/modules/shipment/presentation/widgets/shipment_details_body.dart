import 'package:accurate/constants/extensions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../constants/colors.dart';
import '../../data/models/shipment_model.dart';
import 'info_shipment_card.dart';
import 'info_shipment_row.dart';
class ShipmentDetailsBody extends StatelessWidget {
  const ShipmentDetailsBody({super.key, required this.shipment});
final Shipment shipment;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Card with Code and Status
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.primary,
                    AppColors.primary.withOpacity(0.8),
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    spacing: 16,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.qr_code,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "كود الشحنة",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              shipment.code,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  16.sbh,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "تاريخ الإنشاء",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            _formatDateTime(shipment.date),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            20.sbh,

            InfoCard(
              title: "معلومات العميل",
              icon: Icons.person,
              children: [
                InfoRow(
                  icon: Icons.badge,
                  label: "اسم العميل",
                  value: shipment.customerName,
                ),
                const Divider(),
                InfoRow(
                  icon: Icons.qr_code,
                  label: "رقم الشحنة",
                  value: "#${shipment.id.toString()}",
                ),
              ],
            ),

            16.sbh,

            InfoCard(
              title: "تفاصيل الشحنة",
              icon: Icons.inventory,
              children: [
                InfoRow(
                  icon: Icons.confirmation_number,
                  label: "كود الشحنة",
                  value: shipment.code,
                ),
                const Divider(),
                InfoRow(
                  icon: Icons.calendar_today,
                  label: "تاريخ الشحنة",
                  value: _formatDateTime(shipment.date),
                ),
                const Divider(),
                InfoRow(
                  icon: Icons.info,
                  label: "حالة الشحنة",
                  value: shipment.statusName,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  String _formatDateTime(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      return DateFormat('yyyy/MM/dd - hh:mm a').format(date);
    } catch (e) {
      return dateString;
    }
  }
}
