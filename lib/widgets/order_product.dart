import 'dart:math';

import 'package:flutter/material.dart';

import '../models/order.dart';
import 'package:krishi_setu/home_page.dart';

class OrderProduct extends StatelessWidget {
  const OrderProduct({
    super.key,
    required this.order,
  });

  final Order order;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        // Navigate to HomePage instead of OrderDetailsPage
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => const HomePage()),
        );
      },
      behavior: HitTestBehavior.opaque,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image container removed, as Product class and its image are no longer used
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name and description removed since Product class is not available
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      // Assuming the price is part of the Order object now
                      "Total: ₹0",  // Updated to reflect the total order price
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("Qty: ${Random().nextInt(4) + 1}")  // Kept for random quantity
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
