// lib/widgets/app_navbar.dart
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:jurnalku_mobile/screens/general/account_settings.dart';
import 'package:jurnalku_mobile/screens/profile/student_profile_page.dart';

class AppNavbar extends StatelessWidget {
  final String name;
  final String kelas;
  final String? photoUrl;
  final VoidCallback? onProfileTap;
  final bool showBackButton;
  final String? title;
  final bool isProfilePage; // true = hanya ikon Settings

  const AppNavbar({
    Key? key,
    required this.name,
    required this.kelas,
    this.photoUrl,
    this.onProfileTap,
    this.showBackButton = false,
    this.title,
    this.isProfilePage = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            // === KIRI: Home atau Back Button ===
            if (showBackButton)
              IconButton(
                icon: const Icon(Icons.arrow_back_ios_new, size: 22),
                onPressed: () => Navigator.pop(context),
              )
            else
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.home_outlined, size: 28),
                    color: const Color(0xFF6E7D93),
                    onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.chevron_right, color: Colors.grey, size: 18),
                  const SizedBox(width: 4),
                  Text(
                    title ?? "Dashboard",
                    style: const TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                ],
              ),

            const Spacer(),

            // === KANAN: Dinamis ===
            if (isProfilePage)
              // HANYA IKON SETTINGS (tanpa nama & kelas)
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const AccountSettings()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(14),
                  child: Icon(
                    Icons.settings,
                    color: Colors.black.withOpacity(0.8),
                    size: 26,
                  ),
                ),
              )
            else
              // Normal: Nama + Kelas + Foto Profil
              GestureDetector(
                onTap: onProfileTap ??
                    () {
                      // Default: ke halaman profil
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const StudentProfilePage()),
                      );
                    },
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          kelas,
                          style: const TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(width: 14),
                    CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.grey[200],
                      child: ClipOval(
                        child: CachedNetworkImage(
                          imageUrl: photoUrl ?? "",
                          fit: BoxFit.cover,
                          width: 44,
                          height: 44,
                          placeholder: (_, __) => Container(color: Colors.grey[300]),
                          errorWidget: (_, __, ___) => const Icon(Icons.person, color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}