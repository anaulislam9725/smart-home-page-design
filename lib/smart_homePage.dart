import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home_page_design/util/smart_device_box.dart';

class SmartHomepage extends StatefulWidget {
  const SmartHomepage({super.key});

  @override
  State<SmartHomepage> createState() => _SmartHomepageState();
}

class _SmartHomepageState extends State<SmartHomepage> {
  final double horizontalPadding = 40;
  final double verticalPadding = 40;
  List mySmartDevices = [
    ["Smart Light", "assets/image1.png", true],
    ["Smart Ac", "assets/image2.png", false],
    ["Smart Tv", "assets/image6.png", false],
    ["Smart Fan", "assets/image3.png", false],
  ];
  // nestetList er khetre dhorte hoy [index][0]mane name gulo[1]mane image [2]mane true/false

  void powerSwichChenged(bool value, int index) {
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/image5.png",
                    height: 45,
                    color: Colors.grey.shade800,
                  ),
                  Icon(Icons.person, size: 45, color: Colors.grey.shade800),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome home",
                    style: TextStyle(fontSize: 20, color: Colors.grey[700]),
                  ),
                  Text(
                    "MITCH KOKO",
                    style: GoogleFonts.bebasNeue(fontSize: 72),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Divider(color: Colors.grey[400], thickness: 1),
            ),
            SizedBox(height: 25),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Text(
                "Smart Devices",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.grey[800],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.all(25),
                itemCount: mySmartDevices.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.3,
                ),
                itemBuilder: (context, index) {
                  return SmartDevice(
                    smartDeviceName: mySmartDevices[index][0],
                    iconPath: mySmartDevices[index][1],
                    powerOn: mySmartDevices[index][2],
                    onChanged: (value) => powerSwichChenged(value, index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
