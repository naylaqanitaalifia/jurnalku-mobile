import 'package:flutter/material.dart';
import 'package:jurnalku_mobile/utils/app_colors.dart';
import 'package:jurnalku_mobile/widgets/app_info_expand_card.dart';

class ProjectWork extends StatelessWidget {
  const ProjectWork({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(width: 4),
                    Text(
                      'Project Work',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),

                Text(
                  'Kompetensi dan materi pembelajaran',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: 20),

                AppInfoExpandCard(
                  title: 'Project Work',
                  status: 'Selesai',
                  // subtitle: 'Kompetensi dan materi pembelajaran',
                  details: [
                    { "label": "Kompetensi", "value": "Menerapkan konsep project work" },
                    { "label": "Guru", "value": "Ibu Dewi Lestari" },
                    { "label": "Tanggal", "value": "20 Februari 2025" },
                    // { "label": "Status", "value": "Selesai" },
                    { "label": "Catatan Guru", "value": "Sudah sangat baik, lanjutkan!" },
                    { "label": "Catatan Siswa", "value": "Perlu latihan lanjutan." },
                  ],
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
