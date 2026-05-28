import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_media.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/widgets/button/title_text_button.dart';
import '../../../charger/domain/entities/charger_entity.dart';
import '../../../charger/domain/entities/station_entity.dart';
import '../../../charger/presentation/bloc/station_bloc.dart';
import '../../../charger/presentation/widgets/station_image_card.dart';

class HomeStationShopList extends StatelessWidget {
  const HomeStationShopList({super.key});

  List<ConnectorDisplay> _connectorDisplaysForStation(StationEntity station) {
    if (station.chargers.isEmpty) {
      return const [];
    }

    final counts = <String, int>{};
    for (final charger in station.chargers) {
      final label = _connectorLabelForCharger(charger);
      counts[label] = (counts[label] ?? 0) + 1;
    }

    return counts.entries
        .map((entry) => ConnectorDisplay(type: entry.key, count: entry.value))
        .toList();
  }

  String _connectorLabelForCharger(ChargerEntity charger) {
    return charger.isAC ? 'AC' : 'DC';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleTextButton(text: "While You Shop"),
        const SizedBox(height: 6),
        BlocBuilder<StationBloc, StationState>(
          builder: (context, state) {
            if (state is StationInitial) {
              context.read<StationBloc>().add(StationsRequested());
              return Center(child: CircularProgressIndicator());
            }
            if (state is StationLoading) {
              return const SizedBox(
                height: 190,
                child: Center(child: CircularProgressIndicator()),
              );
            }
            if (state is StationFailure) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(state.message),
              );
            }
            if (state is StationsLoaded) {
              final stations = state.stations;
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 16),
                child: Row(
                  children: [
                    for (int i = 0; i < stations.length; i++) ...[
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            AppRoutes.homePage,
                            arguments: {"index": i},
                          );
                        },
                        child: StationImageCard(
                          stationName: stations[i].name,
                          stationInfo: "3 km · Kuala Lumpur",
                          stationImageUrl: AppMedia.placehold,
                          stationLogo: AppMedia.logoUrl,
                          connectors: _connectorDisplaysForStation(stations[i]),
                        ),
                      ),
                      (i < stations.length - 1)
                          ? SizedBox(width: 14)
                          : SizedBox(width: 16),
                    ],
                  ],
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
