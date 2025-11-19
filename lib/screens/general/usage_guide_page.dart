import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UsageGuidePage extends StatefulWidget {
  const UsageGuidePage({super.key});

  @override
  State<UsageGuidePage> createState() => _UsageGuidePageState();
}

class _UsageGuidePageState extends State<UsageGuidePage> {

  // Data panduan penggunaan bagian umum
  List<Map<String, dynamic>> get generalUsageGuide => [
    {
      "icon": Icons.list_alt,
      "title": "Unggah Profile",
      "subtitle": "Panduan untuk mengunggah profile pengguna",
    },
    {
      "icon": Icons.list_alt,
      "title": "Ganti Password",
      "subtitle": "Panduan untuk mengganti password pengguna",
    }
  ];

  // Data panduan penggunaan bagian siswa
  List<Map<String, dynamic>> get studentUsageGuide => [
    {
      "icon": Icons.list_alt,
      "title": "Mengisi Jurnal",
      "subtitle": "Panduan untuk mengisi kegiatan sehari - hari",
    },
    {
      "icon": Icons.list_alt,
      "title": "Kelengkapan Profile",
      "subtitle": "Panduan untuk melengkapi profile",
    },
    {
      "icon": Icons.image,
      "title": "Mengelola Portfolio",
      "subtitle": "Panduan untuk menambah, edit, dan hapus portfolio",
    },
    {
      "icon": Icons.check_circle,
      "title": "Mengelola Sertifikat",
      "subtitle": "Panduan untuk menambah, edit, dan hapus sertifikat",
    },
    {
      "icon": Icons.info,
      "title": "Catatan Sikap Saya",
      "subtitle": "Panduan untuk melihat dan memahami catatan sikap",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // Background color
      backgroundColor: fromCssColor("#F8FAFC"),
      // Background color
      // Body Start
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.menu_book,
                            color: fromCssColor('#02398C'),
                            size: 30,
                          ),

                          const SizedBox(width: 10),
                
                          Text(
                            "Panduan Penggunaan",
                            style: GoogleFonts.poppins(
                              color: fromCssColor("#02398C"),
                              fontSize: 24,
                              fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      ),

                      const SizedBox(height: 20),
                
                      Text(
                        "Selamat datang di panduan penggunaan \naplikasi Jurnalku. Panduan ini akan \nmembantu Anda memahami cara \nmenggunakan fitur-fitur yang tersedia \ndengan optimal.",
                        style: GoogleFonts.poppins(
                          color: fromCssColor("#4b5563"),
                          fontSize: 18,
                          fontWeight: FontWeight.normal
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Umum",
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.w600
                        ),
                      ),

                      const SizedBox(height: 10),

                      const Divider(),

                      const SizedBox(height: 10),

                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: generalUsageGuide.length,
                        itemBuilder: (context, index) {
                          final item = generalUsageGuide[index];

                          return Column(
                            children: [
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: fromCssColor("#ebeef3")
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      item["icon"],
                                      color: fromCssColor('#02398C'),
                                      size: 30
                                    ),

                                    const SizedBox(width: 10),

                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item["title"],
                                          style: GoogleFonts.poppins(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600
                                          ),
                                        ),
                                        Text(
                                          item["subtitle"],
                                          style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            color: fromCssColor("#4b5563")
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(height: 20)
                            ],
                          );
                        }
                      ),
                    ],
                  ),
                
                  const SizedBox(height: 20),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Untuk Siswa",
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.w600
                        ),
                      ),

                      const SizedBox(height: 10),

                      const Divider(),

                      const SizedBox(height: 10),

                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: studentUsageGuide.length,
                        itemBuilder: (context, index) {
                          final item = studentUsageGuide[index];

                          return Column(
                            children: [
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: fromCssColor("#ebeef3")
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      item["icon"],
                                      color: fromCssColor('#02398C'),
                                      size: 30
                                    ),

                                    const SizedBox(width: 10),

                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item["title"],
                                            style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600
                                            ),
                                          ),
                                          Text(
                                            item["subtitle"],
                                            style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              color: fromCssColor("#4b5563")
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(height: 20)
                            ],
                          );
                        }
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      )
      // Body End
    );
  }
}