import 'package:flutter/material.dart';

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

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  NotificationsPageState createState() => NotificationsPageState();
}

class NotificationsPageState extends State<NotificationsPage> {
  int selectedIndex = 2;

  final List<NotificationItem> notifications = [
    NotificationItem(
      avatarUrl: '',
      username: 'Relawan A',
      message: 'Telah membagikan Laporan langsung',
      timeAgo: 'Baru saja',
    ),
    NotificationItem(
      avatarUrl: '',
      username: 'Relawan B',
      message: 'Telah membagikan Laporan',
      timeAgo: '2 menit lalu',
    ),
    NotificationItem(
      avatarUrl: '',
      username: 'Relawan C',
      message: 'Telah membagikan Laporan',
      timeAgo: '4 menit lalu',
    ),
    NotificationItem(
      avatarUrl: '',
      username: 'Relawan D',
      message: 'Telah membagikan Laporan',
      timeAgo: '5 menit lalu',
    ),
    NotificationItem(
      avatarUrl: '',
      username: 'Relawan E',
      message: 'Telah membagikan Laporan',
      timeAgo: '10 menit lalu',
    ),
    // Add more NotificationItem objects for additional notifications
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
        title: const Text("Notifikasi"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    // Tindakan saat item notifikasi diklik
                  },
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage(notifications[index].avatarUrl),
                    ),
                    title: Text(notifications[index].username),
                    subtitle: Text(notifications[index].message),
                    trailing: Text(notifications[index].timeAgo),
                  ),
                );
              },
            ),
          ),
        ],
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
