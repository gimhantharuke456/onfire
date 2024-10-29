import 'package:flutter/material.dart';
import 'package:onfire/models/fire.detection.model.dart';
import 'package:onfire/models/fire.detection.service.dart';

class PressureControlView extends StatefulWidget {
  const PressureControlView({super.key});

  @override
  State<PressureControlView> createState() => _PressureControlViewState();
}

class _PressureControlViewState extends State<PressureControlView> {
  final FireDetectionService _fireDetectionService = FireDetectionService();
  bool waterSwitch = true;
  bool foamSwitch = false;
  bool co2Switch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: StreamBuilder<List<FireDetectionData>>(
          stream: _fireDetectionService.getFireDetectionStream(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Errors: ${snapshot.error}'));
            }

            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }

            final fireData = snapshot.data!.first;
            final isNozzleOn = fireData.nozzleStatus == "ON";

            return Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Nozzle',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 48),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _NozzleColumn(
                        label: 'ON',
                        value: isNozzleOn,
                        onChanged: (value) {
                          if (value) {
                            _fireDetectionService.updateNozzleStatus(
                                fireData.id, "ON");
                          }
                        },
                      ),
                      _NozzleColumn(
                        label: 'OFF',
                        value: !isNozzleOn,
                        onChanged: (value) {
                          if (value) {
                            _fireDetectionService.updateNozzleStatus(
                                fireData.id, "OFF");
                          }
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 80),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Nozzle Output',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Severity: ${fireData.severityLabel}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: _getSeverityColor(fireData.severityLabel),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 48),
                  _OutputSwitch(
                    label: 'Water',
                    value: waterSwitch,
                    color: Colors.blue,
                    onChanged: (value) {
                      setState(() => waterSwitch = value);
                    },
                  ),
                  const SizedBox(height: 24),
                  _OutputSwitch(
                    label: 'Foam',
                    value: foamSwitch,
                    color: const Color(0xFFE57373),
                    onChanged: (value) {
                      setState(() => foamSwitch = value);
                    },
                  ),
                  const SizedBox(height: 24),
                  _OutputSwitch(
                    label: 'CO2',
                    value: co2Switch,
                    color: const Color(0xFF7986CB),
                    onChanged: (value) {
                      setState(() => co2Switch = value);
                    },
                  ),
                  const SizedBox(height: 32),
                  Text(
                    'Distance to Fire: ${fireData.distanceToFire.toStringAsFixed(2)} meters',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Last Updated: ${fireData.timestamp}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
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

  Color _getSeverityColor(String severity) {
    switch (severity.toLowerCase()) {
      case 'low':
        return Colors.green;
      case 'medium':
        return Colors.orange;
      case 'high':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}

class _NozzleColumn extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _NozzleColumn({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 24,
            color: Color(0xFFFF5722),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 16),
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: const Color(0xFF7986CB),
          activeTrackColor: const Color(0xFF7986CB).withOpacity(0.4),
          inactiveThumbColor: const Color(0xFF7986CB),
          inactiveTrackColor: const Color(0xFF7986CB).withOpacity(0.4),
        ),
      ],
    );
  }
}

class _OutputSwitch extends StatelessWidget {
  final String label;
  final bool value;
  final Color color;
  final ValueChanged<bool> onChanged;

  const _OutputSwitch({
    required this.label,
    required this.value,
    required this.color,
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
            color: color,
            fontWeight: FontWeight.w500,
          ),
        ),
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: color,
          activeTrackColor: color.withOpacity(0.4),
          inactiveThumbColor: Colors.grey,
          inactiveTrackColor: Colors.grey.withOpacity(0.4),
        ),
      ],
    );
  }
}
