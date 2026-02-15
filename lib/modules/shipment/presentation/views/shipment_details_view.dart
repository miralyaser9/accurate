import 'package:accurate/constants/colors.dart';
import 'package:accurate/modules/shipment/data/models/shipment_model.dart';
import 'package:accurate/modules/shipment/presentation/provider.dart';
import 'package:accurate/modules/shipment/presentation/widgets/shipment_details_body.dart';
import 'package:accurate/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class ShipmentDetailsView extends StatefulWidget {
  ShipmentDetailsView({super.key, required this.shipmentId});

  final int shipmentId;
  Shipment? shipment;

  @override
  State<ShipmentDetailsView> createState() => _ShipmentDetailsViewState();
}

class _ShipmentDetailsViewState extends State<ShipmentDetailsView> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await context
          .read<ShipmentProvider>()
          .getShipmentById(widget.shipmentId)
          .then((shipment) {
            setState(() {
              widget.shipment = shipment;
            });
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("تفاصيل الشحنة")),
      body: Consumer<ShipmentProvider>(
        builder: (context, provider, child) {
          if (provider.state.isLoading) {
            return Center(
              child: Column(
                spacing: 16,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SpinKitThreeBounce(color: AppColors.primary, size: 40),

                  Text(
                    "جاري تحميل بيانات الشحنة...",
                    style: TextStyle(color: Colors.grey[600], fontSize: 16),
                  ),
                ],
              ),
            );
          }

          if (provider.state.isLoading == false && widget.shipment == null) {
            return Center(child: CustomErrorWidget());
          }

          final shipment = widget.shipment!;

          return ShipmentDetailsBody(shipment: shipment);
        },
      ),
    );
  }
}
