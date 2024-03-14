import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class WordPressNews extends StatefulWidget {
  @override
  _WordPressNewsState createState() => _WordPressNewsState();
}

class _WordPressNewsState extends State<WordPressNews> {
  List<dynamic> posts = [];

  @override
  void initState() {
    super.initState();
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    try {
      final response = await http.get(Uri.parse('https://deultimominuto.net/wp-json/wp/v2/posts/'));
      if (response.statusCode == 200) {
        setState(() {
          posts = jsonDecode(response.body);
        });
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (e) {
      print('Error fetching posts: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WordPress News'),
      ),
      body: posts.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: posts.length >= 3 ? 3 : posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return ListTile(
                  leading: Image.network(post['jetpack_featured_media_url']),
                  title: Text(post['title']['rendered']),
                  subtitle: Text(post['excerpt']['rendered']),
                  onTap: () {
                    // Abrir la noticia original en el navegador
                    launch(post['link']);
                  },
                );
              },
            ),
    );
  }
}
