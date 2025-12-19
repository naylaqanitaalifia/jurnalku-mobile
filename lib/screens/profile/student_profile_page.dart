// lib/screens/profile/student_profile_page.dart
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';

import 'package:jurnalku_mobile/providers/auth_provider.dart';
import 'package:jurnalku_mobile/models/user_model.dart';
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
    final User? user = context.watch<AuthProvider>().user;

    if (user == null) {
      return const Scaffold(
        body: Center(child: Text("User belum login")),
      );
    }

    final String name = user.name;
    final String nis = user.nis;
    final String kelas = user.rombel.toUpperCase().replaceAll('-', ' ');
    final String rayon = user.rayon.replaceAll('-', ' ');
    final String photoUrl = user.photo == 'none'
        ? 'https://ui-avatars.com/api/?name=${Uri.encodeComponent(user.name)}'
        : user.photo;

    final String coverUrl =
        "https://jurnalku.smkwikrama.sch.id/assets/img/cover/wikrama-mewah.png";

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
                SliverToBoxAdapter(
                  child: _buildHeader(
                    name: name,
                    nis: nis,
                    kelas: kelas,
                    rayon: rayon,
                    photoUrl: photoUrl,
                    coverUrl: coverUrl,
                  ),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: _SliverTabBarDelegate(
                    TabBar(
                      controller: _tabController,
                      labelColor: const Color(0xFF02398C),
                      unselectedLabelColor: Colors.grey[600],
                      indicatorColor: const Color(0xFF02398C),
                      labelStyle: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
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
                children: [
                  OverviewTab(),
                  PortfolioTabContent(),
                  CertificatesTabContent(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader({
    required String name,
    required String nis,
    required String kelas,
    required String rayon,
    required String photoUrl,
    required String coverUrl,
  }) {
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
          ),
          Container(
            height: 260,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.75),
                ],
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
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 15,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 78,
                    backgroundImage:
                        CachedNetworkImageProvider(photoUrl),
                  ),
                ),
                const SizedBox(height: 25),
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "$nis • $kelas • $rayon",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Fitur share segera hadir"),
                      ),
                    );
                  },
                  child: const Icon(
                    Icons.share_outlined,
                    size: 24,
                    color: Color(0xFF374151),
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

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(color: Colors.white, child: tabBar);
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
