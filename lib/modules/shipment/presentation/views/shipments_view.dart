import 'dart:async';

import 'package:accurate/constants/colors.dart';
import 'package:accurate/constants/extensions.dart';
import 'package:accurate/modules/shipment/presentation/widgets/search_shipments_widget.dart';
import 'package:accurate/modules/shipment/presentation/widgets/shipments_list.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider.dart';

class ShipmentsView extends StatefulWidget {
  const ShipmentsView({super.key});

  @override
  State<ShipmentsView> createState() => _ShipmentsViewState();
}

class _ShipmentsViewState extends State<ShipmentsView> {
  Timer? _debounce;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<ShipmentProvider>().state.lastShipmentsPage = -1;
      await context.read<ShipmentProvider>().fetchShipments(
        context.read<ShipmentProvider>().state.shipmentPagingState,
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ShipmentProvider>();

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Text(provider.state.canSearch ? "" : "الشحنات"),
        actions: [
          if (!provider.state.canSearch)
            IconButton(
              onPressed: () {
                provider.toggleSearch();
              },
              icon: Icon(Icons.search),
            ),
          if (provider.state.canSearch)
            SearchShipmentsWidget(
              provider: provider,
              debounce: _debounce,
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeInDown(
              duration: const Duration(milliseconds: 500),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "قائمة الشحنات",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "إجمالي: ${provider.state.total ?? ""}",
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            16.sbh,
            ShipmentsList(provider: provider),
          ],
        ),
      ),
    );
  }
}
