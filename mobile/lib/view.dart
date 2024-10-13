import 'package:flutter/material.dart';

class TrashReportPage extends StatelessWidget {
  final String path;
  final String reportId;
  final String reportDate;
  final List<TrashInfoSection> sections;

  const TrashReportPage({
    super.key,
    required this.path,
    required this.reportId,
    required this.reportDate,
    required this.sections,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trash Report', style: TextStyle(fontSize: 16)), // Smaller font size
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0), // Reduced horizontal padding
        child: ListView(
          children: [
            // Image with overlay
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0), // Reduced radius
                  child: Image.asset(
                    path,
                    width: double.infinity,
                    height: 160, // Reduced height
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 8,
                  left: 8,
                  child: Container(
                    color: Colors.black54,
                    padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4), // Reduced padding
                    child: Text(
                      'ID: $reportId | Date: $reportDate',
                      style: const TextStyle(color: Colors.white, fontSize: 14), // Smaller font size
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10), // Reduced spacing

            // Update this report text
            const Text(
              'Update this report',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black), // Smaller font size
            ),
            const SizedBox(height: 10), // Reduced spacing

            // CLEANED Button
            ElevatedButton(
              onPressed: () {
                // Handle CLEANED action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF8ACE00), // Using your color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), // Reduced radius
                ),
                padding: const EdgeInsets.symmetric(vertical: 6), // Reduced vertical padding
              ),
              child: const Text(
                'CLEANED',
                style: TextStyle(fontSize: 14, color: Colors.black), // Smaller font size
              ),
            ),
            const SizedBox(height: 10), // Reduced spacing

            // STILL THERE Button
            ElevatedButton(
              onPressed: () {
                // Handle STILL THERE action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), // Reduced radius
                ),
                padding: const EdgeInsets.symmetric(vertical: 6), // Reduced vertical padding
              ),
              child: const Text(
                'STILL THERE',
                style: TextStyle(fontSize: 14, color: Colors.black), // Smaller font size
              ),
            ),
            const SizedBox(height: 20), // Reduced spacing

            // Information section title
            const Text(
              'Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black), // Smaller font size
            ),
            const SizedBox(height: 10), // Reduced spacing

            // Information sections
            Column(
              children: sections.map((section) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.0), // Reduced radius
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 4.0), // Reduced vertical margin
                  padding: const EdgeInsets.all(8.0), // Slightly reduced padding
                  child: Row(
                    children: [
                      Icon(
                        section.icon,
                        size: 36, // Smaller icon size
                      ),
                      const SizedBox(width: 6), // Reduced space between icon and text
                      Expanded( // To take up available space
                        child: Text(
                          section.text,
                          style: const TextStyle(fontSize: 14, color: Colors.black), // Smaller font size
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 12), // Reduced spacing

            const Text(
              'Cleaning Events',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black), // Smaller font size
            ),
            const SizedBox(height: 10), // Reduced spacing
            const Text(
              'No cleaning events yet',
              style: TextStyle(fontSize: 14, color: Colors.black), // Smaller font size
            ),
            const SizedBox(height: 10), // Reduced spacing

            // ADD EVENT Button
            ElevatedButton(
              onPressed: () {
                // Handle ADD EVENT action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF8ACE00), // Using your color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), // Reduced radius
                ),
                padding: const EdgeInsets.symmetric(vertical: 6), // Reduced vertical padding
              ),
              child: const Text(
                'ADD EVENT',
                style: TextStyle(fontSize: 14, color: Colors.black), // Smaller font size
              ),
            ),
            const SizedBox(height: 20), // Reduced spacing

            const Text(
              "Share this report",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black), // Smaller font size
            ),
            const SizedBox(height: 10), // Reduced spacing
            const Text(
              "Send to local authorities or environmental NGOs",
              style: TextStyle(fontSize: 14, color: Colors.black), // Smaller font size
            ),
            const SizedBox(height: 10), // Reduced spacing

            // SEND NOTIFICATION Button
            ElevatedButton(
              onPressed: () {
                // Handle SEND NOTIFICATION action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF8ACE00), // Using your color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), // Reduced radius
                ),
                padding: const EdgeInsets.symmetric(vertical: 6), // Reduced vertical padding
              ),
              child: const Text(
                'SEND NOTIFICATION',
                style: TextStyle(fontSize: 14, color: Colors.black), // Smaller font size
              ),
            ),
            const SizedBox(height: 20), // Reduced spacing

            const Text(
              "Report Spam",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black), // Smaller font size
            ),
            const SizedBox(height: 10), // Reduced spacing
            const Text(
              "Report this report as spam",
              style: TextStyle(fontSize: 14, color: Colors.black), // Smaller font size
            ),
            const SizedBox(height: 10), // Reduced spacing

            // REPORT SPAM Button
            ElevatedButton(
              onPressed: () {
                // Handle REPORT SPAM action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), // Reduced radius
                ),
                padding: const EdgeInsets.symmetric(vertical: 6), // Reduced vertical padding
              ),
              child: const Text(
                'REPORT SPAM',
                style: TextStyle(fontSize: 14, color: Colors.black), // Smaller font size
              ),
            ),
            const SizedBox(height: 20), // Reduced spacing
          ],
        ),
      ),
    );
  }
}

class TrashInfoSection {
  final IconData icon;
  final String text;

  const TrashInfoSection({
    required this.icon,
    required this.text,
  });
}
