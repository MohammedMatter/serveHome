import 'package:flutter/material.dart';
import 'package:serve_home/core/helpers/screen_size.dart';

class AboutAppView extends StatelessWidget {
  const AboutAppView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = ScreenSize.w(context);
    final screenHeight = ScreenSize.h(context);

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
              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.05),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xff5B86E5), Color(0xff36D1DC)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                children: [
                  Icon(Icons.apps, size: screenWidth * 0.18, color: Colors.white),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    "Serve Home",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.06,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  Text(
                    "Smart Services Platform",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: screenWidth * 0.035,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: screenHeight * 0.03),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About",
                    style: TextStyle(
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  _textBlock(
                    "Serve Home is a modern platform that helps users manage and request home services smoothly and efficiently. "
                    "The application was designed with a focus on simplicity, safety, and high-quality user experience.",
                    screenWidth,
                  ),

                  SizedBox(height: screenHeight * 0.03),

                  Text(
                    "Developer",
                    style: TextStyle(
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  _infoTile("Name", "Mohammed Abu Matar", screenWidth),
                  SizedBox(height: screenHeight * 0.01),
                  _infoTile("Email", "support@servehome.com", screenWidth),
                  SizedBox(height: screenHeight * 0.01),
                  _infoTile("Phone", "05995541004", screenWidth),

                  SizedBox(height: screenHeight * 0.03),

                  Text(
                    "Version",
                    style: TextStyle(
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  _infoTile("App Version", "1.0.0", screenWidth),

                  SizedBox(height: screenHeight * 0.05),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _textBlock(String text, double screenWidth) {
    return Text(
      text,
      style: TextStyle(
        fontSize: screenWidth * 0.04,
        height: 1.5,
        color: Colors.black87,
      ),
    );
  }

  Widget _infoTile(String label, String value, double screenWidth) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.035,
        vertical: screenWidth * 0.035,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(screenWidth * 0.03),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Text(
            "$label:",
            style: TextStyle(
              fontSize: screenWidth * 0.04,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          SizedBox(width: screenWidth * 0.025),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: screenWidth * 0.04,
                color: Colors.grey[700],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
