import 'package:flutter/material.dart';

class CertificatesTabContent extends StatelessWidget {
  const CertificatesTabContent({Key? key}) : super(key: key);


  // Ganti dengan data dari API nanti
  // Ubah jadi true kalau sudah ada data dari API
  final bool hasPortfolio = false;

  // Fungsi buka modal tambah portfolio (nanti dihubungkan ke dialog/form)
  void _openAddSertif(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Fitur Tambah Portfolio segera hadir!")),
    );
    // Di sini nanti panggil showDialog atau navigasi ke form
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        children: [
          // Tombol Tambah Portfolio di pojok kanan atas
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton.icon(
                onPressed: () => _openAddSertif(context),
                icon: const Icon(Icons.add_circle_outline, size: 18),
                label: const Text("Tambah Sertifikat"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2563EB), // biru primary JurnalKu
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // Konten utama
          Expanded(
            child: hasPortfolio
                ? _buildCertificatesGrid()
                : _buildEmptyState(context),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Emoji trofi besar – persis seperti di web
          const Text(
            "🏆",
            style: TextStyle(fontSize: 80),
          ),
          const SizedBox(height: 32),

          const Text(
            "Anda Belum Memiliki Sertifikat",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1F2937),
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 16),

          Text(
            "Sertifikat dan pencapaian akan ditampilkan di sini",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey[600],
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  // Placeholder untuk ketika sudah ada sertifikat (nanti diisi grid seperti portfolio)
  Widget _buildCertificatesGrid() {
    return GridView.builder(
      padding: const EdgeInsets.only(top: 16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.85,
      ),
      itemCount: 6, // dummy
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                index % 2 == 0 ? Icons.picture_as_pdf : Icons.image,
                size: 48,
                color: index % 2 == 0 ? Colors.red.shade600 : Colors.blue.shade600,
              ),
              const SizedBox(height: 12),
              Text(
                "Sertifikat ${index + 1}",
                style: const TextStyle(fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                "Dicoding • 2024",
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
            ],
          ),
        );
      },
    );
  }
}