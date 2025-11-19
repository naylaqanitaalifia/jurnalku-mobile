// lib/screens/profile/student_profile_page.dart
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:jurnalku_mobile/widgets/app_navbar.dart';

class StudentProfilePage extends StatefulWidget {
  const StudentProfilePage({Key? key}) : super(key: key);

  @override
  State<StudentProfilePage> createState() => _StudentProfilePageState();
}

class _StudentProfilePageState extends State<StudentProfilePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final String name = "M.Reysha Nova Arshandy";
  final String nis = "12309727";
  final String kelas = "PPLG XII-5";
  final String rayon = "Cic 9";
  final String photoUrl =
      "https://jurnalku.smkwikrama.sch.id/storage/jurnalku/photo_profile/student/12309727_1733272448.jpg";
  final String coverUrl =
      "https://jurnalku.smkwikrama.sch.id/assets/img/cover/wikrama-mewah.png";

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: Column(
        children: [
          // Navbar Profil (hanya ikon Settings biru polos)
          AppNavbar(
            name: name,
            kelas: kelas,
            photoUrl: photoUrl,
            isProfilePage: true,
            title: "Profil Saya",
          ),

          // KONTEN UTAMA
          Expanded(
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxScrolled) => [
                SliverToBoxAdapter(
                  child: _buildHeader(),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: _SliverTabBarDelegate(
                    TabBar(
                      controller: _tabController,
                      labelColor: const Color(0xFF02398C),
                      unselectedLabelColor: Colors.grey[600],
                      indicatorColor: const Color(0xFF02398C),
                      labelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                      tabs: const [
                        Tab(text: "Overview"),
                        Tab(text: "Portfolio"),
                        Tab(text: "Sertifikat"),
                      ],
                    ),
                  ),
                ),
              ],
              body: TabBarView(
                controller: _tabController,
                children: const [
                  OverviewTab(),
                  PortfolioTab(),
                  CertificatesTab(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // HEADER YANG SUDAH DIRAPHIKAN (TIDAK TABRAKAN LAGI!)
  Widget _buildHeader() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(bottom: 100), // INI KUNCI: beri ruang cukup untuk tab
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          // Cover
          CachedNetworkImage(
            imageUrl: coverUrl,
            height: 260,
            width: double.infinity,
            fit: BoxFit.cover,
            placeholder: (_, __) => Container(color: Colors.grey[300]),
          ),
          Container(
            height: 260,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black.withOpacity(0.75)],
              ),
            ),
          ),

          // Foto Profil + Nama + Info (posisi dikontrol ketat)
          Positioned(
            bottom: -90, // naikkan sedikit biar tidak terlalu turun
            child: Column(
              children: [
                // Foto Profil
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 15,
                        offset: Offset(0, 8),
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 78,
                    backgroundImage: CachedNetworkImageProvider(photoUrl),
                  ),
                ),

                const SizedBox(height: 20),

                // Nama
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 8),

                // NIS • Kelas • Rayon
                Text(
                  "$nis • $kelas • $rayon",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w500,
                  ),
                ),

                // Jarak aman sebelum tab muncul
                const SizedBox(height: 10), // INI YANG BIKIN TAB TIDAK TABRAKAN!
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Sticky TabBar
class _SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;
  const _SliverTabBarDelegate(this.tabBar);

  @override
  double get minExtent => tabBar.preferredSize.height;
  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => false;
}

// Placeholder Tabs
class OverviewTab extends StatelessWidget {
  const OverviewTab({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Overview\nStatistik kompetensi akan muncul di sini",
        style: TextStyle(fontSize: 18, color: Colors.grey[700]),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class PortfolioTab extends StatelessWidget {
  const PortfolioTab({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => const Center(child: Text("Portfolio", style: TextStyle(fontSize: 18)));
}

class CertificatesTab extends StatelessWidget {
  const CertificatesTab({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => const Center(child: Text("Sertifikat", style: TextStyle(fontSize: 18)));
}