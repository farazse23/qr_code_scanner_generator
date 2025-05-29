import 'package:flutter/material.dart';
import 'package:qr_code_scanner_generator/generate_qr_code.dart';
import 'package:qr_code_scanner_generator/scan_qr_code.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF6A11CB),
              Color(0xFF2575FC),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                // Header Section
                const SizedBox(height: 40),
                const Text(
                  'QR Toolkit',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Scan or generate QR codes instantly',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
                const SizedBox(height: 40),

                // Illustration
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage("assets/QR.jpg"),
                      fit: BoxFit.contain,
                    ),
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                const SizedBox(height: 60),

                // Action Buttons
                _buildActionButton(
                  context,
                  icon: Icons.qr_code_scanner,
                  label: "Scan QR Code",
                  color: Colors.white,
                  textColor: Colors.blueAccent,
                  destination: const ScanQrCode(),
                ),
                const SizedBox(height: 16),
                _buildActionButton(
                  context,
                  icon: Icons.qr_code_2,
                  label: "Generate QR Code",
                  color: Colors.white,
                  textColor: Colors.blueAccent,
                  destination: const GenerateQrCode(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(
      BuildContext context, {
        required IconData icon,
        required String label,
        required Color color,
        required Color textColor,
        required Widget destination,
      }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destination),
        ),
        style: ElevatedButton.styleFrom(
          foregroundColor: textColor,
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 4,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 24),
            const SizedBox(width: 12),
            Text(
              label,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}