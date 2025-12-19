import 'package:flutter/material.dart';
import 'package:jurnalku_mobile/utils/app_colors.dart';

class AppInfoCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  const AppInfoCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.borderPrimary
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 4),

            Text(
              subtitle,
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        )
      ),
    );
  }
}