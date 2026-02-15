import 'dart:async';

import 'package:accurate/modules/shipment/data/models/shipment_model.dart';
import 'package:accurate/modules/shipment/presentation/state.dart';
import 'package:accurate/modules/shipment/service/shipment_service.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../constants/toast_manager.dart';
import '../data/models/paginated_shipment.dart';

class ShipmentProvider extends ChangeNotifier {
  final ShipmentService shipmentService;

  ShipmentProvider(this.shipmentService);

  ShipmentState state = ShipmentState();

  Future<PaginatedShipments?> getShipmentsPage(
    int page, {
    int size = 10,
    String? code,
  }) async {
    final result = await shipmentService.listShipments(page, size, code: code);

    return result.fold((error) {
      ToastManager.showError(error.message ?? "Unknown error");
      return null;
    }, (paginated) => paginated);
  }

  Future<PagingState<int, Shipment>> fetchShipments(
    PagingState<int, Shipment> pagingState, {
    String? code,
  }) async {
    pagingState = pagingState.copyWith(isLoading: true);

    final int page = pagingState.keys == null
        ? 1
        : (pagingState.keys?.last ?? -1) + 1;

    // Prevent duplicate page calls
    if (state.lastShipmentsPage == page) {
      return pagingState.copyWith(isLoading: false);
    }

    state.lastShipmentsPage = page;

    final PaginatedShipments? result = await getShipmentsPage(page, code: code);

    if (result == null) {
      return pagingState.copyWith(isLoading: false);
    }

    state.total = result.paginatorInfo.total;

    pagingState = pagingState.copyWith(
      pages: [...?pagingState.pages, result.data],
      keys: [...?pagingState.keys, page],
      hasNextPage:
          result.paginatorInfo.currentPage < result.paginatorInfo.lastPage,
      isLoading: false,
    );

    if (code == null) {
      state.paginatedShipments = result;
      state.shipmentPagingState = pagingState;
    }
    if (code != null) state.searchShipmentState = pagingState;
    notifyListeners();
    return pagingState;
  }

  Future<Shipment?> getShipmentById(int id) async {
    state.isLoading = true;
    notifyListeners();
    final result = await shipmentService.getShipmentById(id);
    Shipment? shipmentModel;

    result.fold(
      (error) {
        ToastManager.showError(error.message ?? "Unknown error");
        return null;
      },
      (shipment) {
        shipmentModel = shipment;
      },
    );

    state.isLoading = false;
    notifyListeners();
    return shipmentModel;
  }

  void searchShippingOnChange(String value, Timer? debounce) {
    {
      if (value.isEmpty) {
        state.canSearch = false;
        state.total = state.paginatedShipments?.paginatorInfo.total;
        notifyListeners();
        return;
      } else {
        debounce?.cancel();
        debounce = Timer(const Duration(milliseconds: 500), () {
          state.searchShipmentState = PagingState<int, Shipment>();
          state.lastShipmentsPage = -1;
          fetchShipments(state.searchShipmentState, code: value);
        });
      }
    }
  }

  void clearSearch() {
    state.searchController.clear();
    state.canSearch = false;
    state.total = state.paginatedShipments?.paginatorInfo.total;
    notifyListeners();
  }

  void toggleSearch() {
    state.canSearch = true;
    notifyListeners();
  }
}
