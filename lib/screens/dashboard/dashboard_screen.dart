// lib/screens/dashboard/dashboard_screen.dart
import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jurnalku_mobile/widgets/app_navbar.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: Column(
          children: [
            // Navbar Atas (konsisten)
            AppNavbar(
              name: "M.Reysha Nova Arshandy",
              kelas: "PPLG XII-5",
              photoUrl:
                  "https://jurnalku.smkwikrama.sch.id/storage/jurnalku/photo_profile/student/12309727_1733272448.jpg",
            ),

            // Konten utama – pakai ListView biar aman dari overflow
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  // Hero Section (Banner besar)
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(32),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        colors: [fromCssColor("#02398C"), fromCssColor("#0250BC")],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 15,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Selamat Datang di Jurnalku",
                          style: GoogleFonts.poppins(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          "Solusi cerdas untuk memantau perkembangan kompetensi siswa secara efektif",
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            color: Colors.white70,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Apa itu Jurnalku + 3 Kartu Fitur
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Card "Apa itu Jurnalku"
                      Expanded(
                        flex: 2,
                        child: Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: fromCssColor("#02398C").withOpacity(0.95),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Apa itu Jurnalku?",
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                "Jurnalku adalah aplikasi cerdas yang membantu guru dan siswa dalam memantau dan mengelola kompetensi keahlian siswa secara efektif, terstruktur, dan real-time.",
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),

                      // 3 Kartu Fitur
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                _featureCard("Dirancang Khusus", Icons.build_circle_outlined),
                                const SizedBox(width: 12),
                                _featureCard("Efektif & Cepat", Icons.speed),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                _featureCard("Terintegrasi", Icons.sync_alt),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),

                  // Menu Aplikasi
                  Text(
                    "Menu Aplikasi",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _menuCard("Profil", Icons.person_outline, () {}),
                  _menuCard("Portofolio", Icons.work_outline, () {}),
                  _menuCard("Sertifikat", Icons.card_membership_outlined, () {}),
                  const SizedBox(height: 20),
                  _menuCard("Jurnal Pembiasaan", Icons.menu_book_outlined, () {}),
                  _menuCard("Permintaan Saksi", Icons.how_to_reg_outlined, () {}),
                  _menuCard("Progress", Icons.bar_chart_outlined, () {}),
                  _menuCard("Catatan Sikap", Icons.warning_amber_outlined, () {}),
                  const SizedBox(height: 40),

                  // Statistik Kompetensi
                  Text(
                    "Statistik Kompetensi",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 16),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1.7,
                    children: [
                      _statCard("Materi Diselesaikan", "0", Colors.green, Icons.check_circle_outline),
                      _statCard("Pengajuan Pending", "0", Colors.orange, Icons.access_time),
                      _statCard("Materi Hari Ini", "0", Colors.blue, Icons.today),
                      _statCard("Revisi Dibutuhkan", "0", Colors.purple, Icons.refresh),
                    ],
                  ),
                  const SizedBox(height: 80), // memberi ruang untuk footer
                ],
              ),
            ),
          ],
        ),
      ),

      // Footer
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        color: fromCssColor("#02398C").withOpacity(0.08),
        child: Text(
          "© GEN-28 PPLG SMK Wikrama Bogor. All Rights Reserved.",
          style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey[700]),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  // Kartu fitur kecil
  Widget _featureCard(String title, IconData icon) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: fromCssColor("#E2E8F0")),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 4)),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, size: 40, color: fromCssColor("#02398C")),
            const SizedBox(height: 12),
            Text(
              title,
              style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  // Menu card (mirip versi lama)
  Widget _menuCard(String title, IconData icon, VoidCallback onTap) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        leading: CircleAvatar(
          backgroundColor: fromCssColor("#02398C").withOpacity(0.1),
          child: Icon(icon, color: fromCssColor("#02398C")),
        ),
        title: Text(title, style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
        subtitle: Text("Lihat dan kelola $title kamu di sini."),
        trailing: Icon(Icons.chevron_right, color: fromCssColor("#02398C")),
        onTap: onTap,
      ),
    );
  }

// Hanya bagian _statCard yang diubah biar TIDAK OVERFLOW lagi
Widget _statCard(String title, String value, Color color, IconData icon) {
  return Container(
    padding: const EdgeInsets.all(16), // dikurangi dari 20 → 16
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4)),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            CircleAvatar(
              radius: 14,
              backgroundColor: color.withOpacity(0.15),
              child: Icon(icon, size: 18, color: color),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(value, style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Row(
          children: [
            Icon(Icons.circle, size: 10, color: color),
            const SizedBox(width: 6),
            Text(
              title.contains("Selesai") ? "Selesai" : title.contains("Pending") ? "Pending" : title.contains("Hari Ini") ? "Hari Ini" : "Revisi",
              style: TextStyle(color: color, fontSize: 12),
            ),
          ],
        ),
      ],
    ),
  );
}
}