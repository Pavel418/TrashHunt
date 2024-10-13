import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:junction_project/view.dart';
import 'package:latlong2/latlong.dart';

class TrashMap extends StatefulWidget {
  const TrashMap({super.key});

  @override
  State<TrashMap> createState() => _TrashMapState();
}

class _TrashMapState extends State<TrashMap>
    with SingleTickerProviderStateMixin {
  final StreamController<void> _rebuildStream = StreamController.broadcast();
  List<LatLng> points = [];
  List<LatLng> recyclePoints = [
    const LatLng(40.378150, 49.822627),
    const LatLng(40.420934, 49.920265),
    const LatLng(40.472945, 49.832598),
    const LatLng(40.420785, 49.809462),
    const LatLng(40.477687, 49.912034)
  ];

  var index = 0;
  bool isModalOpen = false;
  String modalName = "";
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _loadData();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 150));
  }

  @override
  void dispose() {
    _rebuildStream.close();
    _animationController.dispose();
    super.dispose();
  }

  _loadData() async {
    var str = await rootBundle.loadString('assets/points.json');
    List<dynamic> result = jsonDecode(str);

    setState(() {
      points = result
          .map((e) => e as List<dynamic>)
          .map((e) => LatLng(e[0], e[1]))
          .toList();
    });
  }

  void _toggleModal(String name) {
    if (isModalOpen) {
      _animationController.reverse().then((value) {
        setState(() {
          isModalOpen = false;
          modalName = "";
        });
      });
    } else {
      setState(() {
        modalName = name;
        isModalOpen = true;
      });
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _rebuildStream.add(null);
    });

    final random = Random();
    final imageId = random.nextInt(4) + 1;

    var pointMarkers = points
        .map((e) => Marker(
              width: 40,
              height: 40,
              point: e,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          TrashReportPage(
                        path: 'assets/images/$imageId.jpg',
                        reportId: random.nextInt(10000).toString(),
                        reportDate: '2024-10-12',
                        sections: const [
                          TrashInfoSection(
                              icon: Icons.inventory_2, text: 'Large'),
                          TrashInfoSection(
                              icon: Icons.local_drink, text: 'Plastic'),
                          TrashInfoSection(icon: Icons.settings, text: 'Metal'),
                        ],
                      ),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        return FadeTransition(
                          opacity: animation,
                          child: child,
                        );
                      },
                    ),
                  );
                },
                child: const Icon(
                  Icons.delete,
                  size: 30,
                ),
              ),
            ))
        .toList();

    final recycleMarkers = recyclePoints.map((e) => Marker(
          width: 40,
          height: 40,
          point: e,
          child: const Icon(
            Icons.recycling,
            size: 40,
            color: Color.fromARGB(255, 31, 246, 38),
            shadows: [
              Shadow(
                offset: Offset(0, 0),
                blurRadius: 5.0,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ],
          ),
        ));

    final map = FlutterMap(
      options: const MapOptions(
        initialCenter: LatLng(40.409264, 49.867092),
        initialZoom: 11.5,
        interactionOptions: InteractionOptions(
            flags: InteractiveFlag.all & ~InteractiveFlag.rotate),
      ),
      children: [
        TileLayer(
            urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png"),
        MarkerLayer(
          markers: [
            ...pointMarkers,
            ...recycleMarkers,
          ],
        )
      ],
    );

    return Center(
      child: Stack(
        children: [
          Container(child: map),
          // Animated modal appearance using Fade and Scale
          if (isModalOpen)
            GestureDetector(
              onTap: () => _toggleModal(""),
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Stack(
                    children: [
                      // Fade animation for background overlay
                      AnimatedOpacity(
                        opacity: _animationController.value,
                        duration: const Duration(milliseconds: 150),
                        child: Container(
                          color: Colors.black54,
                        ),
                      ),
                      // Scale animation for modal
                      Center(
                        child: AnimatedScale(
                          scale: _animationController.value,
                          duration: const Duration(milliseconds: 150),
                          child: Container(
                            width: 250,
                            height: 400,
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 10,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.close),
                                      onPressed: () => _toggleModal(""),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            )
        ],
      ),
    );
  }
}
