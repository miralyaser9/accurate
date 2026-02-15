import 'package:accurate/constants/extensions.dart';
import 'package:accurate/modules/shipment/presentation/widgets/home_service_card.dart';
import 'package:accurate/modules/shipment/presentation/widgets/home_header_widget.dart';

import 'package:flutter/material.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeHeaderWidget(),
              30.sbh,
              Text(
                'الشحنات',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
              16.sbh,
              HomeServiceCard(),
            ],
          ),
        ),
      ),
    );
  }
}
