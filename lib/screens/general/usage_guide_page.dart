// lib/screens/general/usage_guide_page.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:jurnalku_mobile/widgets/app_navbar.dart';        // Top Navbar
// import 'package:jurnalku_mobile/widgets/custom_bottom_nav.dart'; // Sudah dihapus sesuai permintaan

class UsageGuidePage extends StatelessWidget {
  const UsageGuidePage({super.key});

  // Data panduan umum
  List<Map<String, dynamic>> get generalUsageGuide => [
        {
          "icon": Icons.person_outline,
          "title": "Unggah Profile",
          "subtitle": "Panduan untuk mengunggah profile pengguna",
        },
        {
          "icon": Icons.lock_outline,
          "title": "Ganti Password",
          "subtitle": "Panduan untuk mengganti password pengguna",
        }
      ];

  // Data panduan siswa
  List<Map<String, dynamic>> get studentUsageGuide => [
        {
          "icon": Icons.edit_note,
          "title": "Mengisi Jurnal",
          "subtitle": "Panduan untuk mengisi kegiatan sehari-hari",
        },
        {
          "icon": Icons.person_search,
          "title": "Kelengkapan Profile",
          "subtitle": "Panduan untuk melengkapi profile",
        },
        {
          "icon": Icons.image,
          "title": "Mengelola Portfolio",
          "subtitle": "Panduan untuk menambah, edit, dan hapus portfolio",
        },
        {
          "icon": Icons.check_circle,
          "title": "Mengelola Sertifikat",
          "subtitle": "Panduan untuk menambah, edit, dan hapus sertifikat",
        },
        {
          "icon": Icons.warning_amber,
          "title": "Catatan Sikap Saya",
          "subtitle": "Panduan untuk melihat dan memahami catatan sikap",
        }
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fromCssColor("#F8FAFC"),

      // TIDAK PAKAI appBar SAMA SEKALI → biar AppNavbar ada di dalam body
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 40), // Ruang bawah biar aman
        child: Column(
          children: [
            // TOP NAVBAR — DI DALAM BODY (sama seperti dashboard terakhirmu)
            AppNavbar(
              name: "M.Reysha Nova Arshandy",
              kelas: "PPLG XII-5",
              photoUrl:
                  "https://jurnalku.smkwikrama.sch.id/storage/jurnalku/photo_profile/student/12309727_1733272448.jpg",
              title: "Panduan",
            ),

            const SizedBox(height: 20),

            // ISI PANDUAN
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Row(
                    children: [
                      Icon(Icons.menu_book, color: fromCssColor('#02398C'), size: 32),
                      const SizedBox(width: 12),
                      Text(
                        "Panduan Penggunaan",
                        style: GoogleFonts.poppins(
                          color: fromCssColor("#02398C"),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Selamat datang di panduan penggunaan aplikasi Jurnalku. Panduan ini akan membantu Anda memahami cara menggunakan fitur-fitur yang tersedia dengan optimal.",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: fromCssColor("#4b5563"),
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 30),

                  // === BAGIAN UMUM ===
                  Text("Umum", style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 10),
                  const Divider(),
                  const SizedBox(height: 10),

                  ...generalUsageGuide.map((item) => _guideCard(item)).toList(),

                  const SizedBox(height: 30),

                  // === BAGIAN SISWA ===
                  Text("Untuk Siswa", style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 10),
                  const Divider(),
                  const SizedBox(height: 10),

                  ...studentUsageGuide.map((item) => _guideCard(item)).toList(),

                  const SizedBox(height: 80), 
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget card panduan
  Widget _guideCard(Map<String, dynamic> item) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: fromCssColor("#ebeef3")),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(item["icon"], color: fromCssColor('#02398C'), size: 32),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item["title"],
                    style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item["subtitle"],
                    style: GoogleFonts.poppins(fontSize: 14, color: fromCssColor("#6b7280")),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}