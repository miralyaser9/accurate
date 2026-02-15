import 'package:accurate/modules/shipment/data/models/paginated_shipment.dart';
import 'package:accurate/modules/shipment/data/models/shipment_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ShipmentState {
  bool isLoading = false;
  int? total;
  int lastShipmentsPage = -1;
  bool canSearch=false;
   PagingState<int, Shipment> shipmentPagingState =
      PagingState<int, Shipment>();
  PagingState<int, Shipment> searchShipmentState =
  PagingState<int, Shipment>();
  PaginatedShipments? paginatedShipments;
  TextEditingController searchController = TextEditingController();
}
