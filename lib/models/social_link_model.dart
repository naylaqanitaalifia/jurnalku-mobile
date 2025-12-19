class SocialLink {
  final int id;
  final String platform;
  final String url;

  SocialLink({
    required this.id,
    required this.platform,
    required this.url,
  });

  factory SocialLink.fromJson(Map<String, dynamic> json) {
    return SocialLink(
      id: json['id'],
      platform: json['platform'],
      url: json['url'],
    );
  }
}
