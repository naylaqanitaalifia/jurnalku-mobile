import 'package:flutter/material.dart';
import 'package:jurnalku_mobile/utils/app_colors.dart';

class AppDropdownTable extends StatelessWidget {
  final String headerTitle;
  final String headerSubtitle;
  final String sectionTitle;

  const AppDropdownTable({
    super.key,
    required this.headerTitle,
    required this.headerSubtitle,
    required this.sectionTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          // color: AppColors.borderPrimary,
          color: Colors.grey[300]!,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  headerTitle,
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4),

                Text(
                  headerSubtitle,
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 1, color: AppColors.borderPrimary),

          ExpansionTile(
            // tilePadding: EdgeInsets.zero,
            childrenPadding: EdgeInsets.zero,
            title: Text(
              'Project Work Title',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 0, right: 0, bottom: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kompetensi',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(height: 4),

                    Text(
                      'Guru',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),

                    Text(
                      'Tanggal',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(height: 4),

                    Text(
                      'Status',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),

                    Text(
                      'Catatan guru',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(height: 4),

                    Text(
                      'Catatan siswa',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(height: 4),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}