import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddReportPage extends StatefulWidget {
  @override
  _AddReportPageState createState() => _AddReportPageState();
}

class _AddReportPageState extends State<AddReportPage> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  List<File> _selectedImages = [];

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  void _handlePostButtonPressed() {
    // Logic untuk mengirim data posting ke server atau melakukan tindakan lainnya
    // ...
    // Contoh sederhana hanya mencetak judul postingan dan daftar gambar yang dipilih
    print('Title: ${_titleController.text}');
    print('Selected Images: $_selectedImages');
  }

  void _handleSelectImages() async {
    final imagePicker = ImagePicker();
    final pickedImages = await imagePicker.pickMultiImage();

    setState(() {
      _selectedImages =
          pickedImages.map((pickedImage) => File(pickedImage.path)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: const Text("Tambah Laporan"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Judul Laporan',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Masukan Judul Laporan',
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Lokasi',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              TextField(
                controller: _locationController,
                enabled: false,
                decoration: const InputDecoration(
                  labelText:
                      "Cigereleng, Kec. Regol, Kota Bandung, Jawa Barat 40253",
                  prefixIcon: Icon(Icons.location_on),
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Gambar',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: _selectedImages
                    .map((image) => _buildSelectedImagePreview(image))
                    .toList(),
              ),
              GestureDetector(
                onTap: _handleSelectImages,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.grey[300],
                  child: Icon(
                    Icons.add_a_photo,
                    size: 64,
                    color: Colors.grey[500],
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _handlePostButtonPressed,
                style: ElevatedButton.styleFrom(
                  primary: Colors.amber,
                  onPrimary: Colors.white,
                ),
                child: const Text('Post'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSelectedImagePreview(File image) {
    return Stack(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            image: DecorationImage(
              image: FileImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 4.0,
          right: 4.0,
          child: GestureDetector(
            onTap: () {
              setState(() {
                _selectedImages.remove(image);
              });
            },
            child: const Icon(
              Icons.close,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
