import 'package:flutter/material.dart';

class ProfileSettingsPage extends StatefulWidget {
  ProfileSettingsPage({Key? key}) : super(key: key);

  @override
  _ProfileSettingsPageState createState() => _ProfileSettingsPageState();
}

class _ProfileSettingsPageState extends State<ProfileSettingsPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: const Text("Profil dan Pengaturan"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 16),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                color: Colors.white, // Warna latar belakang Container di dalam
              ),
              child: ListView(
                children: [
                  ListTile(
                    leading: const CircleAvatar(
                      radius: 40,
                    ),
                    title: const Text(
                      'Relawan A',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: const Row(
                      children: [
                        Text(
                          'Lihat Profil',
                          style: TextStyle(
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.lock),
                    title: const Text('Keamanan'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.rule_rounded),
                    title: const Text('Syarat dan Kondisi'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.help),
                    title: const Text('Tentang Aplikasi'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.exit_to_app, color: Colors.red),
                    title: const Text('Keluar',
                        style: TextStyle(color: Colors.red)),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
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
