import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();
  String selectedSize = '';
  String selectedTrashType = '';

  // Example data for trash types and sizes
  final trashSizes = [
    {'icon': Icons.crop_square, 'label': 'Small'},
    {'icon': Icons.crop_din, 'label': 'Medium'},
    {'icon': Icons.crop_16_9, 'label': 'Large'}
  ];

  final trashTypes = [
    {
      'icon': Icons.local_drink,
      'label': 'Plastic'
    }, // Changed to local_drink for plastic bottles
    {
      'icon': Icons.settings,
      'label': 'Metal'
    }, // Changed to settings for metal tools
    {
      'icon': Icons.local_bar,
      'label': 'Glass'
    }, // Changed to local_bar for glass bottles
    {
      'icon': Icons.description,
      'label': 'Paper'
    }, // Kept as description for paper documents
    {'icon': Icons.eco, 'label': 'Organic'}, // Changed to eco for organic waste
    {
      'icon': Icons.devices,
      'label': 'Electronics'
    }, // Changed to devices for electronic devices
    {'icon': Icons.nature, 'label': 'Wood'}, // Changed to nature for wood
    {
      'icon': Icons.checkroom,
      'label': 'Textile'
    }, // Changed to checkroom for clothes
    {
      'icon': Icons.sports_handball,
      'label': 'Rubber'
    }, // Changed to sports_handball for rubber balls
    {
      'icon': Icons.battery_alert,
      'label': 'Batteries'
    }, // Changed to battery_alert for batteries
    {
      'icon': Icons.build,
      'label': 'Construction'
    }, // Changed to build for construction tools
    {
      'icon': Icons.warning,
      'label': 'Hazardous'
    }, // Kept as warning for hazardous materials
    {
      'icon': Icons.fastfood,
      'label': 'Food'
    }, // Kept as fastfood for food waste
    {
      'icon': Icons.category,
      'label': 'Mixed'
    }, // Kept as category for mixed waste
    {
      'icon': Icons.help_outline,
      'label': 'Other'
    }, // Kept as help_outline for other types
  ];

  @override
  void initState() {
    super.initState();
    _openCamera();
  }

  Future<void> _openCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _imageFile = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _imageFile == null
          ? const Text('No image taken',
              textAlign: TextAlign.center, style: TextStyle(fontSize: 24))
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  // Image preview
                  // Image.file(_imageFile!,
                  //     width: double.infinity, height: 200, fit: BoxFit.cover),
                  Image.asset("assets/images/5.jpg",
                      width: double.infinity, height: 200, fit: BoxFit.cover),
                  const SizedBox(height: 16),
                  // Title
                  const Text(
                    'Select Trash Size',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),

                  // Row of buttons for selecting size
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: trashSizes.map((size) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedSize = size['label']!.toString();
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: selectedSize == size['label']
                                ? Colors.blueAccent
                                : Colors.grey[300],
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            children: [
                              Icon(
                                size['icon']! as IconData,
                                size: 40,
                                color: selectedSize == size['label']
                                    ? Colors.white
                                    : Colors.black,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                size['label']!.toString(),
                                style: TextStyle(
                                  color: selectedSize == size['label']
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 32),

                  // Title
                  const Text(
                    'Select Trash Type',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),

                  // Grid of buttons for selecting trash type
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 1,
                    ),
                    itemCount: trashTypes.length,
                    itemBuilder: (context, index) {
                      final type = trashTypes[index];
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedTrashType = type['label']! as String;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: selectedTrashType == type['label']
                                ? Colors.blueAccent
                                : Colors.grey[300],
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                type['icon']! as IconData,
                                size: 40,
                                color: selectedTrashType == type['label']
                                    ? Colors.white
                                    : Colors.black,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                type['label']!.toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: selectedTrashType == type['label']
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 32),

                  // Trash Accessibility
                  const Text(
                    'Trash Accessibility',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        // Sliding buttons for accessibility options
                        _buildSlidingButton('Reachable by car'),
                        _buildSlidingButton('Under Water / On Water'),
                        _buildSlidingButton('Located in a cave'),
                      ],
                    ),
                  ),

                  // Description field
                  const Text(
                    'Description',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter a brief description of the trash',
                    ),
                    maxLines: 4,
                  ),
                  const SizedBox(height: 32),

                  // Submit Button
                  ElevatedButton(
                    onPressed: () {
                      // Handle form submission
                    },
                    child: const Text('Submit Report',
                        style: TextStyle(fontSize: 20)),
                  ),

                  const SizedBox(height: 32),
                ],
              ),
            ),
    );
  }

  Widget _buildSlidingButton(String label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        Switch(
          value: false,
          onChanged: (bool value) {},
        ),
      ],
    );
  }
}
