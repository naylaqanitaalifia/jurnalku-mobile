import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jurnalku_mobile/screens/main_wrapper.dart';
import 'package:jurnalku_mobile/widgets/app_input_field.dart';
import 'package:jurnalku_mobile/screens/explore/explore_screen.dart';

// SERVICE & MODEL
import 'package:jurnalku_mobile/services/user_service.dart';
import 'package:jurnalku_mobile/models/user_model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  final UserService _userService = UserService();
  User? _loggedInUser;

  List<Map<String, dynamic>> get data => [
        {
          "icon": Icons.school_outlined,
          "title": "Dirancang untuk Sekolah Kami",
          "subtitle": "Pada saat ini, aplikasi ini dibuat untuk Sekolah Kami.",
        },
        {
          "icon": Icons.schema_outlined,
          "title": "Pemantauan yang Terstruktur",
          "subtitle":
              "Memudahkan guru dalam menyusun dan memantau daftar kompetensi keahlian yang harus dikuasai siswa.",
        },
        {
          "icon": Icons.person,
          "title": "Fitur Praktis dan Bermanfaat",
          "subtitle":
              "Termasuk reminder otomatis, grafik perkembangan, dan analisis mendalam untuk efektivitas belajar.",
        },
        {
          "icon": Icons.school,
          "title": "Pengajuan Kompetensi oleh Siswa",
          "subtitle":
              "Siswa dapat mengajukan kompetensi yang telah dikuasai untuk diverifikasi oleh guru.",
        },
        {
          "icon": Icons.list_alt,
          "title": "Validasi dan Tanda Tangan Guru",
          "subtitle":
              "Setiap kompetensi yang disetujui akan diberikan tanda terima dan tanda tangan guru sebagai bukti.",
        },
        {
          "icon": Icons.monitor,
          "title": "Pantauan Real-Time dan Transparan",
          "subtitle": "Monitoring langsung, menciptakan lingkungan belajar yang efisien.",
        },
      ];

  // =========================
  // LOGIN LOGIC
  // =========================
  void _login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final users = await _userService.fetchUsers();

      final inputUsername = _usernameController.text.trim();
      final inputPassword = _passwordController.text.trim();

      final User? user = users.cast<User?>().firstWhere(
        (u) =>
            u!.nis == inputUsername ||
            u.name.toLowerCase() == inputUsername.toLowerCase(),
        orElse: () => null,
      );

      if (user == null) throw Exception("User tidak ditemukan");
      if (inputPassword != user.nis) throw Exception("Password salah");

      _loggedInUser = user;

      if (!mounted) return;

      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const MainWrapper()),
        (route) => false,
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString().replaceAll('Exception:', '').trim(),
          ),
          backgroundColor: Colors.redAccent,
        ),
      );
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),

      // =========================
      // FLOATING ACTION BUTTON
      // =========================
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 16, right: 8),
        child: FloatingActionButton(
          backgroundColor: fromCssColor("#02398C"),
          child: const Icon(Icons.explore, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ExploreScreen()),
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

      // =========================
      // BODY
      // =========================
      body: SingleChildScrollView(
        child: Column(
          children: [
            // =========================
            // BANNER + CENTERED FORM
            // =========================
            Container(
              height: MediaQuery.of(context).size.height * 0.65,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/Banner-Web.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              RichText(
                                text: TextSpan(
                                  style: GoogleFonts.poppins(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                  children: [
                                    const TextSpan(text: "Masuk untuk memulai "),
                                    TextSpan(
                                      text: "Jurnalku",
                                      style: TextStyle(
                                        color: fromCssColor("#02398C"),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 40),

                              AppInputField(
                                label: "Username atau NIS",
                                hintText: "Masukkan username atau NIS",
                                controller: _usernameController,
                                initialValue: '',
                                validator: (val) =>
                                    val == null || val.isEmpty
                                        ? "Username/NIS wajib diisi"
                                        : null,
                              ),
                              const SizedBox(height: 20),

                              AppInputField(
                                label: "Password",
                                hintText: "Masukkan password",
                                controller: _passwordController,
                                isPassword: true,
                                initialValue: '',
                                validator: (val) =>
                                    val == null || val.isEmpty
                                        ? "Password wajib diisi"
                                        : null,
                              ),
                              const SizedBox(height: 32),

                              SizedBox(
                                width: double.infinity,
                                height: 52,
                                child: ElevatedButton(
                                  onPressed:
                                      _isLoading ? null : _login,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        fromCssColor("#02398C"),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: _isLoading
                                      ? const SizedBox(
                                          height: 20,
                                          width: 20,
                                          child:
                                              CircularProgressIndicator(
                                            color: Colors.white,
                                            strokeWidth: 2,
                                          ),
                                        )
                                      : Text(
                                          "Masuk",
                                          style: GoogleFonts.poppins(
                                            fontSize: 16,
                                            fontWeight:
                                                FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                ),
                              ),
                              const SizedBox(height: 24),

                              Text(
                                "Lupa password? Hubungi guru laboran.",
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: Colors.grey[700],
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 40),

            // =========================
            // FEATURE SECTION
            // =========================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Text(
                    "Menyatukan Upaya untuk Kemajuan Siswa",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Jurnalku adalah aplikasi cerdas yang membantu guru dan siswa dalam memantau dan mengelola kompetensi keahlian siswa secara efektif.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(fontSize: 15),
                  ),
                  const SizedBox(height: 40),

                  ...data.map(
                    (item) => Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(16),
                        border: Border.all(
                          color: fromCssColor("#E2E8F0"),
                          width: 1.5,
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            item["icon"],
                            size: 36,
                            color: fromCssColor("#02398C"),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item["title"],
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  item["subtitle"],
                                  style: GoogleFonts.poppins(
                                      fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}