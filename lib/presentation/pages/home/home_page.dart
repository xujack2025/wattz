import 'package:flutter/material.dart';

import '../../widgets/card/location_merchant_detail_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> _handleRefresh() async {
    await Future.delayed(const Duration(seconds: 1));
    debugPrint("Data reloaded!");
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      edgeOffset: 60,
      displacement: 0,
      onRefresh: _handleRefresh,
      child: Scaffold(
        appBar: AppBar(),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  // Merchant Charger Quick Access Card
                  SizedBox(height: 60),
                  LocationMerchantDetailCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
