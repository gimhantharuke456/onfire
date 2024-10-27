import 'package:flutter/material.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/img1.png',
              fit: BoxFit.cover,
            ),
          ),
          // Semi-transparent overlay
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.3),
            ),
          ),
          // Content
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                const Text(
                  'About OnFire',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                _buildSectionTitle('Mission'),
                const SizedBox(height: 10),
                _buildSectionContent(
                  'At OnFire, we aim to revolutionize fire safety through advanced detection and response systems that protect lives and prevent disasters.',
                ),
                const SizedBox(height: 20),
                _buildSectionTitle('Vision'),
                const SizedBox(height: 10),
                _buildSectionContent(
                  'We strive for a future where fire incidents are minimized with intelligent, real-time solutions for quick and effective responses.',
                ),
                const SizedBox(height: 20),
                _buildSectionTitle('Our Story'),
                const SizedBox(height: 10),
                _buildSectionContent(
                  'Founded by a passionate team of researchers and engineers, OnFire was born from the desire to close the gaps in traditional fire safety systems. We\'ve developed a comprehensive platform that identifies fire types, tracks severity, controls nozzles, and aids in evacuation planning.',
                ),
                const SizedBox(height: 20),
                _buildSectionTitle('About Team'),
                const SizedBox(height: 10),
                _buildSectionContent(
                  'Our dedicated team combines expertise in fire safety, technology, and engineering to deliver reliable and innovative solutions.',
                ),
                const SizedBox(height: 20),
                _buildSectionTitle('Future Goals'),
                const SizedBox(height: 10),
                _buildSectionContent(
                  'We’re continuously enhancing OnFire’s capabilities, aiming to lead in global fire safety innovation.',
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildSectionContent(String content) {
    return Text(
      content,
      style: const TextStyle(
        fontSize: 16,
        color: Colors.white,
      ),
      textAlign: TextAlign.center,
    );
  }
}
