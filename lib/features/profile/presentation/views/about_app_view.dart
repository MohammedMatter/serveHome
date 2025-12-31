import 'package:flutter/material.dart';

class AboutAppView extends StatelessWidget {
  const AboutAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FA),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 35),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xff5B86E5), Color(0xff36D1DC)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                children: const [
                  Icon(Icons.apps, size: 70, color: Colors.white),
                  SizedBox(height: 10),
                  Text(
                    "Serve Home",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Smart Services Platform",
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                  const SizedBox(height: 10),

                  _textBlock(
                    "Serve Home is a modern platform that helps users manage and request home services smoothly and efficiently. "
                    "The application was designed with a focus on simplicity, safety, and high-quality user experience.",
                  ),

                  const SizedBox(height: 25),

                  Text(
                    "Developer",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                  const SizedBox(height: 10),

                  _infoTile("Name", "Mohammed Abu Matar"),
                  const SizedBox(height: 8),
                  _infoTile("Email", "support@servehome.com"),
                  const SizedBox(height: 8),
                  _infoTile("Phone", "05995541004"),

                  const SizedBox(height: 25),

                  Text(
                    "Version",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                  const SizedBox(height: 10),

                  _infoTile("App Version", "1.0.0"),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _textBlock(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 15, height: 1.5, color: Colors.black87),
    );
  }

  Widget _infoTile(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Text(
            "$label:",
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 15, color: Colors.grey[700]),
            ),
          ),
        ],
      ),
    );
  }
}
