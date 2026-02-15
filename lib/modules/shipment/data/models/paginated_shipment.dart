
import 'package:accurate/modules/shipment/data/models/shipment_model.dart';

import '../../../../models/paginator_info.dart';

class PaginatedShipments {
  final PaginatorInfo paginatorInfo;
  final List<Shipment> data;

  PaginatedShipments({
    required this.paginatorInfo,
    required this.data,
  });

  factory PaginatedShipments.fromJson(Map<String, dynamic> json) {
    final paginator = PaginatorInfo.fromJson(json['paginatorInfo']);
    final shipments = (json['data'] as List<dynamic>)
        .map((e) => Shipment.fromJson(e))
        .toList();

    return PaginatedShipments(
      paginatorInfo: paginator,
      data: shipments,
    );
  }
}
