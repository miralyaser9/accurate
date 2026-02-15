import 'dart:async';

import 'package:accurate/modules/shipment/presentation/provider.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class SearchShipmentsWidget extends StatelessWidget {
  const SearchShipmentsWidget({
    super.key,
    required this.provider,
   // required this.searchValue,
    required this.debounce,
  });

  final ShipmentProvider provider;
  final Timer? debounce;
 // String searchValue = "";

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      duration: Duration(seconds: 1),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
          child: TextFormField(
            controller: provider.state.searchController,
            onChanged: (text) {
              // searchValue = text.trim();

              provider.searchShippingOnChange(text, debounce);
            },
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  provider.clearSearch();
                },
              ),
              hintText: " (مثال: N008096)",
              labelText: "ابحث بالكود",

              prefixIcon: const Icon(Icons.search),
              contentPadding: const EdgeInsets.symmetric(vertical: 0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
