import 'package:accurate/constants/extensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../constants/colors.dart';
import '../../data/enums/shipment_status_enum.dart';
import '../../data/models/shipment_model.dart';
import '../../service/shipment_service_impl.dart';
import '../provider.dart';
import '../views/shipment_details_view.dart';

class ShipmentItemWidget extends StatelessWidget {
  final Shipment shipment;

  const ShipmentItemWidget({super.key, required this.shipment});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ChangeNotifierProvider(
                  create: (_) => ShipmentProvider(ShipmentServiceImpl()),
                  child: ShipmentDetailsView(shipmentId: shipment.id),
                ),
              ),
            );
          },
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.inventory_2,
                    color: AppColors.primary,
                    size: 24,
                  ),
                ),
                12.sbw,

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              shipment.customerName ?? 'غير محدد',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: getStatusColor(
                                shipment.statusName,
                              ).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  getStatusIcon(shipment.statusName),
                                  color: getStatusColor(shipment.statusName),
                                  size: 12,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  getStatusText(shipment.statusName),
                                  style: TextStyle(
                                    color: getStatusColor(shipment.statusName),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      8.sbh,

                      Row(
                        spacing: 4,
                        children: [
                          Icon(
                            Icons.qr_code,
                            size: 14,
                            color: Colors.grey[600],
                          ),
                          Text(
                            "كود: ${shipment.code ?? 'غير محدد'}",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                      4.sbh,

                      Row(
                        spacing: 4,
                        children: [
                          Icon(
                            Icons.calendar_today,
                            size: 14,
                            color: Colors.grey[600],
                          ),
                          if (shipment.date != "")
                            Text(
                              _formatDate(DateTime.parse(shipment.date)),
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                            ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              '#${shipment.id ?? '000000'}',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey[700],
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }

  ShipmentStatusEnum shipmentStatusFromString(String? value) {
    switch (value) {
      case "تم التسليم":
        return ShipmentStatusEnum.delivered;

      case "قيد التوصيل":
        return ShipmentStatusEnum.outForDelivery;

      case "تم الاستلام بالمخزن":
        return ShipmentStatusEnum.receivedInWarehouse;

      case "تم الارجاع للراسل":
        return ShipmentStatusEnum.returnedToSender;

      default:
        return ShipmentStatusEnum.receivedInWarehouse;
    }
  }

  Color getStatusColor(String? name) {
    final statusEnum = shipmentStatusFromString(shipment.statusName);

    switch (statusEnum) {
      case ShipmentStatusEnum.delivered:
        return Colors.green;

      case ShipmentStatusEnum.outForDelivery:
        return Colors.blue;

      case ShipmentStatusEnum.receivedInWarehouse:
        return Colors.orange;

      case ShipmentStatusEnum.returnedToSender:
        return Colors.red;
    }
  }

  IconData getStatusIcon(String? statusName) {
    final statusEnum = shipmentStatusFromString(shipment.statusName);

    switch (statusEnum) {
      case ShipmentStatusEnum.delivered:
        return Icons.check_circle;

      case ShipmentStatusEnum.outForDelivery:
        return Icons.local_shipping;

      case ShipmentStatusEnum.receivedInWarehouse:
        return Icons.pending;

      case ShipmentStatusEnum.returnedToSender:
        return Icons.reply;
    }
  }

  String getStatusText(String? statusName) {
    final statusEnum = shipmentStatusFromString(shipment.statusName);

    switch (statusEnum) {
      case ShipmentStatusEnum.delivered:
        return 'تم التسليم';

      case ShipmentStatusEnum.outForDelivery:
        return 'في الطريق';

      case ShipmentStatusEnum.receivedInWarehouse:
        return 'تم الاستلام بالمخزن';

      case ShipmentStatusEnum.returnedToSender:
        return 'تم الارجاع';
    }
  }
}
