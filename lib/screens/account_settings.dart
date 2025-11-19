import 'package:flutter/material.dart';
import 'package:jurnalku_mobile/widgets/app_input_field.dart';
import 'package:jurnalku_mobile/widgets/app_navbar.dart';

class AccountSettings extends StatefulWidget {
  const AccountSettings({super.key});

  @override
  State<AccountSettings> createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {
  @override

  Widget build(BuildContext context) {
    return Scaffold (
      backgroundColor: Colors.white,
      body: Column(
        children: [
          AppNavbar(
            name: 'Nayla Qanita Alifia',
            kelas: 'PPLG XII-5',
            photoUrl: 'assets/images/profile.jpg',
          ),
          Expanded(
            child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Color(0xFFebeef3),
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Informasi Profil',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 20),

                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: 120,
                                  height: 120,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Color(0xFFd0d5dd),
                                      width: 4,
                                    ),
                                  ),
                                  child: ClipOval(
                                    child: Image.asset(
                                      'assets/images/profile.jpg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),

                                Positioned(
                                  bottom: 4,
                                  right: 4,
                                  child: GestureDetector(
                                    onTap: () {
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xFF02398C),
                                      ),
                                      child: const Icon(
                                        Icons.camera_alt_outlined,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),

                            Text(
                              'Klik untuk mengubah foto',
                              style: TextStyle(
                                color: Color(0xFF71758a),
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            const SizedBox(height: 24),

                            AppInputField(
                              label: 'Nama',
                              readOnly: true,
                            ),
                            const SizedBox(height: 12),

                            AppInputField(
                              label: 'NIS',
                              readOnly: true,
                            ),
                            const SizedBox(height: 12),

                            AppInputField(
                              label: 'Rombel',
                              readOnly: true,
                            ),
                            const SizedBox(height: 12),

                            AppInputField(
                              label: 'Rayon',
                              readOnly: true,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),

                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Color(0xFFebeef3),
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Ubah Kata Sandi',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 20),
                            
                            AppInputField(
                              label: 'Kata Sandi Lama',
                              hintText: 'Masukkan password',
                              isPassword: true,
                              readOnly: false,
                            ),
                            const SizedBox(height: 4),

                            Text(
                              'Masukkan kata sandi lama Anda',
                              style: TextStyle(
                                color: Color(0xFF71758a),
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 12),

                            AppInputField(
                              label: 'Kata Sandi Baru',
                              hintText: 'Masukkan password',
                              isPassword: true,
                              readOnly: false,
                            ),
                            const SizedBox(height: 24),

                            ElevatedButton(
                              onPressed: () {
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF02398c),
                                padding: const EdgeInsets.symmetric(vertical: 14),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  'Simpan Perubahan',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
            )
          )
        ]
      ),
    );
  }
}