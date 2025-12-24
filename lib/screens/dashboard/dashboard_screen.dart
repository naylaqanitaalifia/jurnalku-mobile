// lib/screens/dashboard/dashboard_screen.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:jurnalku_mobile/screens/general/usage_guide_page.dart';
import 'package:jurnalku_mobile/screens/jurnal/jurnal_screen.dart';
import 'package:jurnalku_mobile/screens/profile/student_profile_page.dart';
import 'package:jurnalku_mobile/screens/progress/progress_screen.dart';
import 'package:jurnalku_mobile/screens/witness_request/witness_request.dart';
import 'package:jurnalku_mobile/widgets/app_navbar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 100),
        child: Column(
          children: [
            // ==== NAVBAR ====
            AppNavbar(
              name: "M.Reysha Nova Arshandy",
              kelas: "PPLG XII-5",
              photoUrl:
                  "https://jurnalku.smkwikrama.sch.id/storage/jurnalku/photo_profile/student/12309727_1733272448.jpg",
              title: "Beranda",
            ),

            // ==== BANNER SELAMAT DATANG (mirip gambar) ====
            Container(
              height: 240,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(80),
                  bottomRight: Radius.circular(80),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF02398C), Color(0xFF0455B4)],
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    right: -60,
                    top: -60,
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.1),
                      ),
                    ),
                  ),
                  Positioned(
                    left: -40,
                    bottom: -40,
                    child: Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.15),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Selamat Datang di Jurnalku",
                            style: GoogleFonts.poppins(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            "Solusi cerdas untuk memantau perkembangan kompetensi siswa secara efektif",
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: Colors.white.withOpacity(0.95),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // ==== CARD APA ITU JURNALKU (nyempil) ====
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF02398C), Color(0xFF0455B4)],
                  ),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Apa itu Jurnalku?",
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "Jurnalku adalah aplikasi cerdas yang membantu guru dan siswa dalam memantau dan mengelola kompetensi keahlian siswa secara efektif, terstruktur, dan real-time. Dengan fitur lengkap, proses pemantauan menjadi lebih mudah dan transparan.",
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        height: 1.6,
                        color: Colors.white.withOpacity(0.95),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 40),

            // ==== 3 CARD FITUR (Dirancang Khusus, Efektif, Terintegrasi) ====
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(child: _featureCard("Dirancang Khusus", "Memenuhi kebutuhan spesifik sekolah kami dengan fokus pada kemajuan siswa.", Icons.design_services_outlined)),
                      const SizedBox(width: 16),
                      Expanded(child: _featureCard("Efektif", "Memudahkan siswa dan guru melihat perkembangan secara real-time.", Icons.speed)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _featureCard("Terintegrasi", "Pengajuan kompetensi siswa, validasi dan laporan perkembangan yang transparan.", Icons.sync_alt, fullWidth: true),
                ],
              ),
            ),

            const SizedBox(height: 50),

            // ==== MENU APLIKASI (dengan hover effect) ====
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "MENU APLIKASI",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(0.7),
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _menuItem(context,
                      icon: Icons.person_outline,
                      title: "Profil",
                      subtitle: "Lihat dan kelola profilmu di sini.",
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const StudentProfilePage()))),
                  _menuItem(context,
                      icon: Icons.folder_open_outlined,
                      title: "Portofolio",
                      subtitle: "Lihat dan kelola portofolio kompetensimu di sini.",
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const StudentProfilePage()))),
                  _menuItem(context,
                      icon: Icons.card_membership_outlined,
                      title: "Sertifikat",
                      subtitle: "Lihat dan unduh sertifikat kompetensimu di sini.",
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const StudentProfilePage()))),
                  _menuItem(context,
                      icon: Icons.menu_book_outlined,
                      title: "Jurnal Pembiasaan",
                      subtitle: "Catat dan pantau kegiatan pembiasaan harianmu.",
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const JurnalScreen()))),
                  _menuItem(context,
                      icon: Icons.how_to_reg_outlined,
                      title: "Permintaan Saksi",
                      subtitle: "Lihat teman yang mengajukan permintaan saksi.",
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const WitnessRequest()))),
                  _menuItem(context,
                      icon: Icons.bar_chart_outlined,
                      title: "Progress",
                      subtitle: "Lihat kemajuan kompetensi dan pencapaian belajarmu.",
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ProgressScreen()))),
                  _menuItem(context,
                      icon: Icons.note_alt_outlined,
                      title: "Catatan Sikap",
                      subtitle: "Lihat catatan sikap dan perilaku dari guru.",
                      onTap: () {}), // belum ada screen
                  _menuItem(context,
                      icon: Icons.menu_book,
                      title: "Panduan Penggunaan",
                      subtitle: "Pelajari cara menggunakan semua fitur aplikasi",
                      color: fromCssColor("#02398C"),
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const UsageGuidePage()))),
                ],
              ),
            ),

            const SizedBox(height: 50),

            // ==== STATISTIK KOMPETENSI (persis gambar) ====
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "STATISTIK KOMPETENSI",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(0.7),
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _statCard("Materi Diselesaikan", "0", Colors.green, "Selesai"),
                  const SizedBox(height: 12),
                  _statCard("Pengajuan Pending", "0", Colors.orange, "Pending"),
                  const SizedBox(height: 12),
                  _statCard("Materi Hari Ini", "0", Colors.blue, "Hari Ini"),
                  const SizedBox(height: 12),
                  _statCard("Materi Revisi", "0", Colors.purple, "Revisi"),
                ],
              ),
            ),

            const SizedBox(height: 80),
          ],
        ),
      ),
     
    );
  }

  // ================== MENU ITEM DENGAN HOVER EFEK ==================
  Widget _menuItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    Color color = const Color(0xFF02398C),
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFFE5E7EB)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.12),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: color, size: 30),
                ),
                const SizedBox(width: 18),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: GoogleFonts.poppins(fontSize: 16.5, fontWeight: FontWeight.w600)),
                      const SizedBox(height: 4),
                      Text(subtitle, style: TextStyle(fontSize: 13.5, color: Colors.grey[600])),
                    ],
                  ),
                ),
                Icon(Icons.chevron_right, color: Colors.grey[400], size: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _featureCard(String title, String desc, IconData icon, {bool fullWidth = false}) {
    return Container(
      width: fullWidth ? double.infinity : null,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 12, offset: const Offset(0, 6)),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, size: 56, color: fromCssColor("#02398C")),
          const SizedBox(height: 20),
          Text(title, style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600), textAlign: TextAlign.center),
          const SizedBox(height: 10),
          Text(desc, style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[700]), textAlign: TextAlign.center),
        ],
      ),
    );
  }

  Widget _statCard(String title, String value, Color color, String label) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 12, offset: const Offset(0, 6)),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: GoogleFonts.poppins(fontSize: 15, color: Colors.grey[700])),
                const SizedBox(height: 8),
                Text(value, style: GoogleFonts.poppins(fontSize: 36, fontWeight: FontWeight.bold, color: color)),
              ],
            ),
          ),
          Column(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: color.withOpacity(0.15),
                child: _getStatIcon(color),
              ),
              const SizedBox(height: 8),
              Text(label, style: TextStyle(fontSize: 13, color: color, fontWeight: FontWeight.w600)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _getStatIcon(Color color) {
    if (color == Colors.green) return const Icon(Icons.check_circle, color: Colors.green, size: 26);
    if (color == Colors.orange) return const Icon(Icons.access_time, color: Colors.orange, size: 26);
    if (color == Colors.blue) return const Icon(Icons.calendar_today, color: Colors.blue, size: 26);
    return const Icon(Icons.refresh, color: Colors.purple, size: 26);
  }
}