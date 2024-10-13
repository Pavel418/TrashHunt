import 'dart:math';
import 'package:flutter/material.dart';
import 'package:junction_project/map.dart';
import 'package:junction_project/profile.dart';
import 'package:junction_project/add.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sick Tree',
      theme: ThemeData(
        colorScheme: const ColorScheme(
          brightness: Brightness.light, // Set brightness
          primary: Color(0xFF8ACE00), // Primary color
          onPrimary: Colors.black, // Text color on primary
          primaryContainer: Color(0xFF6FA300), // Primary container color
          onPrimaryContainer: Colors.white, // Text color on primary container
          secondary: Color(0xFFBFFF50), // Secondary color
          onSecondary: Colors.black, // Text color on secondary
          secondaryContainer: Color(0xFFD3FF88), // Secondary container color
          onSecondaryContainer:
              Colors.black, // Text color on secondary container
          error: Colors.red, // Error color
          onError: Colors.white, // Text color on error
          surface: Colors.white, // Surface color
          onSurface: Colors.black, // Text color on surface
          background: Color(0xFFF5F5F5), // Background color
          onBackground: Colors.black, // Text color on background
          // Optional fields:
          // tertiary: const Color(0xFFsomeColor),
          // onTertiary: Colors.black,
          // errorContainer: Colors.redAccent,
          // onErrorContainer: Colors.white,
          // outline: Colors.grey,
          // shadow: Colors.black.withOpacity(0.5),
          // etc...
        ),
        fontFamily: 'Now', // Set the default font
        textTheme: const TextTheme(
          displayLarge: TextStyle(
              fontFamily: 'Now', fontSize: 57, fontWeight: FontWeight.bold),
          displayMedium: TextStyle(
              fontFamily: 'Now', fontSize: 45, fontWeight: FontWeight.bold),
          displaySmall: TextStyle(
              fontFamily: 'Now', fontSize: 36, fontWeight: FontWeight.bold),
          headlineLarge: TextStyle(
              fontFamily: 'Now', fontSize: 32, fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(
              fontFamily: 'Now', fontSize: 28, fontWeight: FontWeight.w600),
          headlineSmall: TextStyle(
              fontFamily: 'Now', fontSize: 24, fontWeight: FontWeight.w600),
          titleLarge: TextStyle(
              fontFamily: 'Now', fontSize: 22, fontWeight: FontWeight.w500),
          titleMedium: TextStyle(
              fontFamily: 'Now', fontSize: 16, fontWeight: FontWeight.w500),
          titleSmall: TextStyle(
              fontFamily: 'Now', fontSize: 14, fontWeight: FontWeight.w500),
          bodyLarge: TextStyle(
              fontFamily: 'Now', fontSize: 16, fontWeight: FontWeight.normal),
          bodyMedium: TextStyle(
              fontFamily: 'Now', fontSize: 14, fontWeight: FontWeight.normal),
          bodySmall: TextStyle(
              fontFamily: 'Now', fontSize: 12, fontWeight: FontWeight.normal),
          labelLarge: TextStyle(
              fontFamily: 'Now', fontSize: 14, fontWeight: FontWeight.w600),
          labelMedium: TextStyle(
              fontFamily: 'Now', fontSize: 12, fontWeight: FontWeight.w500),
          labelSmall: TextStyle(
              fontFamily: 'Now', fontSize: 11, fontWeight: FontWeight.w400),
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  Random random = Random();

  late List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      const TrashMap(),
      const AddPage(),
      const StandingsTable()
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TrashHunt'),
        elevation: 2,
        centerTitle: true,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        elevation: 8,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed, // Ensures the bar stays compact
        showUnselectedLabels:
            false, // Keeps it clean by only showing selected labels
      ),
    );
  }
}
