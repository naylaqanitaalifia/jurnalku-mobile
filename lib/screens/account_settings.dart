import 'package:flutter/material.dart';
import 'package:jurnalku_mobile/widgets/app_input_field.dart';
import 'package:jurnalku_mobile/widgets/app_navbar.dart';
import 'package:jurnalku_mobile/utils/app_colors.dart';

class AccountSettings extends StatefulWidget {
  const AccountSettings({super.key});

  @override
  State<AccountSettings> createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {
  final TextEditingController namaController =
  TextEditingController(text: 'Nayla Qanita Alifia');
  final TextEditingController nisController =
    TextEditingController(text: '123456789');
  final TextEditingController rombelController =
    TextEditingController(text: 'PPLG XII-5');
  final TextEditingController rayonController =
    TextEditingController(text: 'Ciawi 1');

  @override

  Widget build(BuildContext context) {
    return Scaffold (
      backgroundColor: AppColors.bgColor,
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
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pengaturan Akun',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),

                      Row(
                        children: [
                          Text(
                          'Dashboard / ',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'Pengaturan Akun',
                            style: TextStyle(
                              color: Color(0xFF02398c),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),

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
                                color: AppColors.textSecondary,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            const SizedBox(height: 24),

                            AppInputField(
                              label: 'Nama',
                              controller: namaController,
                              readOnly: true,
                            ),
                            const SizedBox(height: 12),

                            AppInputField(
                              label: 'NIS',
                              controller: nisController,
                              readOnly: true,
                            ),
                            const SizedBox(height: 12),

                            AppInputField(
                              label: 'Rombel',
                              controller: rombelController,
                              readOnly: true,
                            ),
                            const SizedBox(height: 12),

                            AppInputField(
                              label: 'Rayon',
                              controller: rayonController,
                              readOnly: true,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),

                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
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