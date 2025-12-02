import 'package:flutter/material.dart';
import 'package:jurnalku_mobile/utils/app_colors.dart';
import 'package:jurnalku_mobile/widgets/app_navbar.dart';
import 'package:jurnalku_mobile/widgets/app_table.dart';
import 'package:jurnalku_mobile/widgets/app_statistic_card.dart';

class AttitudeNotes extends StatelessWidget {
const AttitudeNotes({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Column(
        children: [
          AppNavbar(
            name: 'Nayla Qanita Alifia',
            kelas: 'PPLG XII-5',
            photoUrl: 'assets/images/profile.jpg',
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Catatan Sikap Saya',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Lihat catatan sikap dan perilaku yang telah dilaporkan',
                      style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 32),

                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.bgWarning,
                        border: Border.all(
                          color: AppColors.borderWarning,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.warning_amber_rounded,
                            size: 20,
                            color: AppColors.textWarningLight,
                          ),
                          SizedBox(width: 12),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Perhatian',
                                  style: TextStyle(
                                    color: AppColors.textWarningDark,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  'Jika Anda merasa ada catatan yang tidak sesuai atau keliru, silakan hubungi guru jurusan untuk mengajukan klarifikasi.',
                                  style: TextStyle(
                                      color: AppColors.textWarningLight,
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24),

                    AppStatisticCard(
                      title: 'Total Catatan',
                      value: 0,
                      bgIconColor: Color(0xFFdbeafe),
                      icon: Icons.insert_drive_file_outlined,
                      iconColor: AppColors.textQuaternary,
                    ),
                    SizedBox(height: 24),

                    AppStatisticCard(
                      title: 'Dalam Perbaikan',
                      value: 0,
                      bgIconColor: Color(0xFFfef9c3),
                      icon: Icons.bolt_outlined,
                      iconColor: Color(0xFF985a32),
                    ),
                    SizedBox(height: 24),

                    AppStatisticCard(
                      title: 'Sudah Berubah',
                      value: 0,
                      bgIconColor: Color(0xFFdcfce7),
                      icon: Icons.check_circle_outline,
                      iconColor: Color(0xFF18a44c),
                    ),
                    SizedBox(height: 32),

                    // TABLE
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minWidth: MediaQuery.of(context).size.width,
                          maxWidth: MediaQuery.of(context).size.width * 2, // boleh 1.5–3x
                        ),
                        child: AppTable(
                          headers: [
                            'No',
                            'Kategori',
                            'Catatan',
                            'Status',
                            'Dilaporkan',
                            'Update Terakhir',
                            'Aksi',
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
                          emptyIcon: Icons.check_circle_outline,
                          emptyTitle: 'Tidak ada catatan',
                          emptySubtitle: 'Belum ada catatan sikap yang dilaporkan',
                        ),
                      )
                    ),
                  ],
                )
              )
            )
          )
        ]
      )
    );
  }
}