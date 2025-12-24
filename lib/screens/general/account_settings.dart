import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:from_css_color/from_css_color.dart';

import 'package:jurnalku_mobile/models/user_model.dart';
import 'package:jurnalku_mobile/services/user_service.dart';
import 'package:jurnalku_mobile/widgets/app_navbar.dart';
import 'package:jurnalku_mobile/widgets/app_input_field.dart';

class AccountSettings extends StatefulWidget {
  const AccountSettings({super.key});

  @override
  State<AccountSettings> createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {
  final UserService _userService = UserService();

  User? user;
  bool isLoading = true;

  late TextEditingController nameController;
  late TextEditingController nisController;
  late TextEditingController rombelController;
  late TextEditingController rayonController;
  late TextEditingController oldPasswordController;
  late TextEditingController newPasswordController;

  @override
  void initState() {
    super.initState();

    // INIT CONTROLLER (KOSONG DULU)
    nameController = TextEditingController();
    nisController = TextEditingController();
    rombelController = TextEditingController();
    rayonController = TextEditingController();
    oldPasswordController = TextEditingController();
    newPasswordController = TextEditingController();

    _getUser();
  }

  Future<void> _getUser() async {
    try {
      final users = await _userService.fetchUsers();
      final u = users.first; // sementara karena belum login

      // ISI DATA KE CONTROLLER
      nameController.text = u.name;
      nisController.text = u.nis;
      rombelController.text = u.rombel;
      rayonController.text = u.rayon;

      setState(() {
        user = u;
        isLoading = false;
      });
    } catch (e) {
      debugPrint('Error fetch user: $e');
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    nisController.dispose();
    rombelController.dispose();
    rayonController.dispose();
    oldPasswordController.dispose();
    newPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 🔥 LOADING GUARD (WAJIB)
    if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: Column(
        children: [
          /// NAVBAR (PAKAI DATA API)
          AppNavbar(
            name: user!.name,
            kelas: user!.rombel.toUpperCase(),
            photoUrl: user!.photo == 'none' ? null : user!.photo,
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  /// INFORMASI PROFIL
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xFFEBEEF3)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Informasi Profil",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 24),

                        AppInputField(
                          label: "Nama",
                          controller: nameController,
                          readOnly: true, initialValue: '',
                        ),
                        const SizedBox(height: 12),

                        AppInputField(
                          label: "NIS",initialValue: '',
                          controller: nisController,
                          readOnly: true,
                        ),
                        const SizedBox(height: 12),

                        AppInputField(
                          label: "Rombel", initialValue: '',
                          controller: rombelController,
                          readOnly: true,
                        ),
                        const SizedBox(height: 12),

                        AppInputField(
                          label: "Rayon", initialValue: '',
                          controller: rayonController,
                          readOnly: true,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  /// UBAH PASSWORD (INPUT MANUAL)
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xFFEBEEF3)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ubah Kata Sandi",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 20),

                        AppInputField(
                          label: "Kata Sandi Lama", initialValue: '',
                          controller: oldPasswordController,
                          isPassword: true,
                        ),
                        const SizedBox(height: 12),

                        AppInputField(
                          label: "Kata Sandi Baru", initialValue: '',
                          controller: newPasswordController,
                          isPassword: true,
                        ),
                        const SizedBox(height: 24),

                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              // nanti kirim ke API
                              debugPrint(oldPasswordController.text);
                              debugPrint(newPasswordController.text);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  fromCssColor("#02398C"),
                              padding: const EdgeInsets.symmetric(
                                vertical: 16,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text(
                              "Simpan Perubahan",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}