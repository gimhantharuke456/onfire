import 'package:flutter/material.dart';

class FireReasonsView extends StatelessWidget {
  const FireReasonsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
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
                value: true,
                onChanged: (value) {},
              ),
              const SizedBox(height: 24),
              _FireTypeSwitch(
                label: 'B Type Of Fire',
                color: Color(0xFFFF9E80),
                value: false,
                onChanged: (value) {},
              ),
              const SizedBox(height: 24),
              _FireTypeSwitch(
                label: 'C Type Of Fire',
                color: Color(0xFF7986CB),
                value: false,
                onChanged: (value) {},
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
                value: '80.7',
              ),
              const SizedBox(height: 24),
              _EnvironmentDataRow(
                label: 'Humidity',
                value: '33.7',
              ),
              const SizedBox(height: 24),
              _EnvironmentDataRow(
                label: 'CO level',
                value: '164.2',
              ),
              const SizedBox(height: 24),
              _EnvironmentDataRow(
                label: 'LPG Level',
                value: '304.2',
              ),
            ],
          ),
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
