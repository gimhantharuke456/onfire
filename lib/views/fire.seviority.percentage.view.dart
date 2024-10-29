import 'package:flutter/material.dart';
import 'package:onfire/models/fire.detection.model.dart';
import 'package:onfire/models/fire.detection.service.dart';
import 'package:percent_indicator/percent_indicator.dart';

class FireSeverityPercentageView extends StatelessWidget {
  const FireSeverityPercentageView({super.key});

  @override
  Widget build(BuildContext context) {
    final _fireDetectionService = FireDetectionService();

    return Scaffold(
      appBar: AppBar(
        title: Text("Fire Severity Percentage"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: StreamBuilder<List<FireDetectionData>>(
          stream: _fireDetectionService.getFireDetectionStream(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No fire detection data available'));
            }

            // Here we take the first data item for simplicity
            final fireData = snapshot.data!.first;
            print("Fire Data ${fireData.severityValue}");
            final severityValue = fireData.severityValue / 100.0;

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Fire Severity Percentage',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                CircularPercentIndicator(
                  radius: 120.0,
                  lineWidth: 20.0,
                  percent:
                      severityValue.clamp(0.0, 1.0), // Ensure within bounds
                  center: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Severity',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${(severityValue * 100).toInt()}%',
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  progressColor: Colors.purple,
                  backgroundColor: Colors.grey[300]!,
                  circularStrokeCap: CircularStrokeCap.round,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('75%', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('0%', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('25%', style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  'Fire Severity Level',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildSeverityIndicator(Colors.green, 'Low'),
                    const SizedBox(width: 20),
                    _buildSeverityIndicator(Colors.orange, 'Medium'),
                    const SizedBox(width: 20),
                    _buildSeverityIndicator(Colors.red, 'High'),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildSeverityIndicator(Color color, String label) {
    return Column(
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Icon(
              Icons.circle,
              color: Colors.white,
              size: 15,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
