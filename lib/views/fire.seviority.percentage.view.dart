import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class FireSeverityPercentageView extends StatelessWidget {
  const FireSeverityPercentageView({super.key});

  @override
  Widget build(BuildContext context) {
    // Fire severity value to display in the center (e.g., 0.2 for 20%)
    const double severityValue = 0.2;

    return Scaffold(
      appBar: AppBar(
        title: Text("Fire Severity percentage"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Fire Severity Percentage',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            CircularPercentIndicator(
              radius: 120.0,
              lineWidth: 20.0,
              percent: severityValue,
              center: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Severity',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${(severityValue * 100).toInt()}%',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              progressColor: Colors.purple, // Adjust color to match image
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
