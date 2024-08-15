import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:flutter/services.dart';
import 'dart:typed_data';

class WallpaperScreen extends StatelessWidget {
  final List<String> imagePaths = [
    'assets/images/w1.jpg',
    'assets/images/w2.jpg',
    'assets/images/w3.jpg',
    'assets/images/w4.jpg',
    'assets/images/w5.jpg',
    'assets/images/w6.jpg',
    // Diğer görsellerin yollarını burada ekleyin
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Duvar Kağıtları'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: imagePaths.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                _showImageDialog(context, imagePaths[index]);
              },
              child: _buildImageCard(imagePaths[index]),
            );
          },
        ),
      ),
    );
  }

  Widget _buildImageCard(String imagePath) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
      ),
    );
  }

  void _showImageDialog(BuildContext context, String imagePath) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Stack(
            children: [
              Image.asset(imagePath, fit: BoxFit.cover),
              Positioned(
                bottom: 20,
                right: 20,
                child: FloatingActionButton(
                  onPressed: () async {
                    await _saveImageToGallery(imagePath, context);
                  },
                  child: Icon(Icons.file_download),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _saveImageToGallery(String imagePath, BuildContext context) async {
    try {
      final ByteData bytes = await rootBundle.load(imagePath);
      final Uint8List list = bytes.buffer.asUint8List();
      final result = await ImageGallerySaver.saveImage(list, quality: 100);

      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Fotoğraf galeriye başarıyla eklendi.')),
      );
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Fotoğraf kaydedilirken bir hata oluştu.')),
      );
    }
  }
}
