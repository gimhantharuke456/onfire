import 'package:flutter/material.dart';
import 'package:onfire/models/fire.data.dart';
import 'package:onfire/services/fire.data.service.dart';

class FireReasonsView extends StatelessWidget {
  const FireReasonsView({super.key});

  @override
  Widget build(BuildContext context) {
    final _fireDataService = FireDataService();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: StreamBuilder<FireData?>(
          stream: Stream.periodic(const Duration(seconds: 1))
              .asyncMap((_) => _fireDataService.getLatestFireData()),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            final fireData = snapshot.data!;
            print(fireData.fireType);
            return SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Identify Fire Types',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 48),
                  _FireTypeSwitch(
                    label: 'A Type Of Fire',
                    color: Color(0xFFFF5722),
                    value: fireData.fireType == 'Type A',
                    onChanged: (_) {},
                  ),
                  const SizedBox(height: 24),
                  _FireTypeSwitch(
                    label: 'B Type Of Fire',
                    color: Color(0xFFFF9E80),
                    value: fireData.fireType == 'Type B',
                    onChanged: (_) {},
                  ),
                  const SizedBox(height: 24),
                  _FireTypeSwitch(
                    label: 'C Type Of Fire',
                    color: Color(0xFF7986CB),
                    value: fireData.fireType == 'Type C',
                    onChanged: (_) {},
                  ),
                  const SizedBox(height: 24),
                  _FireTypeSwitch(
                    label: 'Unknown',
                    color: Color(0xFFFF5722),
                    value: fireData.fireType == 'Unknown',
                    onChanged: (_) {},
                  ),
                  const SizedBox(height: 48),
                  const Text(
                    'Environment Data',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 32),
                  _EnvironmentDataRow(
                    label: 'Temperature',
                    value: fireData.temperature.toStringAsFixed(1),
                  ),
                  const SizedBox(height: 24),
                  _EnvironmentDataRow(
                    label: 'Humidity',
                    value: fireData.humidity.toStringAsFixed(1),
                  ),
                  const SizedBox(height: 24),
                  _EnvironmentDataRow(
                    label: 'CO level',
                    value: fireData.coLevel.toStringAsFixed(1),
                  ),
                  const SizedBox(height: 24),
                  _EnvironmentDataRow(
                    label: 'LPG Level',
                    value: fireData.lpgLevel.toStringAsFixed(1),
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

class _FireTypeSwitch extends StatelessWidget {
  final String label;
  final Color color;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _FireTypeSwitch({
    required this.label,
    required this.color,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: color,
          ),
        ),
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: color,
          activeTrackColor: color.withOpacity(0.3),
        ),
      ],
    );
  }
}

class _EnvironmentDataRow extends StatelessWidget {
  final String label;
  final String value;

  const _EnvironmentDataRow({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 24,
            color: Colors.black87,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
