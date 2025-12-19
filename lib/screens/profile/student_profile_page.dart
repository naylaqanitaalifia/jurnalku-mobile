// lib/screens/profile/student_profile_page.dart
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:jurnalku_mobile/widgets/app_navbar.dart';

// Import widget terpisah
import 'package:jurnalku_mobile/widgets/profile/overview_tab_widget.dart';
import 'package:jurnalku_mobile/widgets/profile/portfolio_tab_widget.dart';
import 'package:jurnalku_mobile/widgets/profile/certificates_tab_widget.dart';

class StudentProfilePage extends StatefulWidget {
  const StudentProfilePage({Key? key}) : super(key: key);

  @override
  State<StudentProfilePage> createState() => _StudentProfilePageState();
}

class _StudentProfilePageState extends State<StudentProfilePage>
    with SingleTickerProviderStateMixin {
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
          AppNavbar(
            name: name,
            kelas: kelas,
            photoUrl: photoUrl,
            isProfilePage: true,
            title: "Profil Saya",
          ),
          

          Expanded(
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxScrolled) => [
                SliverToBoxAdapter(child: _buildHeader()),
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
                        Tab(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Sertifikat"),
                              SizedBox(width: 6),
                              // Badge akan di-update dari CertificatesTabWidget nanti via callback
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
              body: TabBarView(
                controller: _tabController,
                children: const [
                  OverviewTab(),           // Widget terpisah
                  PortfolioTabContent(),   // Widget terpisah
                  CertificatesTabContent(), // Widget terpisah
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(bottom: 160),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
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
          Positioned(
            bottom: -160,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(color: Colors.black26, blurRadius: 15, offset: const Offset(0, 6)),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 78,
                    backgroundImage: CachedNetworkImageProvider(photoUrl),
                  ),
                ),
                const SizedBox(height: 25),
                Text(name, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black87)),
                const SizedBox(height: 8),
                Text("$nis • $kelas • $rayon", style: TextStyle(fontSize: 16, color: Colors.grey[700], fontWeight: FontWeight.w500)),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    // TODO: implement share profile
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Fitur share segera hadir")),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.share_outlined,
                        size: 24,
                        color: Color(0xFF374151)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;
  const _SliverTabBarDelegate(this.tabBar);

  @override double get minExtent => tabBar.preferredSize.height;
  @override double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(color: Colors.white, child: tabBar);
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => false;
}