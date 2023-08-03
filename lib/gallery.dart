import 'package:flutter/material.dart';

class GalleryPage extends StatefulWidget {
  GalleryPage({Key? key}) : super(key: key);

  @override
  GalleryPageState createState() => GalleryPageState();
}

class GalleryPageState extends State<GalleryPage> {
  int selectedIndex = 1;

  final List<String> images = [
    'https://picsum.photos/2000?random=1',
    'https://picsum.photos/2000?random=2',
    'https://picsum.photos/2000?random=3',
    'https://picsum.photos/2000?random=4',
    'https://picsum.photos/2000?random=5',
    'https://picsum.photos/2000?random=6',
    'https://picsum.photos/2000?random=7',
    'https://picsum.photos/2000?random=8',
    // Add more image URLs
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: const Text("Galeri"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
          ),
          itemCount: images.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Aksi saat gambar di-tap
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: NetworkImage(images[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3), // Mengatur posisi bayangan
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: BottomAppBar(
              child: Container(
                height: 56.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.home,
                        color: selectedIndex == 0 ? Colors.amber : Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          selectedIndex = 0;
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.image,
                        color: selectedIndex == 1 ? Colors.amber : Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          selectedIndex = 1;
                        });
                      },
                    ),
                    const SizedBox(width: 56.0),
                    IconButton(
                      icon: Icon(
                        Icons.notifications,
                        color: selectedIndex == 2 ? Colors.amber : Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          selectedIndex = 2;
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.person,
                        color: selectedIndex == 3 ? Colors.amber : Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          selectedIndex = 3;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Builder(
        builder: (BuildContext context) {
          return FloatingActionButton(
            onPressed: () {
              final RenderBox button = context.findRenderObject() as RenderBox;
              final RenderBox overlay =
                  Overlay.of(context).context.findRenderObject() as RenderBox;
              final Offset buttonPosition =
                  button.localToGlobal(Offset.zero, ancestor: overlay);
              final RelativeRect position = RelativeRect.fromRect(
                Rect.fromPoints(
                  buttonPosition,
                  buttonPosition.translate(
                      button.size.width, button.size.height),
                ),
                Offset.zero & overlay.size,
              );

              showMenu(
                context: context,
                position: position,
                items: [
                  const PopupMenuItem(
                    value: 1,
                    child: Text('Tambah Laporan'),
                  ),
                  const PopupMenuItem(
                    value: 2,
                    child: Text('Tambah Laporan Langsung'),
                  ),
                ],
                elevation: 8.0,
              ).then((value) {
                if (value == 1) {
                  // Kode untuk menu 1
                } else if (value == 2) {
                  // Kode untuk menu 2
                }
              });
            },
            backgroundColor: Colors.amber,
            child: const Icon(Icons.add),
          );
        },
      ),
    );
  }
}
