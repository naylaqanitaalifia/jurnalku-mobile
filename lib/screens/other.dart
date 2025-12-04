import 'package:flutter/material.dart';
import 'package:jurnalku_mobile/utils/app_colors.dart';
import 'package:jurnalku_mobile/widgets/app_info_expand_card.dart';

class Other extends StatelessWidget {
  const Other({super.key});

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
                      'Lainnya',
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
                  title: 'Lainnya Title Section',
                  subtitle: 'Lainnya Subtitle Section',
                  details: [
                    { "label": "Kompetensi", "value": "Menerapkan widget Expansion Tile" },
                    { "label": "Guru", "value": "Ibu Soleha" },
                    { "label": "Tanggal", "value": "20 Februari 2025" },
                    { "label": "Status", "value": "Selesai" },
                    { "label": "Catatan Guru", "value": "Sudah sangat baik, lanjutkan!" },
                    { "label": "Catatan Siswa", "value": "Perlu latihan lanjutan." },
                  ],
                ),
                SizedBox(height: 16),

                AppInfoExpandCard(
                  title: 'Lainnya Title Section',
                  subtitle: 'Lainnya Subtitle Section',
                  details: [
                    { "label": "Kompetensi", "value": "Menerapkan widget Expansion Tile" },
                    { "label": "Guru", "value": "Ibu Soleha" },
                    { "label": "Tanggal", "value": "20 Februari 2025" },
                    { "label": "Status", "value": "Selesai" },
                    { "label": "Catatan Guru", "value": "Sudah sangat baik, lanjutkan!" },
                    { "label": "Catatan Siswa", "value": "Perlu latihan lanjutan." },
                  ],
                ),
              ],
            )
          )
        ],
      )
    );
  }
}