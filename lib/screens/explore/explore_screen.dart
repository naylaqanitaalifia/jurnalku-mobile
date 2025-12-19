// lib/screens/explore/explore_screen.dart
import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jurnalku_mobile/widgets/app_navbar.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  int _currentPage = 1;
  final int _itemsPerPage = 12;
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();
  String? _selectedRombel = 'Semua Rombel';
  String? _selectedRayon = 'Semua Rayon';
  String? _selectedJurusan = 'Semua Jurusan';
  bool _isFilterExpanded = false;

  // Dummy Data Siswa (bisa diganti API nanti)
  final List<Map<String, dynamic>> studentDatas = [
    // ... (sama persis seperti yang kamu kasih, aku taruh di bawah biar rapi)
    {"name": "Alya Ramadhani", "nis": 12345001, "rombel": "PPLG XII-5", "rayon": "Cia 2", "count_portofolio": 3, "count_sertificate": 12, "profile_image": "assets/images/student-1.jpg"},
    {"name": "Rizky Pratama", "nis": 12345002, "rombel": "PPLG XII-5", "rayon": "Cib 3", "count_portofolio": 1, "count_sertificate": 8, "profile_image": "assets/images/student-1.jpg"},
    {"name": "Siti Nurhaliza", "nis": 12345003, "rombel": "PPLG XII-5", "rayon": "Taj 4", "count_portofolio": 4, "count_sertificate": 10, "profile_image": "assets/images/student-1.jpg"},
    {"name": "Dandy Mahaputra", "nis": 12345004, "rombel": "PPLG XII-5", "rayon": "Cia 1", "count_portofolio": 2, "count_sertificate": 5, "profile_image": "assets/images/student-1.jpg"},
    {"name": "Putri Maharani", "nis": 12345005, "rombel": "PPLG XII-5", "rayon": "Cib 2", "count_portofolio": 5, "count_sertificate": 14, "profile_image": "assets/images/student-1.jpg"},
    {"name": "Fajar Alfarizi", "nis": 12345006, "rombel": "PPLG XII-5", "rayon": "Taj 3", "count_portofolio": 3, "count_sertificate": 9, "profile_image": "assets/images/student-1.jpg"},
    {"name": "Nadya Septiani", "nis": 12345007, "rombel": "PPLG XII-5", "rayon": "Cia 3", "count_portofolio": 6, "count_sertificate": 11, "profile_image": "assets/images/student-1.jpg"},
    {"name": "Bagas Suryawan", "nis": 12345008, "rombel": "PPLG XII-5", "rayon": "Cib 1", "count_portofolio": 2, "count_sertificate": 4, "profile_image": "assets/images/student-1.jpg"},
    {"name": "Melati Anggraini", "nis": 12345009, "rombel": "PPLG XII-5", "rayon": "Taj 5", "count_portofolio": 4, "count_sertificate": 13, "profile_image": "assets/images/student-1.jpg"},
    {"name": "Raka Firmansyah", "nis": 12345010, "rombel": "PPLG XII-5", "rayon": "Cia 4", "count_portofolio": 1, "count_sertificate": 6, "profile_image": "assets/images/student-1.jpg"},
    {"name": "Citra Lestari", "nis": 12345011, "rombel": "PPLG XII-5", "rayon": "Cib 4", "count_portofolio": 5, "count_sertificate": 17, "profile_image": "assets/images/student-1.jpg"},
    {"name": "Kevin Saputra", "nis": 12345012, "rombel": "PPLG XII-5", "rayon": "Taj 2", "count_portofolio": 3, "count_sertificate": 10, "profile_image": "assets/images/student-1.jpg"},
    {"name": "Larissa Adelia", "nis": 12345013, "rombel": "PPLG XII-5", "rayon": "Cia 5", "count_portofolio": 2, "count_sertificate": 9, "profile_image": "assets/images/student-1.jpg"},
    {"name": "Bima Prakoso", "nis": 12345014, "rombel": "PPLG XII-5", "rayon": "Cib 5", "count_portofolio": 4, "count_sertificate": 16, "profile_image": "assets/images/student-1.jpg"},
  ];

  List<String> get _uniqueRombels {
    final rombels = studentDatas.map((s) => s['rombel'] as String).toSet().toList();
    rombels.insert(0, 'Semua Rombel');
    return rombels;
  }

  List<String> get _uniqueRayons {
    final rayons = studentDatas.map((s) => s['rayon'] as String).toSet().toList();
    rayons.insert(0, 'Semua Rayon');
    return rayons;
  }

  List<String> get _uniqueJurusans {
    final jurusans = studentDatas.map((s) => (s['rombel'] as String).split(' ')[0]).toSet().toList();
    jurusans.insert(0, 'Semua Jurusan');
    return jurusans;
  }

  @override
  Widget build(BuildContext context) {
    // Filter siswa
    final filteredStudents = studentDatas.where((student) {
      final name = student['name'].toString().toLowerCase();
      final nis = student['nis'].toString();
      final rombel = student['rombel'].toString().toLowerCase();
      final rayon = student['rayon'].toString().toLowerCase();
      final jurusan = (student['rombel'] as String).split(' ')[0].toLowerCase();

      final matchesSearch = name.contains(_searchQuery.toLowerCase()) ||
          nis.contains(_searchQuery) ||
          rombel.contains(_searchQuery.toLowerCase());

      final matchesRombel = _selectedRombel == 'Semua Rombel' || student['rombel'] == _selectedRombel;
      final matchesRayon = _selectedRayon == 'Semua Rayon' || student['rayon'] == _selectedRayon;
      final matchesJurusan = _selectedJurusan == 'Semua Jurusan' || jurusan == _selectedJurusan!.toLowerCase();

      return matchesSearch && matchesRombel && matchesRayon && matchesJurusan;
    }).toList();

    final totalStudents = filteredStudents.length;
    final startIndex = (_currentPage - 1) * _itemsPerPage;
    final endIndex = (startIndex + _itemsPerPage).clamp(0, totalStudents);
    final displayedStudents = filteredStudents.sublist(startIndex, endIndex.clamp(0, totalStudents));

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Column(
        children: [
          // NAVBAR ATAS
          const AppNavbar(
            name: "M.Reysha Nova Arshandy",
            kelas: "PPLG XII-5",
            photoUrl: "https://jurnalku.smkwikrama.sch.id/storage/jurnalku/photo_profile/student/12309727_1733272448.jpg",
            title: "Jelajahi",
          ),

          // BANNER + SEARCH + FILTER
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/Banner-Web.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    "Direktori Siswa",
                    style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  Text(
                    "Temukan dan jelajahi profil siswa SMK Wikrama Bogor",
                    style: GoogleFonts.poppins(fontSize: 14, color: Colors.white),
                  ),
                  const SizedBox(height: 20),

                  // Search Box
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _searchController,
                                decoration: InputDecoration(
                                  hintText: "Cari nama siswa, NIS, atau rombel...",
                                  hintStyle: GoogleFonts.poppins(color: Colors.grey[500], fontSize: 13),
                                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey.shade300)),
                                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey.shade300)),
                                ),
                                onSubmitted: (_) => setState(() {
                                  _searchQuery = _searchController.text;
                                  _currentPage = 1;
                                }),
                              ),
                            ),
                            const SizedBox(width: 10),
                            ElevatedButton(
                              onPressed: () => setState(() {
                                _searchQuery = _searchController.text;
                                _currentPage = 1;
                              }),
                              style: ElevatedButton.styleFrom(backgroundColor: fromCssColor("#02398C")),
                              child: Text("Cari", style: GoogleFonts.poppins(color: Colors.white)),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        // Filter Lanjutan
                        ExpansionTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.filter_list, color: Colors.white),
                              const SizedBox(width: 8),
                              Text("Filter Lanjutan", style: GoogleFonts.poppins(color: Colors.white)),
                            ],
                          ),
                          backgroundColor: fromCssColor("#02398C"),
                          collapsedBackgroundColor: fromCssColor("#02398C"),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          onExpansionChanged: (v) => setState(() => _isFilterExpanded = v),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                children: [
                                  DropdownButtonFormField<String>(
                                    value: _selectedRombel,
                                    decoration: const InputDecoration(labelText: "Rombel"),
                                    items: _uniqueRombels.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                                    onChanged: (v) => setState(() => _selectedRombel = v),
                                  ),
                                  const SizedBox(height: 8),
                                  DropdownButtonFormField<String>(
                                    value: _selectedRayon,
                                    decoration: const InputDecoration(labelText: "Rayon"),
                                    items: _uniqueRayons.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                                    onChanged: (v) => setState(() => _selectedRayon = v),
                                  ),
                                  const SizedBox(height: 8),
                                  DropdownButtonFormField<String>(
                                    value: _selectedJurusan,
                                    decoration: const InputDecoration(labelText: "Jurusan"),
                                    items: _uniqueJurusans.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                                    onChanged: (v) => setState(() => _selectedJurusan = v),
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: ElevatedButton(
                                          onPressed: () => setState(() => _currentPage = 1),
                                          style: ElevatedButton.styleFrom(backgroundColor: fromCssColor("#02398C")),
                                          child: Text("Terapkan Filter", style: GoogleFonts.poppins(color: Colors.white)),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      TextButton(
                                        onPressed: () => setState(() {
                                          _selectedRombel = 'Semua Rombel';
                                          _selectedRayon = 'Semua Rayon';
                                          _selectedJurusan = 'Semua Jurusan';
                                          _currentPage = 1;
                                        }),
                                        child: Text("Reset", style: GoogleFonts.poppins(color: fromCssColor("#02398C"))),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // LIST SISWA
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Menampilkan ${startIndex + 1}–$endIndex dari $totalStudents siswa",
                    style: GoogleFonts.poppins(fontSize: 13, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 16),

                  Expanded(
                    child: ListView.separated(
                      itemCount: displayedStudents.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        final s = displayedStudents[index];
                        return Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(radius: 40, backgroundImage: AssetImage(s["profile_image"] ?? "assets/images/student-1.jpg")),
                                const SizedBox(height: 16),
                                Text(s["name"], style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600)),
                                const SizedBox(height: 8),
                                Text("${s["nis"]} | ${s["rombel"]} | ${s["rayon"]}", style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey[600])),
                                const Divider(height: 30),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(children: [const Icon(Icons.folder_open, size: 16, color: Colors.grey), const SizedBox(width: 4), Text("${s["count_portofolio"]} portofolio", style: GoogleFonts.poppins(fontSize: 12))]),
                                    Row(children: [const Icon(Icons.verified, size: 16, color: Colors.grey), const SizedBox(width: 4), Text("${s["count_sertificate"]} sertifikat", style: GoogleFonts.poppins(fontSize: 12))]),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton.icon(
                                    onPressed: () {},
                                    icon: const Icon(Icons.arrow_forward_ios, size: 16),
                                    label: Text("Lihat Detail", style: GoogleFonts.poppins()),
                                    style: ElevatedButton.styleFrom(backgroundColor: fromCssColor("#02398C"), foregroundColor: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  // Pagination
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton.icon(
                        onPressed: _currentPage > 1 ? () => setState(() => _currentPage--) : null,
                        icon: const Icon(Icons.chevron_left),
                        label: const Text("Previous"),
                      ),
                      TextButton.icon(
                        onPressed: endIndex < totalStudents ? () => setState(() => _currentPage++) : null,
                        label: const Text("Next"),
                        icon: const Icon(Icons.chevron_right),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}