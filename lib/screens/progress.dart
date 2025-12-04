import 'package:flutter/material.dart';
import 'package:jurnalku_mobile/screens/gim.dart';
import 'package:jurnalku_mobile/screens/mobile_apps.dart';
import 'package:jurnalku_mobile/screens/other.dart';
import 'package:jurnalku_mobile/screens/project_work.dart';
import 'package:jurnalku_mobile/screens/ukk.dart';
import 'package:jurnalku_mobile/widgets/app_info_card.dart';
import 'package:jurnalku_mobile/widgets/app_navbar.dart';
import 'package:jurnalku_mobile/widgets/app_statistic_card.dart';
import 'package:jurnalku_mobile/utils/app_colors.dart';

class Progress extends StatelessWidget {
  const Progress({super.key});

  @override 
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          AppNavbar(
            name: 'Nayla Qanita Alifia',
            kelas: 'PPLG XII-5',
            photoUrl: 'assets/images/profile.jpg',
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Progress Belajar',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),

                Text(
                  'Pantau perkembangan kompetensi dan materi pembelajaran Anda',
                  style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 16),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: Color(0xFFeff6ff),
                    border: Border.all(
                      color: Color(0xFFeff6ff),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text (
                    'Wednesday, 19 November 2025',
                    style: TextStyle(
                      color: AppColors.textQuaternary,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 32),

                AppStatisticCard(
                  title: 'Total Pengajuan',
                  value: 0,
                  bgIconColor: Color(0xFFdbeafe),
                  icon: Icons.check_circle_outline,
                  iconColor: AppColors.textQuaternary,
                  indicatorColor: AppColors.textQuaternary,
                  indicatorTitle: 'Semua status',
                ),
                SizedBox(height: 24),

                AppStatisticCard(
                  title: 'Halaman Ini',
                  value: 0,
                  bgIconColor: Color(0xFFf0fdf4),
                  icon: Icons.calendar_month_outlined,
                  iconColor: Color(0xFF22c55e),
                  indicatorColor: Color(0xFF22c55e),
                  indicatorTitle: 'Data ditampilkan',
                ),
                SizedBox(height: 24),

                AppStatisticCard(
                  title: 'Status Pending',
                  value: 0,
                  bgIconColor: Color(0xFFfff7ed),
                  icon: Icons.check_circle_outline,
                  iconColor: Color(0xFFf97316),
                  indicatorColor: Color(0xFFf97316),
                  indicatorTitle: 'Perlu validasi',
                ),
                SizedBox(height: 24),

                AppStatisticCard(
                  title: 'Total Halaman',
                  value: 0,
                  bgIconColor: Color(0xFFfaf5ff),
                  icon: Icons.check_circle_outline,
                  iconColor: Color(0xFFa855f7),
                  indicatorColor: Color(0xFFa855f7),
                  indicatorTitle: 'Navigasi tersedia',
                ),
                SizedBox(height: 32),

                // INFO CARD
                AppInfoCard(
                  title: 'Project Work', 
                  subtitle: 'Kompetensi dan materi pembelajaran',
                  onTap: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => ProjectWork(),
                      )
                    );
                  },
                ),
                SizedBox(height: 24),
                
                AppInfoCard(
                  title: 'Mobile Apps', 
                  subtitle: 'Kompetensi dan materi pembelajaran',
                  onTap: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => MobileApps(),
                      )
                    );
                  },
                ),
                SizedBox(height: 24),

                AppInfoCard(
                  title: 'UKK (Uji Kompetensi Keahlian)', 
                  subtitle: 'Kompetensi dan materi pembelajaran',
                  onTap: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => Ukk(),
                      )
                    );
                  },
                ),
                SizedBox(height: 24),

                AppInfoCard(
                  title: 'GIM', 
                  subtitle: 'Kompetensi dan materi pembelajaran',
                  onTap: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => Gim(),
                      )
                    );
                  },
                ),
                SizedBox(height: 24),

                AppInfoCard(
                  title: 'Lainnya', 
                  subtitle: 'Kompetensi dan materi pembelajaran',
                  onTap: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => Other(),
                      )
                    );
                  },
                ),
                SizedBox(height: 24),
              ],
            ),
          )
        ],
      ),
    );
  }
}