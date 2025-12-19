// lib/widgets/profile/overview_tab_widget.dart
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OverviewTab extends StatelessWidget {
  const OverviewTab({Key? key}) : super(key: key);

  void _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        children: const [
          SizedBox(height: 8),
          _PortfolioSection(),
          SizedBox(height: 16),
          _CertificateSection(),
          SizedBox(height: 20),
          _DocumentsSection(),
          SizedBox(height: 20),
          _SocialMediaSection(),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}

// ===================== PORTFOLIO =====================
class _PortfolioSection extends StatelessWidget {
  const _PortfolioSection();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: Color(0xFFE5E7EB), width: 0.8),
      ),
      elevation: 0,
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Portfolio Terbaru",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                Row(
                  children: [
                    OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.add, size: 18),
                      label: const Text("Tambah", style: TextStyle(fontSize: 13)),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFF6B7280),
                        side: const BorderSide(color: Color(0xFFD1D5DB)),
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        minimumSize: const Size(0, 36),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                    const SizedBox(width: 8),
                    TextButton(
                      onPressed: () => DefaultTabController.of(context)?.animateTo(1),
                      child: const Text("Lihat Semua", style: TextStyle(color: Color(0xFF2563EB), fontSize: 14)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(height: 1, thickness: 0.8, color: Color(0xFFE5E7EB)),
          const SizedBox(height: 40),
           const Text(
                        "💼",
                        style: TextStyle(fontSize: 72),
                      ),
          // Text("briefcase", style: TextStyle(fontSize: 80)), // alternatif emoji
          const SizedBox(height: 16),
          const Text("Portfolio akan ditampilkan di sini",
              style: TextStyle(fontSize: 14, color: Color(0xFF6B7280))),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

// ===================== SERTIFIKAT =====================
class _CertificateSection extends StatelessWidget {
  const _CertificateSection();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: Color(0xFFE5E7EB), width: 0.8),
      ),
      elevation: 0,
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Sertifikat Terbaru",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                Row(
                  children: [
                    OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.add, size: 18),
                      label: const Text("Tambah", style: TextStyle(fontSize: 13)),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFF6B7280),
                        side: const BorderSide(color: Color(0xFFD1D5DB)),
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        minimumSize: const Size(0, 36),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                    const SizedBox(width: 8),
                    TextButton(
                      onPressed: () => DefaultTabController.of(context)?.animateTo(2),
                      child: const Text("Lihat Semua", style: TextStyle(color: Color(0xFF2563EB), fontSize: 14)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(height: 1, thickness: 0.8, color: Color(0xFFE5E7EB)),
          const SizedBox(height: 40),
          const Text(
            "🏆",
            style: TextStyle(fontSize: 80),
          ),
          const SizedBox(height: 16),
          const Text("Sertifikat akan ditampilkan di sini",
              style: TextStyle(fontSize: 14, color: Color(0xFF6B7280))),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

// ===================== DOKUMEN =====================
class _DocumentsSection extends StatelessWidget {
  const _DocumentsSection();

  final String cvUrl = "https://is3.cloudhost.id/.../cv.pdf";
  final String kartuUrl = "https://is3.cloudhost.id/.../kartu.jpg";

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: Color(0xFFE5E7EB), width: 0.8),
      ),
      elevation: 0,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Dokumen", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(height: 20),
            const Divider(height: 1, thickness: 0.8, color: Color(0xFFE5E7EB)),
            const SizedBox(height: 20),

            // CV
            _DocumentItem(
              title: "Curriculum Vitae",
              subtitle: "Dokumen CV siswa",
              buttonText: "Lihat CV",
              buttonColor: const Color(0xFF1E40AF),
              showUpload: true,
              onTap: () {},
              onUpload: () {},
            ),

            const SizedBox(height: 24),
            const Divider(height: 1, color: Color(0xFFE5E7EB)),
            const SizedBox(height: 24),

            // Kartu Pelajar
            _DocumentItem(
              title: "Kartu Pelajar",
              subtitle: "Kartu identitas siswa",
              buttonText: "Lihat Kartu Pelajar",
              buttonColor: const Color(0xFF16A34A),
              showUpload: true,
              onTap: () {},
              onUpload: () {},
            ),

            const SizedBox(height: 12),
            Row(
              children: const [
                Icon(Icons.info_outline, size: 18, color: Color(0xFFCA8A04)),
                SizedBox(width: 8),
                Expanded(
                  child: Text("Kartu pelajar dapat dilihat oleh anda dan guru",
                      style: TextStyle(fontSize: 13, color: Color(0xFFCA8A04))),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _DocumentItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String buttonText;
  final Color buttonColor;
  final bool showUpload;
  final VoidCallback onTap;
  final VoidCallback? onUpload;

  const _DocumentItem({
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.buttonColor,
    this.showUpload = false,
    required this.onTap,
    this.onUpload,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
              const SizedBox(height: 4),
              Text(subtitle, style: const TextStyle(fontSize: 13, color: Color(0xFF6B7280))),
            ],
          ),
        ),
        const SizedBox(width: 16),
        ElevatedButton.icon(
          onPressed: onTap,
          icon: const Icon(Icons.visibility, size: 18),
          label: Text(buttonText, style: const TextStyle(fontSize: 13.5)),
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        if (showUpload) ...[
          const SizedBox(width: 8),
          OutlinedButton(
            onPressed: onUpload,
            child: const Icon(Icons.upload, size: 20),
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color(0xFF6B7280),
              side: const BorderSide(color: Color(0xFFD1D5DB)),
              padding: const EdgeInsets.all(12),
              minimumSize: const Size(44, 44),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
        ],
      ],
    );
  }
}

// ===================== MEDIA SOSIAL =====================
class _SocialMediaSection extends StatelessWidget {
  const _SocialMediaSection();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: Color(0xFFE5E7EB), width: 0.8),
      ),
      elevation: 0,
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Media Sosial", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.edit, size: 16),
                  label: const Text("Edit"),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF6B7280),
                    side: const BorderSide(color: Color(0xFFD1D5DB)),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1, thickness: 0.8, color: Color(0xFFE5E7EB)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              children: [
                _SocialItem(platform: "Github", url: "https://github.com/KryNovaac"),
                const SizedBox(height: 16),
                _SocialItem(platform: "Linkedin", url: "https://www.linkedin.com/in/reynovaa/"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SocialItem extends StatelessWidget {
  final String platform;
  final String url;

  const _SocialItem({required this.platform, required this.url});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(radius: 14, backgroundColor: Colors.grey[300]),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(platform, style: const TextStyle(fontWeight: FontWeight.w500)),
              SelectableText(url, style: const TextStyle(color: Color(0xFF2563EB), fontSize: 13.5)),
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.copy, size: 20),
          color: const Color(0xFF6B7280),
          onPressed: () {
            // copy to clipboard
          },
        ),
      ],
    );
  }
}