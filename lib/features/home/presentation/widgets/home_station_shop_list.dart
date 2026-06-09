import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/constant.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/widgets/button/title_text_button.dart';
import '../../../charger/presentation/bloc/station_bloc.dart';
import '../../../charger/presentation/widgets/station_image_card.dart';
import '../pages/home_page.dart';

class HomeStationList extends StatelessWidget {
  const HomeStationList({super.key, required this.headerText});

  final String headerText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleTextButton(text: headerText),
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
              // debugPrint('${stations.length}');
              // for (var station in stations) {
              //   debugPrint("===============================");
              //   debugPrint("Station: ${station.name}");
              //   debugPrint("Chargers Count: ${station.chargers.length}");
              //   for (var charger in station.chargers) {
              //     debugPrint(
              //       "  - Charger ID: ${charger.id}, Power: ${charger.powerOutput}kW, Type: ${charger.connectorType}",
              //     );
              //   }
              // }
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
                          // print('${stations[i].name}');
                        },
                        child: SizedBox(
                          width: 250,
                          child: StationImageCard(
                            stationName: stations[i].name,
                            stationInfo:
                                "${(formatDistance(stations[i].distance))} · ${stations[i].town}",
                            stationImageUrl: AppMedia.placehold,
                            stationLogo: AppMedia.logoUrl,
                            connectors: connectorDisplaysForStation(
                              stations[i],
                            ),
                          ),
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
