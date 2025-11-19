import 'package:flutter/material.dart';

class AppNavbar extends StatelessWidget {
  final String name;
  final String kelas;
  final String photoUrl;

  const AppNavbar({
    super.key,
    required this.name,
    required this.kelas,
    required this.photoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(
                Icons.home_outlined,
                color: Color(0xFF6e7d93),
                size: 28,
              ),
              const SizedBox(width: 12),
            ],
          ),

          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    kelas,
                    style: TextStyle(
                      color: Color(0xFF71758a),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 12),

              CircleAvatar(
                radius: 22,
                backgroundImage: NetworkImage(photoUrl),
              )
            ],
          )
          
        ],
      ),
    );
  }
}
