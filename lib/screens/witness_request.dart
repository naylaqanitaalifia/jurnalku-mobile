import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jurnalku_mobile/widgets/app_navbar.dart';
import 'package:jurnalku_mobile/widgets/app_table.dart';
import 'package:jurnalku_mobile/utils/app_colors.dart';

class WitnessRequest extends StatelessWidget {
  const WitnessRequest({super.key});

  @override 
  Widget build(BuildContext context) {
    // final now = DateTime.now();
    // final formattedDate = DateFormat.yMMMMd('id_ID').format(now); 
    // final formattedDay = DateFormat.EEEE('id_ID').format(now);

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
                  'Permintaan Saksi',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Kelola permintaan menjadi saksi dari siswa lain',
                  style: TextStyle(
                      color: Color(0xFF71758a),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
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
                const SizedBox(height: 20),

                AppTable(
                  headers: [
                    'Pengirim',
                    'Tanggal',
                    'Konfirmasi',
                  ],
                  rows: [
                    // {
                    //   'Pengirim': 'Ahmad Fauzi',
                    //   'Tanggal': '10 June 2024',
                    //   'Konfirmasi': 'Terima',
                    // },
                    // {
                    //   'Pengirim': 'Siti Aminah',
                    //   'Tanggal': '11 June 2024',
                    //   'Konfirmasi': 'Tolak',
                    // },
                  ],
                  emptyIcon: Icons.groups_outlined,
                  emptyTitle: 'Belum ada permintaan',
                  emptySubtitle: 'Belum ada yang mengirim permintaan saksi kepada Anda',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}