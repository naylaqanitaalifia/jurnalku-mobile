// lib/screens/progress/progress_screen.dart
import 'package:flutter/material.dart';
import 'package:jurnalku_mobile/screens/gim/gim.dart';
import 'package:jurnalku_mobile/screens/mobile/mobile_apps.dart';
import 'package:jurnalku_mobile/screens/other.dart';
import 'package:jurnalku_mobile/screens/projectwork/project_work.dart';
import 'package:jurnalku_mobile/screens/ukk/ukk.dart';
import 'package:jurnalku_mobile/widgets/app_info_card.dart';
import 'package:jurnalku_mobile/widgets/app_navbar.dart';
import 'package:jurnalku_mobile/widgets/app_statistic_card.dart';
import 'package:jurnalku_mobile/utils/app_colors.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: Column(
        children: [
          // Navbar tetap di atas
          AppNavbar(
            name: "M.Reysha Nova Arshandy",
            kelas: "PPLG XII-5",
            title: "Progress",
            photoUrl:
                "https://jurnalku.smkwikrama.sch.id/storage/jurnalku/photo_profile/student/12309727_1733272448.jpg",
          ),

          // === SEMUA ISI YANG BISA DI-SCROLL ===
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(), // smooth scroll
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Judul
                  const Text(
                    'Progress Belajar',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Pantau perkembangan kompetensi dan materi pembelajaran Anda',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Tanggal hari ini
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFeff6ff),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'Wednesday, 19 November 2025',
                      style: TextStyle(
                        color: AppColors.textQuaternary,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // === STATISTIC CARDS ===
                  const AppStatisticCard(
                    title: 'Total Pengajuan',
                    value: 0,
                    bgIconColor: Color(0xFFdbeafe),
                    icon: Icons.check_circle_outline,
                    iconColor: Color(0xFF3b82f6),
                    indicatorColor: Color(0xFF3b82f6),
                    indicatorTitle: 'Semua status',
                  ),
                  const SizedBox(height: 20),

                  const AppStatisticCard(
                    title: 'Halaman Ini',
                    value: 0,
                    bgIconColor: Color(0xFFf0fdf4),
                    icon: Icons.calendar_month_outlined,
                    iconColor: Color(0xFF22c55e),
                    indicatorColor: Color(0xFF22c55e),
                    indicatorTitle: 'Data ditampilkan',
                  ),
                  const SizedBox(height: 20),

                  const AppStatisticCard(
                    title: 'Status Pending',
                    value: 0,
                    bgIconColor: Color(0xFFfff7ed),
                    icon: Icons.access_time,
                    iconColor: Color(0xFFf97316),
                    indicatorColor: Color(0xFFf97316),
                    indicatorTitle: 'Perlu validasi',
                  ),
                  const SizedBox(height: 20),

                  const AppStatisticCard(
                    title: 'Total Halaman',
                    value: 0,
                    bgIconColor: Color(0xFFfaf5ff),
                    icon: Icons.menu_book_outlined,
                    iconColor: Color(0xFFa855f7),
                    indicatorColor: Color(0xFFa855f7),
                    indicatorTitle: 'Navigasi tersedia',
                  ),
                  const SizedBox(height: 40),

                  // === MENU KOMPETENSI ===
                  const Text(
                    "Mata Pelajaran & Kompetensi",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 16),

                  AppInfoCard(
                    title: 'Project Work',
                    subtitle: 'Kompetensi dan materi pembelajaran',
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const ProjectWork())),
                  ),
                  const SizedBox(height: 16),

                  AppInfoCard(
                    title: 'Mobile Apps',
                    subtitle: 'Kompetensi dan materi pembelajaran',
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const MobileApps())),
                  ),
                  const SizedBox(height: 16),

                  AppInfoCard(
                    title: 'UKK (Uji Kompetensi Keahlian)',
                    subtitle: 'Kompetensi dan materi pembelajaran',
                    onTap: () =>
                        Navigator.push(context, MaterialPageRoute(builder: (_) => const Ukk())),
                  ),
                  const SizedBox(height: 16),

                  AppInfoCard(
                    title: 'GIM',
                    subtitle: 'Kompetensi dan materi pembelajaran',
                    onTap: () =>
                        Navigator.push(context, MaterialPageRoute(builder: (_) => const Gim())),
                  ),
                  const SizedBox(height: 16),

                  AppInfoCard(
                    title: 'Lainnya',
                    subtitle: 'Kompetensi dan materi pembelajaran',
                    onTap: () => Navigator.push(
                        context, MaterialPageRoute(builder: (_) => const Other())),
                  ),

                  // Biar ada ruang di bawah saat scroll sampai akhir
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}