import 'package:flutter/material.dart';

class GridViewPage extends StatelessWidget {
  const GridViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> gridItems = [
      {
        'title': 'Whatsapp',
        'icon': Icons.flutter_dash,
        'color': const Color.fromARGB(255, 19, 219, 86)
      },
      {
        'title': 'instagram',
        'icon': Icons.code,
        'color': const Color.fromARGB(255, 219, 30, 137)
      },
      {
        'title': 'facebook',
        'icon': Icons.palette,
        'color': const Color.fromARGB(255, 17, 35, 239)
      },
      {
        'title': 'Zoom',
        'icon': Icons.api,
        'color': const Color.fromRGBO(90, 34, 231, 1)
      },
      {
        'title': 'youtube',
        'icon': Icons.storage,
        'color': const Color.fromARGB(255, 206, 8, 31)
      },
      {
        'title': 'gmail',
        'icon': Icons.security,
        'color': const Color.fromARGB(255, 230, 227, 227)
      },
      {
        'title': 'Twitter',
        'icon': Icons.bug_report,
        'color': const Color.fromARGB(255, 0, 9, 9)
      },
      {
        'title': 'spotify',
        'icon': Icons.cloud_upload,
        'color': const Color.fromARGB(255, 20, 211, 128)
      },
      {
        'title': 'tanggal',
        'icon': Icons.bar_chart,
        'color': const Color.fromARGB(255, 255, 193, 7)
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Grid View'),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1,
          ),
          itemCount: gridItems.length,
          itemBuilder: (context, index) {
            final item = gridItems[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      title: item['title'],
                      icon: item['icon'],
                      color: item['color'],
                    ),
                  ),
                );
              },
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        item['color'].withOpacity(0.7),
                        item['color'].withOpacity(0.3),
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        item['icon'],
                        size: 40,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        item['title'],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  const DetailPage({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: color,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            padding: const EdgeInsets.symmetric(
              horizontal: 32,
              vertical: 16,
            ),
          ),
          child: const Text(
            'Kembali',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
