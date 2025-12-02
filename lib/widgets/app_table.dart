import 'package:flutter/material.dart';

class AppTable extends StatelessWidget {
  final List<String> headers;
  final List<Map<String, dynamic>> rows;

  final IconData emptyIcon;
  final String emptyTitle;
  final String emptySubtitle;

  AppTable({
    super.key,
    required this.headers,
    required this.rows,
    required this.emptyIcon,
    required this.emptyTitle,
    required this.emptySubtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFf9fafb),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          // HEADER
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              color: Color(0xFFf5f6f8),
              border: Border.all(
                color: Color(0xFFebeef3),
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Row(
              children: headers.map((title) {
                return Expanded(
                  child: Center(
                    child: Text(
                      title.toUpperCase(),
                      style: TextStyle(
                        color: Color(0xFF71758a),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          // BODY
          if (rows.isEmpty)
            _buildEmptyState()
          else
            Column(
              children: rows.asMap().entries.map((entry) {
                final index = entry.key; // dptin index
                final row = entry.value; // dptin data
                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: index == rows.length - 1
                      ? Border(
                        left: BorderSide(color: Color(0xFFebeef3)),
                        right: BorderSide(color: Color(0xFFebeef3)),
                      )
                      : Border(
                        left: BorderSide(color: Color(0xFFebeef3)),
                        right: BorderSide(color: Color(0xFFebeef3)),
                        bottom: BorderSide(color: Color(0xFFebeef3)),
                      ),
                    borderRadius: index == rows.length - 1
                      ? BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      )
                      : BorderRadius.zero,
                  ),
                  child: Row(
                    children: headers.map((key) {
                      return Expanded(
                        child: Center(
                          child: Text(
                            row[key]?.toString() ?? '-',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                );
              }).toList(),
            ),
        ],
      ),
    );
  }

  // EMPTY STATE
  Widget _buildEmptyState() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 32),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          left: BorderSide(color: Color(0xFFebeef3)),
          right: BorderSide(color: Color(0xFFebeef3)),
          bottom: BorderSide(color: Color(0xFFebeef3)),
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        )
      ),
      child: SizedBox(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                emptyIcon,
                size: 52,
                color: Color(0xFF9ca3af),
              ),
              const SizedBox(height: 24),

              Text(
                emptyTitle,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),

              Text(
                emptySubtitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF71758a),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}