enum ShipmentStatusEnum {
  receivedInWarehouse,
  outForDelivery,
  delivered,
  returnedToSender,
}

extension OrderStatusExtension on ShipmentStatusEnum {
  String get nameAr {
    switch (this) {
      case ShipmentStatusEnum.receivedInWarehouse:
        return "تم الاستلام بالمخزن";
      case ShipmentStatusEnum.outForDelivery:
        return "قيد التوصيل";
      case ShipmentStatusEnum.delivered:
        return "تم التسليم";
      case ShipmentStatusEnum.returnedToSender:
        return "تم الارجاع للراسل";
    }
  }
}
