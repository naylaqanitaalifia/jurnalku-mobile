// lib/screens/explore/explore_screen.dart

import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:jurnalku_mobile/widgets/app_navbar.dart';
import 'package:jurnalku_mobile/models/user_model.dart'; // Pastikan path ini benar
import 'package:cached_network_image/cached_network_image.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  // State Management
  List<User> _allUsers = [];
  bool _isLoading = true;
  String _errorMessage = '';

  int _currentPage = 1;
  final int _itemsPerPage = 12;

  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  String? _selectedRombel = 'Semua Rombel';
  String? _selectedRayon = 'Semua Rayon';
  String? _selectedJurusan = 'Semua Jurusan';
  bool _isFilterExpanded = false;

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  // Fetch data dari API Laravel
  Future<void> _fetchUsers() async {
    try {
      final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/users'));

      if (response.statusCode == 200) {
        final List jsonData = json.decode(response.body);
        setState(() {
          _allUsers = jsonData.map((item) => User.fromJson(item)).toList();
          _isLoading = false;
        });
      } else {
        setState(() {
          _errorMessage = "Gagal memuat data: ${response.statusCode}";
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = "Koneksi gagal: $e";
        _isLoading = false;
      });
    }
  }

  // Unique values untuk dropdown filter
  List<String> get _uniqueRombels {
    final rombels = _allUsers.map((s) => s.rombel).toSet().toList();
    rombels.sort();
    return ['Semua Rombel', ...rombels];
  }

  List<String> get _uniqueRayons {
    final rayons = _allUsers.map((s) => s.rayon).toSet().toList();
    rayons.sort();
    return ['Semua Rayon', ...rayons];
  }

  List<String> get _uniqueJurusans {
    final jurusans = _allUsers.map((s) => s.rombel.split(' ')[0]).toSet().toList();
    jurusans.sort();
    return ['Semua Jurusan', ...jurusans];
  }

  @override
  Widget build(BuildContext context) {
    // Logika Filter
    final filteredStudents = _allUsers.where((student) {
      final name = student.name.toLowerCase();
      final nis = student.nis.toLowerCase();
      final rombel = student.rombel.toLowerCase();
      final rayon = student.rayon.toLowerCase();
      final jurusan = student.rombel.split(' ')[0].toLowerCase();

      final matchesSearch = name.contains(_searchQuery.toLowerCase()) ||
          nis.contains(_searchQuery.toLowerCase()) ||
          rombel.contains(_searchQuery.toLowerCase());

      final matchesRombel = _selectedRombel == 'Semua Rombel' || student.rombel == _selectedRombel;
      final matchesRayon = _selectedRayon == 'Semua Rayon' || student.rayon == _selectedRayon;
      final matchesJurusan = _selectedJurusan == 'Semua Jurusan' ||
          jurusan == _selectedJurusan!.toLowerCase();

      return matchesSearch && matchesRombel && matchesRayon && matchesJurusan;
    }).toList();

    // Logika Pagination
    final totalStudents = filteredStudents.length;
    final startIndex = totalStudents == 0 ? 0 : (_currentPage - 1) * _itemsPerPage;
    final endIndex = (startIndex + _itemsPerPage).clamp(0, totalStudents);
    final displayedStudents = totalStudents == 0
        ? <User>[]
        : filteredStudents.sublist(startIndex, endIndex);

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Column(
        children: [
          // Navbar
          const AppNavbar(
            name: "M.Reysha Nova Arshandy",
            kelas: "PPLG XII-5",
            photoUrl: "https://ui-avatars.com/api/?name=M+Reysha",
            title: "Jelajahi",
          ),

          // Header: Banner + Search + Filter
          _buildHeaderSection(),

          // Daftar Siswa
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _errorMessage.isNotEmpty
                    ? Center(child: Text(_errorMessage))
                    : Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Menampilkan ${totalStudents == 0 ? 0 : startIndex + 1}–$endIndex dari $totalStudents siswa",
                              style: GoogleFonts.poppins(
                                  fontSize: 13, color: Colors.grey[600]),
                            ),
                            const SizedBox(height: 16),

                            Expanded(
                              child: displayedStudents.isEmpty
                                  ? const Center(child: Text("Data tidak ditemukan"))
                                  : ListView.separated(
                                      itemCount: displayedStudents.length,
                                      separatorBuilder: (_, __) =>
                                          const SizedBox(height: 12),
                                      itemBuilder: (context, index) {
                                        final s = displayedStudents[index];
                                        return _buildStudentCard(s);
                                      },
                                    ),
                            ),

                            // Pagination Controls
                            _buildPaginationControls(totalStudents, endIndex),
                          ],
                        ),
                      ),
          ),
        ],
      ),
    );
  }

  // Header Section (Banner + Search + Filter)
  Widget _buildHeaderSection() {
    return Container(
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
              style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Text(
              "Temukan dan jelajahi profil siswa SMK Wikrama Bogor",
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.white),
            ),
            const SizedBox(height: 20),

            // Search & Filter Box
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  // Search Row
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            hintText: "Cari nama siswa, NIS, atau rombel...",
                            hintStyle: GoogleFonts.poppins(
                                color: Colors.grey[500], fontSize: 13),
                            prefixIcon:
                                const Icon(Icons.search, color: Colors.grey),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Colors.grey.shade300)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Colors.grey.shade300)),
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
                        style: ElevatedButton.styleFrom(
                            backgroundColor: fromCssColor("#02398C")),
                        child: Text("Cari",
                            style: GoogleFonts.poppins(color: Colors.white)),
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
                        Text("Filter Lanjutan",
                            style:
                                GoogleFonts.poppins(color: Colors.white)),
                      ],
                    ),
                    backgroundColor: fromCssColor("#02398C"),
                    collapsedBackgroundColor: fromCssColor("#02398C"),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onExpansionChanged: (v) =>
                        setState(() => _isFilterExpanded = v),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            DropdownButtonFormField<String>(
                              value: _selectedRombel,
                              decoration:
                                  const InputDecoration(labelText: "Rombel"),
                              items: _uniqueRombels
                                  .map((e) =>
                                      DropdownMenuItem(value: e, child: Text(e)))
                                  .toList(),
                              onChanged: (v) => setState(() => _selectedRombel = v),
                            ),
                            const SizedBox(height: 8),
                            DropdownButtonFormField<String>(
                              value: _selectedRayon,
                              decoration:
                                  const InputDecoration(labelText: "Rayon"),
                              items: _uniqueRayons
                                  .map((e) =>
                                      DropdownMenuItem(value: e, child: Text(e)))
                                  .toList(),
                              onChanged: (v) => setState(() => _selectedRayon = v),
                            ),
                            const SizedBox(height: 8),
                            DropdownButtonFormField<String>(
                              value: _selectedJurusan,
                              decoration:
                                  const InputDecoration(labelText: "Jurusan"),
                              items: _uniqueJurusans
                                  .map((e) =>
                                      DropdownMenuItem(value: e, child: Text(e)))
                                  .toList(),
                              onChanged: (v) =>
                                  setState(() => _selectedJurusan = v),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () =>
                                        setState(() => _currentPage = 1),
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            fromCssColor("#02398C")),
                                    child: Text("Terapkan Filter",
                                        style: GoogleFonts.poppins(
                                            color: Colors.white)),
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
                                  child: Text("Reset",
                                      style: GoogleFonts.poppins(
                                          color: fromCssColor("#02398C"))),
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
    );
  }

  // Card Siswa
  Widget _buildStudentCard(User s) {
    final String photoUrl = s.photo == 'none' || s.photo.isEmpty
        ? 'https://ui-avatars.com/api/?name=${Uri.encodeComponent(s.name)}'
        : s.photo;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: CachedNetworkImageProvider(photoUrl),
            ),
            const SizedBox(height: 16),
            Text(
              s.name,
              style: GoogleFonts.poppins(
                  fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text(
              "${s.nis} | ${s.rombel} | ${s.rayon}",
              style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey[600]),
            ),
            const Divider(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatIcon(Icons.folder_open,
                    "${s.portfolios.length} portofolio"),
                _buildStatIcon(
                    Icons.verified, "${s.certificates.length} sertifikat"),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  // TODO: Navigasi ke halaman detail siswa, misalnya berdasarkan NIS
                  // Navigator.push(context, MaterialPageRoute(builder: (_) => DetailScreen(nis: s.nis)));
                },
                icon: const Icon(Icons.arrow_forward_ios, size: 16),
                label: Text("Lihat Detail",
                    style: GoogleFonts.poppins()),
                style: ElevatedButton.styleFrom(
                  backgroundColor: fromCssColor("#02398C"),
                  foregroundColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatIcon(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey),
        const SizedBox(width: 4),
        Text(text, style: GoogleFonts.poppins(fontSize: 12)),
      ],
    );
  }

  // Pagination Controls
  Widget _buildPaginationControls(int totalStudents, int endIndex) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton.icon(
          onPressed: _currentPage > 1
              ? () => setState(() => _currentPage--)
              : null,
          icon: const Icon(Icons.chevron_left),
          label: const Text("Previous"),
        ),
        TextButton.icon(
          onPressed: endIndex < totalStudents
              ? () => setState(() => _currentPage++)
              : null,
          label: const Text("Next"),
          icon: const Icon(Icons.chevron_right),
        ),
      ],
    );
  }
}