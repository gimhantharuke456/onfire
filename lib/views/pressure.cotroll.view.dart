import 'package:flutter/material.dart';

class PressureControlView extends StatefulWidget {
  const PressureControlView({super.key});

  @override
  State<PressureControlView> createState() => _PressureControlViewState();
}

class _PressureControlViewState extends State<PressureControlView> {
  bool nozzle1 = true;
  bool nozzle2 = false;
  bool waterSwitch = true;
  bool foamSwitch = false;
  bool co2Switch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
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
                    value: nozzle1,
                    onChanged: (value) {
                      setState(() {
                        nozzle1 = value;
                        if (value) nozzle2 = false;
                      });
                    },
                  ),
                  _NozzleColumn(
                    label: 'OFF',
                    value: nozzle2,
                    onChanged: (value) {
                      setState(() {
                        nozzle2 = value;
                        if (value) nozzle1 = false;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 80),
              const Text(
                'Nozzle Output',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
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
                color: Color(0xFFE57373), // Light red color
                onChanged: (value) {
                  setState(() => foamSwitch = value);
                },
              ),
              const SizedBox(height: 24),
              _OutputSwitch(
                label: 'CO2',
                value: co2Switch,
                color: Color(0xFF7986CB), // Purple-blue color
                onChanged: (value) {
                  setState(() => co2Switch = value);
                },
              ),
            ],
          ),
        ),
      ),
    );
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
          style: TextStyle(
            fontSize: 24,
            color: Color(0xFFFF5722),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 16),
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: Color(0xFF7986CB),
          activeTrackColor: Color(0xFF7986CB).withOpacity(0.4),
          inactiveThumbColor: Color(0xFF7986CB),
          inactiveTrackColor: Color(0xFF7986CB).withOpacity(0.4),
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
