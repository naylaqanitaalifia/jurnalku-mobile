// lib/widgets/profile/portfolio_tab_widget.dart
import 'package:flutter/material.dart';

class PortfolioTabContent extends StatelessWidget {
  const PortfolioTabContent({Key? key}) : super(key: key);

  // Ubah jadi true kalau sudah ada data dari API
  final bool hasPortfolio = false;

  // Fungsi buka modal tambah portfolio (nanti dihubungkan ke dialog/form)
  void _openAddPortfolio(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Fitur Tambah Portfolio segera hadir!")),
    );
    // Di sini nanti panggil showDialog atau navigasi ke form
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Column(
        children: [
          // Tombol Tambah Portfolio di pojok kanan atas
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton.icon(
                onPressed: () => _openAddPortfolio(context),
                icon: const Icon(Icons.add_circle_outline, size: 18),
                label: const Text("Tambah Portfolio"),
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
                ? _buildPortfolioGrid()
                : _buildEmptyState(context),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 32),
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
          // Ikon koper besar (persis seperti di web)
          const Text(
                        "💼",
                        style: TextStyle(fontSize: 72),
                      ),
                      const SizedBox(height: 12),
          // Jika tidak punya asset, pakai emoji ini:
          // const Text("Portfolio", style: TextStyle(fontSize: 100)),
          
          const SizedBox(height: 24),
          
          const Text(
            "Belum Ada Portfolio",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1F2937),
            ),
          ),
          
          const SizedBox(height: 12),
          
          Text(
            "Portfolio akan ditampilkan di sini ketika sudah ditambahkan",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  // Placeholder untuk ketika ada data (akan kita isi nanti)
  Widget _buildPortfolioGrid() {
    return GridView.builder(
      padding: const EdgeInsets.only(top: 16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.9,
      ),
      itemCount: 4, // dummy
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Center(
            child: Text("Portfolio Item"),
          ),
        );
      },
    );
  }
}