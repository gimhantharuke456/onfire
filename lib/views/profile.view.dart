import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            // Profile Image
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                  'assets/img1.png'), // Replace with actual image path
            ),
            const SizedBox(height: 16),
            // Name Title
            const Text(
              'STUART KEARNS',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 8),
            // Horizontal line divider
            Divider(
              color: Colors.black,
              thickness: 1.5,
              indent: 30,
              endIndent: 30,
            ),
            const SizedBox(height: 16),
            // Details label
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Details',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Name Field
            _buildDetailField(
              labelText: 'Stuart Kearns',
              icon: Icons.check_circle,
            ),
            const SizedBox(height: 10),
            // Email Field
            _buildDetailField(
              labelText: 'test@gmail.com',
              icon: Icons.check_circle,
            ),
            const SizedBox(height: 20),
            // Shipping Details label
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Shipping Details',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Address Field
            _buildAddressField(),
            const SizedBox(height: 10),
            // Zip Code and Location
            Row(
              children: [
                Expanded(
                  child: _buildDetailField(
                    labelText: '1234564',
                    icon: null,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _buildDetailField(
                    labelText: 'Hong Kong',
                    icon: null,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailField({required String labelText, IconData? icon}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300, width: 1.5),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              labelText,
              style: TextStyle(
                fontSize: 16,
                color: icon != null ? Colors.black : Colors.grey,
                fontWeight: icon != null ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
          if (icon != null)
            Icon(
              icon,
              color: Colors.green,
            ),
        ],
      ),
    );
  }

  Widget _buildAddressField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300, width: 1.5),
        borderRadius: BorderRadius.circular(24),
      ),
      child: const Text(
        'Abc street, 123. Hong Kong',
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey,
        ),
      ),
    );
  }
}
