import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jurnalku_mobile/screens/general/login_page.dart' show LoginPage;

class StudentDirectory extends StatefulWidget {
  const StudentDirectory({super.key});

  @override
  State<StudentDirectory> createState() => _StudentDirectoryState();
}

class _StudentDirectoryState extends State<StudentDirectory> {
  int _currentPage = 1;
  final int _itemsPerPage = 12;
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();
  String? _selectedRombel = 'Semua Rombel';
  String? _selectedRayon = 'Semua Rayon';
  String? _selectedJurusan = 'Semua Jurusan';
  bool _isExpanded = false;

  // Dummy data
  List<Map<String, dynamic>> get studentDatas => [
    {
      "name": "Alya Ramadhani",
      "nis": 12345001,
      "rombel": "PPLG XII-5",
      "rayon": "Cia 2",
      "count_portofolio": 3,
      "count_sertificate": 12,
      "profile_image": "assets/images/student-1.jpg"
    },
    {
      "name": "Rizky Pratama",
      "nis": 12345002,
      "rombel": "PPLG XII-5",
      "rayon": "Cib 3",
      "count_portofolio": 1,
      "count_sertificate": 8,
      "profile_image": "assets/images/student-1.jpg"
    },
    {
      "name": "Siti Nurhaliza",
      "nis": 12345003,
      "rombel": "PPLG XII-5",
      "rayon": "Taj 4",
      "count_portofolio": 4,
      "count_sertificate": 10,
      "profile_image": "assets/images/student-1.jpg"
    },
    {
      "name": "Dandy Mahaputra",
      "nis": 12345004,
      "rombel": "PPLG XII-5",
      "rayon": "Cia 1",
      "count_portofolio": 2,
      "count_sertificate": 5,
      "profile_image": "assets/images/student-1.jpg"
    },
    {
      "name": "Putri Maharani",
      "nis": 12345005,
      "rombel": "PPLG XII-5",
      "rayon": "Cib 2",
      "count_portofolio": 5,
      "count_sertificate": 14,
      "profile_image": "assets/images/student-1.jpg"
    },
    {
      "name": "Fajar Alfarizi",
      "nis": 12345006,
      "rombel": "PPLG XII-5",
      "rayon": "Taj 3",
      "count_portofolio": 3,
      "count_sertificate": 9,
      "profile_image": "assets/images/student-1.jpg"
    },
    {
      "name": "Nadya Septiani",
      "nis": 12345007,
      "rombel": "PPLG XII-5",
      "rayon": "Cia 3",
      "count_portofolio": 6,
      "count_sertificate": 11,
      "profile_image": "assets/images/student-1.jpg"
    },
    {
      "name": "Bagas Suryawan",
      "nis": 12345008,
      "rombel": "PPLG XII-5",
      "rayon": "Cib 1",
      "count_portofolio": 2,
      "count_sertificate": 4,
      "profile_image": "assets/images/student-1.jpg"
    },
    {
      "name": "Melati Anggraini",
      "nis": 12345009,
      "rombel": "PPLG XII-5",
      "rayon": "Taj 5",
      "count_portofolio": 4,
      "count_sertificate": 13,
      "profile_image": "assets/images/student-1.jpg"
    },
    {
      "name": "Raka Firmansyah",
      "nis": 12345010,
      "rombel": "PPLG XII-5",
      "rayon": "Cia 4",
      "count_portofolio": 1,
      "count_sertificate": 6,
      "profile_image": "assets/images/student-1.jpg"
    },
    {
      "name": "Citra Lestari",
      "nis": 12345011,
      "rombel": "PPLG XII-5",
      "rayon": "Cib 4",
      "count_portofolio": 5,
      "count_sertificate": 17,
      "profile_image": "assets/images/student-1.jpg"
    },
    {
      "name": "Kevin Saputra",
      "nis": 12345012,
      "rombel": "PPLG XII-5",
      "rayon": "Taj 2",
      "count_portofolio": 3,
      "count_sertificate": 10,
      "profile_image": "assets/images/student-1.jpg"
    },
    {
      "name": "Larissa Adelia",
      "nis": 12345013,
      "rombel": "PPLG XII-5",
      "rayon": "Cia 5",
      "count_portofolio": 2,
      "count_sertificate": 9,
      "profile_image": "assets/images/student-1.jpg"
    },
    {
      "name": "Bima Prakoso",
      "nis": 12345014,
      "rombel": "PPLG XII-5",
      "rayon": "Cib 5",
      "count_portofolio": 4,
      "count_sertificate": 16,
      "profile_image": "assets/images/student-1.jpg"
    }
  ];

  List<String> get _uniqueRombels {
    var rombels = studentDatas.map((s) => s['rombel'] as String).toSet().toList();
    rombels.insert(0, 'Semua Rombel');
    return rombels;
  }

  List<String> get _uniqueRayons {
    var rayons = studentDatas.map((s) => s['rayon'] as String).toSet().toList();
    rayons.insert(0, 'Semua Rayon');
    return rayons;
  }

  List<String> get _uniqueJurusans {
    var jurusans = studentDatas.map((s) => (s['rombel'] as String).split(' ')[0]).toSet().toList();
    jurusans.insert(0, 'Semua Jurusan');
    return jurusans;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredStudents = studentDatas.where((student) {
      String name = student['name'].toLowerCase();
      String nis = student['nis'].toString().toLowerCase();
      String rombel = student['rombel'].toLowerCase();
      String rayon = student['rayon'].toLowerCase();
      String jurusan = (student['rombel'] as String).split(' ')[0].toLowerCase();
      bool matchesSearch = name.contains(_searchQuery.toLowerCase()) ||
                           nis.contains(_searchQuery.toLowerCase()) ||
                           rombel.contains(_searchQuery.toLowerCase());
      bool matchesRombel = _selectedRombel == 'Semua Rombel' || student['rombel'] == _selectedRombel;
      bool matchesRayon = _selectedRayon == 'Semua Rayon' || student['rayon'] == _selectedRayon;
      bool matchesJurusan = _selectedJurusan == 'Semua Jurusan' || (student['rombel'] as String).split(' ')[0] == _selectedJurusan;
      return matchesSearch && matchesRombel && matchesRayon && matchesJurusan;
    }).toList();

    int totalStudents = filteredStudents.length;
    int startIndex = (_currentPage - 1) * _itemsPerPage;
    int endIndex = startIndex + _itemsPerPage;
    if (endIndex > totalStudents) {
      endIndex = totalStudents;
    }
    List<Map<String, dynamic>> displayedStudents = filteredStudents.sublist(startIndex, endIndex);

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.menu_book_sharp, 
                  color: fromCssColor("#02398C")
                ),

                SizedBox(width: 8),

                Text(
                  "Jurnalku",
                  style: GoogleFonts.poppins(
                    color: fromCssColor("#4b5563"),
                    fontWeight: FontWeight.w500
                  ),
                ),
              ],
            ),

            GestureDetector(
              onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                    (route) => false, // Menghapus semua halaman sebelumnya (opsional)
                  );
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: fromCssColor("#02398C"),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "Login",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),

      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            // height: 230,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/Banner-Web.jpg"),
                fit: BoxFit.cover,
              )
            ),

            child: Center(
              child: Container(
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Direktori Siswa",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                
                    Text(
                      "Temukan dan jelajahi profil siswa SMK Wikrama Bogor",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 14
                      ),
                    ),
              
                    const SizedBox(height: 20),
                
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        children: [
                          // Start
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1,
                                      // color: Colors.grey[400],
                                        color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.search,
                                        color: Colors.grey[500],
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        child: TextFormField(
                                          controller: _searchController,
                                          decoration: InputDecoration(
                                            hintText: "Cari nama siswa, NIS, atau rombel...",
                                            hintStyle: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey[400],
                                              fontSize: 12
                                            ),
                                            
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                
                              const SizedBox(width: 10),
                
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _searchQuery = _searchController.text;
                                    _currentPage = 1;
                                  });
                                },
                                child: Container(
                                  height: 50,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: fromCssColor("#02398C"),
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Cari",
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          // End

                          const SizedBox(height: 20),

                          // Start
                          ExpansionTile(
                            shape: BorderDirectional(),
                            collapsedShape: BorderDirectional(),
                            onExpansionChanged: (bool expanded) {
                              setState(() {
                                _isExpanded = expanded;
                              });
                            },
                            title: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: fromCssColor("#02398C"),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.filter_list,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    "Filter Lanjutan",
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            children: [
                              Column(
                                children: [
                                  DropdownButtonFormField<String>(
                                    value: _selectedRombel,
                                    decoration: InputDecoration(
                                      labelText: 'Rombel',
                                    ),
                                    items: _uniqueRombels.map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        _selectedRombel = newValue;
                                      });
                                    },
                                  ),
                                  const SizedBox(height: 10),
                                  DropdownButtonFormField<String>(
                                    value: _selectedRayon,
                                    decoration: InputDecoration(
                                      labelText: 'Rayon',
                                    ),
                                    items: _uniqueRayons.map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        _selectedRayon = newValue;
                                      });
                                    },
                                  ),
                                  const SizedBox(height: 10),
                                  DropdownButtonFormField<String>(
                                    value: _selectedJurusan,
                                    decoration: InputDecoration(
                                      labelText: 'Jurusan',
                                    ),
                                    items: _uniqueJurusans.map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        _selectedJurusan = newValue;
                                      });
                                    },
                                  ),
                                  const SizedBox(height: 10),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _currentPage = 1;
                                      });
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: fromCssColor("#02398C"),
                                        borderRadius: BorderRadius.circular(10)
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Terapkan Filter",
                                          style: GoogleFonts.poppins(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        _selectedRombel = 'Semua Rombel';
                                        _selectedRayon = 'Semua Rayon';
                                        _selectedJurusan = 'Semua Jurusan';
                                        _currentPage = 1;
                                      });
                                    },
                                    child: Text(
                                      "Reset Filter",
                                      style: GoogleFonts.poppins(
                                        color: fromCssColor("#02398C"),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                          // End
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),

          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Menampilkan ${startIndex + 1}-$endIndex siswa dari $totalStudents siswa",
                      style: GoogleFonts.poppins(
                        color: fromCssColor("#4b5563"),
                        fontSize: 12
                      ),  
                    ),

                    const SizedBox(height: 20),

                    // Start
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: displayedStudents.length,
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 10);
                      },
                      itemBuilder: (context, index) {
                        final students = displayedStudents[index];
                    
                        return Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 6,
                                offset: const Offset(0, 3),
                              )
                            ]
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CircleAvatar(
                                radius: 40,
                                backgroundImage: AssetImage(students["profile_image"]),
                              ),
                  
                              const SizedBox(height: 15),
                  
                              // Start
                              Text(
                                students["name"],
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: fromCssColor("#010101"),
                                ),
                              ),
                              // End
                  
                              const SizedBox(height: 15),
                  
                              // Start
                              Text(
                                "${students["nis"]} | ${students["rombel"]} | ${students["rayon"]}",
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: fromCssColor("#6b7280"),
                                ),
                              ),
                              // End
                  
                              const SizedBox(height: 10),
                  
                              Divider(),
                  
                              const SizedBox(height: 10),
                  
                              // Start
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.file_copy,
                                        color: fromCssColor("#6b7280"),
                                        size: 16,
                                      ),
                  
                                      const SizedBox(width: 5),
                  
                                      Text(
                                        "${students["count_portofolio"].toString()} portofolio",
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: fromCssColor("#6b7280"),
                                        ),
                                      ),
                                    ],
                                  ),
                  
                                  Spacer(),
                                  
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.check_circle_outline,
                                        color: fromCssColor("#6b7280"),
                                        size: 16,
                                      ),
                  
                                      const SizedBox(width: 5),
                  
                                      Text(
                                        "${students["count_sertificate"].toString()} sertifikat",
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: fromCssColor("#6b7280"),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              // End
                  
                              const SizedBox(height: 15),
                  
                              // Start
                              GestureDetector(
                                onTap: () {
                                  print("Lihat detail siswa");
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                  decoration: BoxDecoration(
                                    color: fromCssColor("#02398C"),
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Row(
                  
                                    children: [
                                      Text(
                                        "Lihat detail",
                                        style: GoogleFonts.poppins(
                                          color: Colors.white,
                                        ),
                                      ),
                  
                                      const Spacer(),
                  
                                      Icon(
                                        Icons.arrow_circle_right,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // End
                            ],
                          ),
                        );
                      }
                    ),

                    const SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Visibility(
                          visible: _currentPage > 1,
                          child: TextButton.icon(
                            onPressed: _currentPage > 1 ? () {
                              setState(() {
                                _currentPage--;
                              });
                            } : null,
                            icon: Icon(
                              Icons.arrow_circle_left,
                              color: fromCssColor("#02398C"),
                              size: 18,
                            ),
                            label: Text(
                              "Previous",
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: fromCssColor("#02398C"),
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: endIndex < totalStudents,
                          child: TextButton.icon(
                            onPressed: endIndex < totalStudents ? () {
                              setState(() {
                                _currentPage++;
                              });
                            } : null,
                            label: Text(
                              "Next",
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: fromCssColor("#02398C"),
                              ),
                            ),
                            icon: Icon(
                              Icons.arrow_circle_right,
                              color: fromCssColor("#02398C"),
                              size: 18,
                            ),
                          ),
                        )
                      ],
                    )
                    // End
                  ],
                ),
              ),
            )
          )
        ],
      ),
    );
  }
}