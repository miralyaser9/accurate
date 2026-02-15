import 'package:accurate/modules/shipment/presentation/provider.dart';
import 'package:accurate/modules/shipment/presentation/widgets/shipment_item_widget.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../constants/colors.dart';
import '../../data/models/shipment_model.dart';

class ShipmentsList extends StatelessWidget {
  const ShipmentsList({super.key, required this.provider});

  final ShipmentProvider provider;

  @override
  Widget build(BuildContext context) {
    final searchValue = provider.state.searchController.text.trim();
    return Expanded(
      child: PagedListView<int, Shipment>(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        state: provider.state.canSearch && searchValue.isNotEmpty
            ? provider.state.searchShipmentState
            : provider.state.shipmentPagingState,
        fetchNextPage: () {
          provider.fetchShipments(
            code: searchValue.isNotEmpty ? searchValue : null,
            provider.state.canSearch && searchValue.isNotEmpty
                ? provider.state.searchShipmentState
                : provider.state.shipmentPagingState,
          );
        },
        builderDelegate: PagedChildBuilderDelegate<Shipment>(
          firstPageErrorIndicatorBuilder: (context) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 48,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "حدث خطأ في تحميل البيانات",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          newPageErrorIndicatorBuilder: (context) =>
              Center(child: const Text("حدث خطأ، حاول مرة أخرى")),
          itemBuilder: (context, shipment, index) => FadeInLeft(
            duration: Duration(milliseconds: 600 + (index * 50)),
            child: ShipmentItemWidget(shipment: shipment),
          ),
          newPageProgressIndicatorBuilder: (context) => Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SpinKitWave(color: AppColors.primary, size: 24),
            ),
          ),
          firstPageProgressIndicatorBuilder: (context) => Center(
            child: SizedBox(
              // width: 150,
              height: MediaQuery.of(context).size.height * 0.8,
              child: Skeletonizer(
                enabled: true,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    return ShipmentItemWidget(shipment: Shipment.empty());
                  },
                ),
              ),
            ),
          ),
          noMoreItemsIndicatorBuilder: (context) => Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.check_circle,
                      color: Colors.grey[400],
                      size: 24,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "لا توجد المزيد من الشحنات",
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
          noItemsFoundIndicatorBuilder: (context) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.inbox, color: Colors.grey[400], size: 60),
                ),
                const SizedBox(height: 16),
                Text(
                  searchValue.isNotEmpty
                      ? "لا توجد نتائج للبحث"
                      : "لا توجد شحنات",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
