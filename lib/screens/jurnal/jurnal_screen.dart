// lib/screens/jurnal/jurnal_screen.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:jurnalku_mobile/widgets/app_navbar.dart';
// Pastikan import file detail_jurnal ada di sini
import 'detail_jurnal.dart'; 

class JurnalScreen extends StatefulWidget {
  const JurnalScreen({super.key});

  @override
  State<JurnalScreen> createState() => _JurnalScreenState();
}

class _JurnalScreenState extends State<JurnalScreen> {
  final String bulan = "DESEMBER";
  final String tahun = "2025";

  // Dummy data
  final List<Map<String, dynamic>> poinData = [
    {
      "kategori": "(5) mengerjakan project/adanya update progress belajar",
      "m1": "15", "m2": "20", "m3": "10", "m4": "25",
    },
    {
      "kategori": "(1 - 5) poin dari pertanyaan atau laporan pengetahuan materi",
      "m1": "8", "m2": "12", "m3": "15", "m4": "10",
    },
    {
      "kategori": "Jumlah poin minggu ini",
      "m1": "23", "m2": "32", "m3": "25", "m4": "35",
      "isTotal": true,
    },
    {
      "kategori": "Jumlah poin ceklis pembiasaan",
      "total": "142",
      "singleValue": true,
    },
    {
      "kategori": "Jumlah keseluruhan poin",
      "total": "597",
      "singleValue": true,
    },
  ];

  final List<int> desemberDays = List.generate(31, (i) => i + 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: Column(
          children: [
            // NAVBAR
            const AppNavbar(
              name: "M.Reysha Nova Arshandy",
              kelas: "PPLG XII-5",
              photoUrl:
                  "https://jurnalku.smkwikrama.sch.id/storage/jurnalku/photo_profile/student/12309727_1733272448.jpg",
              title: "Jurnal",
            ),

            // ISI UTAMA (Scrollable)
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header Bulan
                    _buildHeader(),

                    const SizedBox(height: 32),

                    // A. PEMBIASAAN HARIAN (Grid Kalender Baru)
                    _buildSectionCard(
                      letter: "A",
                      title: "Pembiasaan Harian",
                      subtitle: "Pilih tanggal untuk melihat detail",
                      // Legend opsional, bisa dihapus jika ingin benar-benar bersih
                      legend: Row(
                        children: [
                          _legendItem(Colors.white, "Aktif", border: true),
                          const SizedBox(width: 16),
                          _legendItem(Colors.grey.shade300, "Non-Aktif"),
                        ],
                      ),
                      child: _buildCalendarGrid(),
                    ),

                    const SizedBox(height: 32),

                    // B. PEKERJAAN
                    _buildEmptySection(
                      letter: "B",
                      title: "Pekerjaan",
                      subtitle: "Daftar pekerjaan harian",
                      onTap: () => _showPekerjaanModal(context),
                    ),

                    const SizedBox(height: 32),

                    // C. MATERI
                    _buildEmptySection(
                      letter: "C",
                      title: "Materi",
                      subtitle: "Materi yang dipelajari",
                      onTap: () => _showMateriModal(context),
                    ),

                    const SizedBox(height: 40),

                    // D. POIN (Mobile Friendly List)
                    _buildSectionCard(
                      letter: "D",
                      title: "Rekap Poin",
                      subtitle: "Rincian perolehan poin mingguan",
                      child: _buildMobilePoinList(),
                    ),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- WIDGET BUILDERS ---

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Jurnal Pembiasaan",
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "$bulan $tahun",
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: fromCssColor("#02398C"),
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(12),
          ),
          child: const Icon(Icons.calendar_month, color: Colors.white, size: 20),
        ),
      ],
    );
  }

  // KALENDER YANG DIMINTA (Mobile Friendly & Navigasi)
  Widget _buildCalendarGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        childAspectRatio: 1,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemCount: desemberDays.length,
      itemBuilder: (context, index) {
        final day = desemberDays[index];
        final bool isTargetDay = day == 1; // Hanya tanggal 1 yang aktif

        return Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: isTargetDay
                ? () {
                    // NAVIGASI KE DETAIL JURNAL
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const DetailJurnalScreen()),
                    );
                  }
                : null, // Tanggal lain tidak bisa diklik
            borderRadius: BorderRadius.circular(12),
            child: Container(
              decoration: BoxDecoration(
                // Jika tanggal 1: Putih. Jika bukan: Abu-abu gelap (0xFFE2E8F0)
                color: isTargetDay ? Colors.white : const Color(0xFFE2E8F0),
                borderRadius: BorderRadius.circular(12),
                border: isTargetDay
                    ? Border.all(color: fromCssColor("#02398C"), width: 1.5)
                    : Border.all(color: Colors.transparent),
                boxShadow: isTargetDay
                    ? [
                        BoxShadow(
                          color: fromCssColor("#02398C").withOpacity(0.2),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        )
                      ]
                    : [],
              ),
              child: Center(
                child: Text(
                  "$day",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    // Jika tanggal 1: Teks Biru Tebal. Jika bukan: Abu-abu pudar
                    fontWeight: isTargetDay ? FontWeight.bold : FontWeight.w500,
                    color: isTargetDay ? fromCssColor("#02398C") : Colors.grey[500],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // LIST POIN (Pengganti DataTable agar tidak swap ke samping)
  Widget _buildMobilePoinList() {
    return Column(
      children: poinData.map((item) {
        final bool isTotal = item["isTotal"] ?? false;
        final bool singleValue = item["singleValue"] ?? false;

        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isTotal ? const Color(0xFFEEF2FF) : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: isTotal ? const Color(0xFFC7D2FE) : Colors.grey.shade200),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Judul Kategori
              Text(
                item["kategori"],
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: isTotal || singleValue ? FontWeight.bold : FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12),
              
              // Nilai (Pemisahan logika Single Value vs Weekly)
              if (singleValue)
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    item["total"],
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: fromCssColor("#02398C"),
                    ),
                  ),
                )
              else
                // Tampilan Minggu 1 - 4 (Grid kecil)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _weekItem("M1", item["m1"]),
                    _weekItem("M2", item["m2"]),
                    _weekItem("M3", item["m3"]),
                    _weekItem("M4", item["m4"]),
                  ],
                ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _weekItem(String label, String value) {
    return Column(
      children: [
        Text(label, style: GoogleFonts.poppins(fontSize: 10, color: Colors.grey)),
        const SizedBox(height: 2),
        Text(value, style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600)),
      ],
    );
  }

  // CARD UTAMA WRAPPER
  Widget _buildSectionCard({
    required String letter,
    required String title,
    required String subtitle,
    Widget? legend,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Container(
                  width: 40, height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: fromCssColor("#02398C"),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(letter, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold)),
                      Text(subtitle, style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey[500])),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (legend != null) Padding(padding: const EdgeInsets.fromLTRB(20, 0, 20, 16), child: legend),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFFFAFAFA),
              borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
              border: Border.all(color: Colors.grey.shade100),
            ),
            child: child,
          ),
        ],
      ),
    );
  }

  Widget _buildEmptySection({
    required String letter,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return _buildSectionCard(
      letter: letter,
      title: title,
      subtitle: subtitle,
      child: Column(
        children: [
          Icon(Icons.folder_open_outlined, size: 48, color: Colors.grey[300]),
          const SizedBox(height: 12),
          Text(
            "Belum ada data",
            style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[500]),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: onTap,
              icon: const Icon(Icons.add, size: 18),
              label: Text("Input $title"),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
                side: BorderSide(color: fromCssColor("#02398C")),
                foregroundColor: fromCssColor("#02398C"),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _legendItem(Color color, String text, {bool border = false}) {
    return Row(
      children: [
        Container(
          width: 12, height: 12,
          decoration: BoxDecoration(
            color: color, 
            shape: BoxShape.circle,
            border: border ? Border.all(color: Colors.grey.shade300) : null,
          ),
        ),
        const SizedBox(width: 6),
        Text(text, style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey[600])),
      ],
    );
  }

  void _showPekerjaanModal(BuildContext context) {
     // Kode modal sama seperti sebelumnya
  }

  void _showMateriModal(BuildContext context) {
     // Kode modal sama seperti sebelumnya
  }
}