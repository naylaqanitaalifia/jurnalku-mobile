//lib/models/user_model.dart
import 'portfolio_model.dart';
import 'social_link_model.dart';

class User {
  final int id;
  final String name;
  final String nis;
  final String rombel;
  final String rayon;
  final String photo;
  final List<Portfolio> portfolios;
  final List<SocialLink> socialLinks;
  final List<dynamic> certificates; // Tambahkan ini sesuai controller Laravel

  User({
    required this.id,
    required this.name,
    required this.nis,
    required this.rombel,
    required this.rayon,
    required this.photo,
    required this.portfolios,
    required this.socialLinks,
    required this.certificates,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      nis: json['nis'].toString(), // Pastikan string agar tidak error
      rombel: json['rombel'],
      rayon: json['rayon'],
      photo: json['photo'] ?? 'none',
      portfolios: (json['portfolios'] as List? ?? [])
          .map((e) => Portfolio.fromJson(e))
          .toList(),
      socialLinks: (json['social_links'] as List? ?? [])
          .map((e) => SocialLink.fromJson(e))
          .toList(),
      certificates: (json['certificates'] as List? ?? []), // Ambil list mentah
    );
  }
}