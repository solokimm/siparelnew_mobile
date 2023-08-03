import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class NotificationItem {
  final String avatarUrl;
  final String username;
  final String message;
  final String timeAgo;

  NotificationItem({
    required this.avatarUrl,
    required this.message,
    required this.timeAgo,
    required this.username,
  });
}

class DetailReport_Page extends StatefulWidget {
  const DetailReport_Page({Key? key}) : super(key: key);

  @override
  DetailReport_PageState createState() => DetailReport_PageState();
}

class DetailReport_PageState extends State<DetailReport_Page> {
  int selectedIndex = 0;

  final List<String> images = [
    'https://picsum.photos/2000?random=1',
    'https://picsum.photos/2000?random=2',
    'https://picsum.photos/2000?random=3',
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
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(
            bottom: 130.0), // Menambahkan padding di bagian bawah
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const ListTile(
                      leading: CircleAvatar(),
                      title: Text("Nama Relawan"),
                      subtitle: Text("5 menit yang lalu"),
                    ),
                    const SizedBox(height: 10.0),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Stack(
                        children: [
                          CarouselSlider.builder(
                            itemCount: images.length,
                            itemBuilder: (BuildContext context, int index,
                                int pageViewIndex) {
                              return Container(
                                width: double.infinity,
                                height: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(images[index]),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                            options: CarouselOptions(
                              autoPlay: false,
                              aspectRatio: 1.0,
                              viewportFraction: 1.0,
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              reverse: false,
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                          Positioned(
                            bottom: 10.0,
                            left: 0,
                            right: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: images.asMap().entries.map((entry) {
                                return GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    width: 8.0,
                                    height: 8.0,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 4.0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: entry.key == 0
                                          ? Colors.white
                                          : Colors.grey,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    /* begin:: Caption */
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                            softWrap: true,
                          ),
                          const SizedBox(height: 10.0),
                          Row(
                            children: [
                              const Text(
                                "Lokasi: ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const Icon(Icons.location_on, size: 16),
                              Flexible(
                                child: GestureDetector(
                                  onTap: () {
                                    // Tindakan saat lokasi diklik
                                  },
                                  child: const Text(
                                    "3J64+JR6, Cigereleng, Kec. Regol, Kota Bandung, Jawa Barat 40253",
                                    style: TextStyle(
                                      color: Colors.blue,
                                      decoration: TextDecoration.underline,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    /* end:: Caption */
                  ],
                ),
              ),
            ),
          );
        },
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

class WaveBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;

    final colors = [Colors.amber, Colors.white]; // Daftar warna gradient
    final stops = [0.5, 1.0]; // Posisi peralihan warna dalam gradient

    final gradient = LinearGradient(
      colors: colors,
      stops: stops,
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    final paint = Paint()..shader = gradient.createShader(rect);

    final path = _createWavePath(size);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  Path _createWavePath(Size size) {
    final path = Path();

    // Posisi awal path
    path.moveTo(0, size.height * 0.5);

    // Titik kontrol dan titik akhir path
    final controlPoint1 = Offset(size.width * 0.25, size.height * 0.3);
    final controlPoint2 = Offset(size.width * 0.75, size.height * 0.7);
    final endPoint = Offset(size.width, size.height * 0.5);

    // Gambar kurva gelombang dengan quadraticBezierTo
    path.quadraticBezierTo(
      controlPoint1.dx,
      controlPoint1.dy,
      endPoint.dx,
      endPoint.dy,
    );

    // Gambar kurva gelombang terbalik
    path.quadraticBezierTo(
      controlPoint2.dx,
      controlPoint2.dy,
      size.width,
      size.height * 0.5,
    );

    // Tambahkan garis horizontal di bagian bawah
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    // Tutup path
    path.close();

    return path;
  }
}
