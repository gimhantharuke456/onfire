import 'package:flutter/material.dart';
import 'package:onfire/models/fire.prediction.data.model.dart';
import 'package:onfire/services/fire.prediction.service.dart';
import 'package:onfire/utils/index.dart';
import 'package:onfire/views/fire.seviority.percentage.view.dart';

class FireSeviorityView extends StatelessWidget {
  const FireSeviorityView({super.key});

  @override
  Widget build(BuildContext context) {
    final _firePredictionService = FirePredictionService();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: StreamBuilder<FirePredictionData>(
          stream: _firePredictionService.getFirePredictionStream(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            final data = snapshot.data!;

            return Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        child: Text(
                          "Fire Direction",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          context.navigator(
                              context, const FireSeverityPercentageView());
                        },
                        child: const Text("Percentage"),
                      )
                    ],
                  ),
                  const Divider(),
                  Center(
                    child: Text(
                      data.fireDirection,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Divider(),
                  Expanded(
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        // Top Sensors (1 and 2)
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Sensor_1\n${data.sensorTemperatures['Sensor_1']?.toStringAsFixed(1)}°C',
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                'Sensor_2\n${data.sensorTemperatures['Sensor_2']?.toStringAsFixed(1)}°C',
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),

                        // Center Image
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 60,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              'assets/img7.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        // Center Text - Show Sensor_3
                        Center(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              'Sensor_3\n${data.sensorTemperatures['Sensor_3']?.toStringAsFixed(1)}°C',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),

                        // Bottom Sensors (4 and 5)
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Sensor_4\n${data.sensorTemperatures['Sensor_4']?.toStringAsFixed(1)}°C',
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                'Sensor_5\n${data.sensorTemperatures['Sensor_5']?.toStringAsFixed(1)}°C',
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
