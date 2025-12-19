import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:from_css_color/from_css_color.dart';

class DetailJurnalScreen extends StatefulWidget {
  const DetailJurnalScreen({Key? key}) : super(key: key);

  @override
  State<DetailJurnalScreen> createState() => _DetailJurnalScreenState();
}

class _DetailJurnalScreenState extends State<DetailJurnalScreen> {
  // Total item: 19
  final List<bool> _isChecked = List.filled(19, false);
  bool _showSaveButton = false;

  final List<Map<String, dynamic>> _items = [
    // Kesehatan dan Keselamatan Kerja
    {"category": "Kesehatan dan Keselamatan Kerja", "text": "Pencahayaan dan sirkulasi udara pada ruang kerja baik.", "categoryId": "9d98fb2d-4baf-4a9d-86d6-27c2d4aa6cfe", "itemId": "9d98fb2d-74d9-4db7-b4ac-39edbdebfe6a"},
    {"text": "Duduk menggunakan meja dan kursi yang nyaman.", "categoryId": "9d98fb2d-4baf-4a9d-86d6-27c2d4aa6cfe", "itemId": "9d98fb2d-7b97-473b-b517-8b6fb30b9097"},
    {"text": "Punggung dan leher tegak, tidak bungkuk.", "categoryId": "9d98fb2d-4baf-4a9d-86d6-27c2d4aa6cfe", "itemId": "9d98fb2d-8137-4894-8707-6ab966ed89b4"},
    {"text": "Posisi siku sejajar dengan meja/keyboard.", "categoryId": "9d98fb2d-4baf-4a9d-86d6-27c2d4aa6cfe", "itemId": "9d98fb2d-9f38-48eb-850f-89550d795d80"},
    {"text": "Posisi kaki tidak menggantung dan tidak menekuk.", "categoryId": "9d98fb2d-4baf-4a9d-86d6-27c2d4aa6cfe", "itemId": "9d98fb2d-a3af-438f-a955-e725fdd6a080"},
    {"text": "Posisi layar sejajar dengan mata.", "categoryId": "9d98fb2d-4baf-4a9d-86d6-27c2d4aa6cfe", "itemId": "9d98fb2d-aba7-444c-8454-803136f0e952"},
    {"text": "Melihat ke arah jauh setiap 30 menit melihat layar.", "categoryId": "9d98fb2d-4baf-4a9d-86d6-27c2d4aa6cfe", "itemId": "9d98fb2d-b2af-42d3-8780-858277c57f3f"},
    {"text": "Melakukan stretching setiap 1 jam duduk.", "categoryId": "9d98fb2d-4baf-4a9d-86d6-27c2d4aa6cfe", "itemId": "9d98fb2d-b94b-4b4c-8398-00cb548b0078"},
    {"text": "Minum 200 ml (segelas) air mineral setiap 2 jam.", "categoryId": "9d98fb2d-4baf-4a9d-86d6-27c2d4aa6cfe", "itemId": "9d98fb2d-c0cc-4523-947e-3abeb077622f"},

    // Keselamatan
    {"category": "Keselamatan", "text": "Tidak ada benda berbahaya di dekat peralatan kerja (misalnya air yang terbuka, dsb).", "categoryId": "9d98fb2d-5b60-4836-ac6b-395a36f4f897", "itemId": "9d98fb2d-ca72-4f0c-8b1d-365feeb36788"},
    {"text": "Kabel tertata rapi dan tidak terbuka.", "categoryId": "9d98fb2d-5b60-4836-ac6b-395a36f4f897", "itemId": "9d98fb2d-d03d-420f-9640-e28ac51fffbd"},
    {"text": "Stop kontak aman dan tidak terbuka.", "categoryId": "9d98fb2d-5b60-4836-ac6b-395a36f4f897", "itemId": "9d98fb2d-d6ce-47ee-a66c-1c5a831bd950"},
    {"text": "Peralatan kerja dirapikan kembali setelah digunakan.", "categoryId": "9d98fb2d-5b60-4836-ac6b-395a36f4f897", "itemId": "9d98fb2d-dcff-468c-b398-9cd9bdaef735"},

    // Karakter
    {"category": "Karakter", "text": "Berdoa sebelum dan sesudah bekerja.", "categoryId": "9d98fb2d-667b-4ff8-895a-d2f97f3d2c64", "itemId": "9d98fb2e-d5d2-40fa-9938-956a541d775e"},
    {"text": "Bagi muslim, melaksanakan sholat tepat waktu (tidak menunda-nunda).", "categoryId": "9d98fb2d-667b-4ff8-895a-d2f97f3d2c64", "itemId": "9d98fb2f-16e5-4726-bedc-d89dd1b9c445"},
    {"text": "Berkomitmen pada pekerjaan/tugas.", "categoryId": "9d98fb2d-667b-4ff8-895a-d2f97f3d2c64", "itemId": "9d98fb2f-1fbe-4c61-a36f-228ee2db8b4e"},
    {"text": "Berpartisipasi dalam tim dan membantu teman.", "categoryId": "9d98fb2d-667b-4ff8-895a-d2f97f3d2c64", "itemId": "9d98fb2f-8e1f-496d-a392-00ac17f3f73b"},
    {"text": "Menghormati rekan kerja (Ucapan Maaf dan Terima Kasih).", "categoryId": "9d98fb2d-667b-4ff8-895a-d2f97f3d2c64", "itemId": "9d98fb2f-9986-4eb6-8993-6ecb0e673a43"},
    {"text": "Terbiasa Wajib Ngulik untuk meningkatkan pemahaman/penguasaan materi dan pemecahan masalah.", "categoryId": "9d98fb2d-667b-4ff8-895a-d2f97f3d2c64", "itemId": "9d98fb2f-a2cf-4def-a761-92ed1c64b5e6"},
  ];

  void _updateSaveButtonVisibility() {
    setState(() {
      _showSaveButton = _isChecked.contains(true);
    });
  }

  void _onSubmit() {
    List<Map<String, String>> submittedData = [];
    for (int i = 0; i < _isChecked.length; i++) {
      if (_isChecked[i]) {
        submittedData.add({
          "is_completed": "true",
          "category_id": _items[i]["categoryId"],
          "item_id": _items[i]["itemId"],
        });
      }
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Berhasil menyimpan ${submittedData.length} poin pembiasaan!")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // HEADER CUSTOM (Sesuai request tombol kembali manual)
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    borderRadius: BorderRadius.circular(8),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.arrow_back_ios_new, size: 18, color: fromCssColor("#02398C")),
                          const SizedBox(width: 8),
                          Text(
                            "Kembali",
                            style: GoogleFonts.poppins(
                              fontSize: 16, 
                              fontWeight: FontWeight.w600,
                              color: fromCssColor("#02398C"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    "Rabu, 17 Des 2025",
                    style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),

            // ISI TABEL
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 100),
                child: Column(
                  children: [
                    // TABEL UTAMA
                    Table(
                      border: TableBorder.all(
                        color: Colors.grey.shade200, 
                        width: 1,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      columnWidths: const {
                        0: FlexColumnWidth(4), // Kolom teks lebih lebar
                        1: FixedColumnWidth(70), // Kolom checklist fix
                      },
                      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                      children: _buildTableRows(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // TOMBOL SIMPAN
      floatingActionButton: _showSaveButton
          ? FloatingActionButton.extended(
              onPressed: _onSubmit,
              backgroundColor: fromCssColor("#02398C"),
              label: Text("Simpan", style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: Colors.white)),
              icon: const Icon(Icons.check, color: Colors.white),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  List<TableRow> _buildTableRows() {
    List<TableRow> rows = [];
    String currentCategory = "";

    for (int i = 0; i < _items.length; i++) {
      final item = _items[i];
      final String category = item["category"] ?? currentCategory;

      // --- HEADER KATEGORI ---
      if (category != currentCategory) {
        currentCategory = category;
        rows.add(
          TableRow(
            decoration: BoxDecoration(
              color: const Color(0xFFF1F5F9), // Warna abu/biru muda halus
            ),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Text(
                  category,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold, 
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Center(
                  child: Text(
                    "Sesuai", 
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold, 
                      fontSize: 12,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }

      // --- ITEM BARIS ---
      rows.add(
        TableRow(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          children: [
            // Kolom 1: Teks
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Text(
                item["text"], 
                style: GoogleFonts.poppins(fontSize: 13.5, height: 1.5, color: Colors.black87),
              ),
            ),
            // Kolom 2: Checkbox (Interactive)
            TableRowInkWell(
              onTap: () {
                setState(() {
                  _isChecked[i] = !_isChecked[i];
                  _updateSaveButtonVisibility();
                });
              },
              child: Container(
                height: 60, // Tinggi minimum agar mudah ditekan
                alignment: Alignment.center,
                child: Icon(
                  _isChecked[i] ? Icons.check_box : Icons.check_box_outline_blank,
                  color: _isChecked[i] ? fromCssColor("#02398C") : Colors.grey.shade400,
                  size: 28,
                ),
                // CATATAN: Jika ingin kembali pakai Gambar, ganti Icon di atas dengan:
                // Image.asset(
                //   _isChecked[i] ? 'assets/svg/checked.png' : 'assets/svg/unchecked.png',
                //   width: 24, height: 24,
                // ),
              ),
            ),
          ],
        ),
      );
    }

    return rows;
  }
}