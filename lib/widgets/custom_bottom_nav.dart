// lib/widgets/custom_bottom_nav.dart
import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNav({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: fromCssColor("#02398C"),
        unselectedItemColor: Colors.grey[600],
        selectedFontSize: 12,
        unselectedFontSize: 11,
        backgroundColor: Colors.white,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, size: 28),
            activeIcon: Icon(Icons.home, size: 28),
            label: "Beranda",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_outlined, size: 28),
            activeIcon: Icon(Icons.menu_book, size: 28),
            label: "Jurnal",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_outlined, size: 28),
            activeIcon: Icon(Icons.bar_chart, size: 28),
            label: "Progress",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline, size: 28),
            activeIcon: Icon(Icons.person, size: 28),
            label: "Profil",
          ),
        ],
      ),
    );
  }
}