import 'package:flutter/material.dart';
import 'package:jurnalku_mobile/utils/app_colors.dart';

class AppInfoExpandCard extends StatefulWidget {
  final String title;
  final String? status; 
  final List<Map<String, String>> details;

  const AppInfoExpandCard({
    super.key,
    required this.title,
    this.status,
    required this.details,
  });

  @override
  State<AppInfoExpandCard> createState() => _AppInfoExpandCardState();
}

class _AppInfoExpandCardState extends State<AppInfoExpandCard> {
  bool isExpanded = false;

  Color _statusColor(String status) {
    switch (status.toLowerCase()) {
      case 'baik':
      case 'selesai':
        return Colors.green;
      case 'diproses':
        return Colors.orange;
      case 'buruk':
      case 'perbaikan':
        return Colors.red;
      default:
        return Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: AppColors.borderPrimary,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: ExpansionTile(
          tilePadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          childrenPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          onExpansionChanged: (expanded) {
            setState(() => isExpanded = expanded);
          },

          // TITLE & STATUS
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  widget.title,
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              if (widget.status != null && widget.status!.isNotEmpty)
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: _statusColor(widget.status!).withOpacity(0.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    widget.status!,
                    style: TextStyle(
                      color: _statusColor(widget.status!),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
            ],
          ),

          trailing: AnimatedRotation(
            turns: isExpanded ? 0.5 : 0,
            duration: const Duration(milliseconds: 250),
            child: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: AppColors.textSecondary,
              size: 28,
            ),
          ),

          // DETAIL 
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(widget.details.length, (i) {
                final item = widget.details[i];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['label'] ?? '',
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item['value'] ?? '',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 14),
                    if (i != widget.details.length - 1)
                      Container(
                        height: 1,
                        margin: const EdgeInsets.only(bottom: 8),
                        color: AppColors.borderPrimary.withOpacity(0.3),
                      ),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
