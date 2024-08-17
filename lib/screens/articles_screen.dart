import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:easy_localization/easy_localization.dart';

// Article model sınıfı
class Article {
  final String title;
  final String subtitle;
  final String content;

  Article({required this.title, required this.subtitle, required this.content});

  // JSON'dan Article nesnesine dönüştürme
  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'] ?? '',
      subtitle: json['subtitle'] ?? '',
      content: json['content'] ?? '',
    );
  }
}

class ArticlesScreen extends StatefulWidget {
  @override
  _ArticlesScreenState createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  late Future<List<Article>> articles;

  @override
  void initState() {
    super.initState();
    // İlk yüklemede makaleleri getir
    articles = loadArticles();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Dil değiştiğinde makaleleri yeniden yükle
    articles = loadArticles();
  }

  // JSON dosyasından verileri yükle
  Future<List<Article>> loadArticles() async {
    try {
      // Aktif dilin JSON dosyasını okuyun
      final jsonString = await rootBundle.rootBundle
          .loadString('assets/lang/${context.locale.languageCode}.json');
      
      // JSON verisini decode edin
      final List<dynamic> jsonData = json.decode(jsonString);
      
      // Veriyi liste olarak döndürün
      return jsonData.map((jsonItem) => Article.fromJson(jsonItem)).toList();
    } catch (e) {
      // Hata durumunda boş liste döndür
      print('Error loading JSON: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yazılar Köşesi').tr(),
        actions: [
          // Dil değiştirme butonları
          IconButton(
            icon: Text("TR"),
            onPressed: () => context.setLocale(Locale('tr', 'TR')),
          ),
          IconButton(
            icon: Text("EN"),
            onPressed: () => context.setLocale(Locale('en', 'US')),
          ),
          IconButton(
            icon: Text("DE"),
            onPressed: () => context.setLocale(Locale('de', 'DE')),
          ),
        ],
      ),
      body: FutureBuilder<List<Article>>(
        future: articles,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Hata oluştu: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Hiç yazı bulunamadı.'));
          } else {
            final articles = snapshot.data!;
            return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                final article = articles[index];
                return ListTile(
                  title: Text(article.title),
                  subtitle: Text(article.subtitle),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    // Makale detay ekranına git
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ArticleDetailScreen(article: article),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}

// ArticleDetailScreen sınıfı
class ArticleDetailScreen extends StatelessWidget {
  final Article article;

  ArticleDetailScreen({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(article.title)),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(article.content),
      ),
    );
  }
}
