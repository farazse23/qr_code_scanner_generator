import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQrCode extends StatefulWidget {
  const GenerateQrCode({super.key});

  @override
  State<GenerateQrCode> createState() => _GenerateQrCodeState();
}

class _GenerateQrCodeState extends State<GenerateQrCode> {
  final TextEditingController _controller = TextEditingController();
  bool _hasContent = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text("Generate QR", style: TextStyle(color: Colors.black87)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // QR Display Card
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    if (_hasContent)
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent.withOpacity(0.3)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: QrImageView(
                          data: _controller.text,
                          size: 180,
                          backgroundColor: Colors.white,
                        ),
                      )
                    else
                      Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.qr_code_2,
                          size: 60,
                          color: Colors.grey,
                        ),
                      ),
                    const SizedBox(height: 20),
                    Text(
                      _hasContent ? "Your QR Code" : "Enter content to generate QR",
                      style: TextStyle(
                        fontSize: 16,
                        color: _hasContent ? Colors.blueAccent : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 32),

            // Input Card
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    labelText: "Enter URL or text",
                    hintText: "https://example.com",
                    labelStyle: TextStyle(color: Colors.grey[700]),
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.text_fields, color: Colors.grey[700]),
                    suffixIcon: _hasContent
                        ? IconButton(
                      icon: Icon(Icons.clear, color: Colors.grey[700]),
                      onPressed: () {
                        _controller.clear();
                        setState(() => _hasContent = false);
                      },
                    )
                        : null,
                  ),
                  onChanged: (value) => setState(() => _hasContent = value.isNotEmpty),
                  onSubmitted: (_) => setState(() {}),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Generate Button
            ElevatedButton(
              onPressed: _hasContent ? () => setState(() {}) : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
              ),
              child: const Text(
                "Generate QR Code",
                style: TextStyle(fontSize: 16),
              ),
            ),

            if (_hasContent) ...[
              const SizedBox(height: 24),
              OutlinedButton.icon(
                onPressed: () {
                  // Save/share functionality
                },
                icon: const Icon(Icons.share, color: Colors.blueAccent),
                label: const Text("Share QR Code", style: TextStyle(color: Colors.blueAccent)),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  side: const BorderSide(color: Colors.blueAccent),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}