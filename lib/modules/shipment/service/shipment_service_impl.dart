import 'package:accurate/models/my_error.dart';
import 'package:accurate/modules/shipment/data/models/shipment_model.dart';
import 'package:accurate/modules/shipment/service/shipment_service.dart';
import 'package:either_dart/src/either.dart';

import '../../../network/network_handler.dart';
import '../data/models/paginated_shipment.dart';

class ShipmentServiceImpl implements ShipmentService {
  @override
  Future<Either<MyError, PaginatedShipments>> listShipments(
    int page,
    int size, {
    String? code,
  }) async {
    String listShipmentsQuery =
        """
    query ListShipments {
      listShipments(first: $size, page: $page,${code != null ? 'input:{code:"$code"}' : ''}
    ) {
        paginatorInfo {
          count
          currentPage
          lastPage
          perPage
          total
        }
        data {
          id
          code
          date
          status {
            name
          }
          customer {
            name
          }
        }
      }
    }
  """;
    final result = await NetworkHandler.post(query: listShipmentsQuery);

    return result.either(
      (left) => left,
      (data) => PaginatedShipments.fromJson(data['listShipments']),
    );
  }

  @override
  Future<Either<MyError, Shipment>> getShipmentById(int id) async {
    final String query =
        """
    query GetShipmentById {
      shipment(id: $id) {
        id
        code
        date
        status { name }
        customer { name }
        trackingUrl
      }
    }
  """;

    final result = await NetworkHandler.post(query: query);

    return result.either(
      (left) => left,
      (data) => Shipment.fromJson(data['shipment']),
    );
  }
}
