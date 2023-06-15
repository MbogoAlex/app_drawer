import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: selectedAppBar(),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text("Menu"),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                setState(() {
                  _currentIndex = 0;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text("About Us"),
              onTap: () {
                setState(() {
                  _currentIndex = 1;
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.phone),
              title: const Text("Contact Us"),
              onTap: () {
                setState(() {
                  _currentIndex = 2;
                  Navigator.pop(context);
                });
              },
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: selectedWidget(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: "About Us",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone),
            label: "Contact Us",
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget? selectedAppBar() {
    switch (_currentIndex) {
      case 0:
        return homeAppBar();
      case 1:
        return aboutUsAppBar();
      case 2:
        return contactUsAppBar();
      default:
        return homeAppBar();
    }
  }

  PreferredSizeWidget? homeAppBar() {
    return AppBar(
      title: const Text("Home"),
    );
  }

  PreferredSizeWidget? aboutUsAppBar() {
    return AppBar(
      title: const Text("About Us"),
    );
  }

  PreferredSizeWidget? contactUsAppBar() {
    return AppBar(
      title: const Text("Contact Us"),
    );
  }

  Widget selectedWidget() {
    switch (_currentIndex) {
      case 0:
        return homePage();
      case 1:
        return aboutUs();
      case 2:
        return contactUs();
      default:
        return homePage();
    }
  }

  Widget homePage() {
    return const Center(
      child: Text("Home Page"),
    );
  }

  Widget aboutUs() {
    return const Center(
      child: Text("About Us"),
    );
  }

  Widget contactUs() {
    return const Center(
      child: Text("Contact Us"),
    );
  }
}
