class News {
  final String title;
  final String summary;
  final String imageUrl;
  final String link;

  News({required this.title, required this.summary, required this.imageUrl, required this.link});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      title: json['title']['rendered'],
      summary: json['excerpt']['rendered'],
      imageUrl: json['jetpack_featured_media_url'],
      link: json['link'],
    );
  }
}
