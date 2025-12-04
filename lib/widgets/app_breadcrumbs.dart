// import 'package:flutter/material.dart';
// import 'package:jurnalku_mobile/utils/app_colors.dart';

// class AppBreadcrumbs extends StatelessWidget {
//   final List<BreadcrumbItem> items;

//   const AppBreadcrumbs({super.key, required this.items});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         for (int i = 0; i < items.length; i++) ...[
//           GestureDetector(
//             onTap: items[i].onTap,
//             child: Text(
//               items[i].label,
//               style: TextStyle(
//                 color: i == items.length - 1
//                   ? AppColors.textQuaternary
//                   : AppColors.textSecondary,
//                 fontSize: 14,
//                 fontWeight: i == items.length - 1
//                   ? FontWeight.w500
//                   : FontWeight.normal,
//               ),
//             ),
//           ),
//         ]
//       ],
//     );
//   }
// }
