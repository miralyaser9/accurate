import 'package:either_dart/either.dart';

import '../../../models/my_error.dart';
import '../data/models/paginated_shipment.dart';
import '../data/models/shipment_model.dart';

abstract class ShipmentService {
  Future<Either<MyError, PaginatedShipments>> listShipments(int size, int page,{String? code});
  Future<Either<MyError, Shipment>> getShipmentById(int id);
}