import 'package:flutter/material.dart';
import 'counter_page.dart';
import 'nested_widget_page.dart';
import 'user_input_page.dart';
import 'dynamic_list_page.dart';
import 'simple_navigation_page.dart';
import 'grid_view_page.dart';
import 'about_page.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  // Track which buttons have been clicked
  Map<int, bool> clickedButtons = {
    0: false,
    1: false,
    2: false,
    3: false,
    4: false,
    5: false,
    6: false,
  };

  final List<String> projectNames = [
    'Counter',
    'Widget Bertingkat',
    'User Input Example',
    'Dynamic List Example',
    'Navigasi Sederhana',
    'Grid View',
    'Tentang Saya',
  ];

  final List<Widget> projectPages = [
    const CounterPage(),
    const NestedWidgetPage(),
    const UserInputPage(),
    const DynamicListPage(),
    const SimpleNavigationPage(),
    const GridViewPage(),
    const AboutPage(),
  ];

  void _navigateToProject(int index) {
    setState(() {
      clickedButtons[index] = true;
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => projectPages[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyPorto'),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Cek hasil karyaku disini:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(221, 3, 144, 184),
                ),
              ),
              const SizedBox(height: 24),
              ...List.generate(
                projectNames.length,
                (index) {
                  bool isClicked = clickedButtons[index] ?? false;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () => _navigateToProject(index),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              isClicked ? Colors.blue : Colors.grey[300],
                          foregroundColor:
                              isClicked ? Colors.white : Colors.black87,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          projectNames[index],
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
