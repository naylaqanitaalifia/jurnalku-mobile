import 'package:flutter/material.dart';
import 'package:jurnalku_mobile/utils/app_colors.dart';

class AppStatisticCard extends StatelessWidget {
  final String title;
  final int value;
  final Color bgIconColor;
  final IconData icon;
  final Color iconColor;
  final Color? indicatorColor;
  final String? indicatorTitle;

  const AppStatisticCard({
    super.key,
    required this.title,
    required this.value,
    required this.bgIconColor,
    required this.icon,
    required this.iconColor,
    this.indicatorColor,
    this.indicatorTitle,
  });

  @override
  Widget build(BuildContext context){
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.bgColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.borderPrimary,
        ),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black.withOpacity(0.06), 
        //     blurRadius: 12,
        //     offset: const Offset(0, 3),
        //   ),
        // ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                value.toString(),
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              CircleAvatar(
                radius: 24,
                backgroundColor: bgIconColor,
                child: Icon(
                  icon,
                  color: iconColor,
                  size: 24,
                ),
              ),
            ],
          ),
          if (indicatorColor != null && indicatorTitle != null)   
          Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: indicatorColor,
                  borderRadius: BorderRadius.circular(8)
                ),
              ),
              SizedBox(width: 4),
              
              Text(
                indicatorTitle.toString(),
                style: TextStyle(
                  color: indicatorColor,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}