import 'package:bitirme/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'ChangePasswordScreen.dart';



class ProfilePage extends StatelessWidget {
  Future<Map<String, String>> getUserData() async {
    // Firebase Firestore'dan kullanıcı verilerini getirme simülasyonu
    await Future.delayed(Duration(seconds: 2));
    return {
      'username': 'Umut Keiyinci',
      'email': 'umut@hotmail.com',
    };
  }

  Future<List<String>> getUserImages() async {
    // Firebase Firestore'dan kullanıcı resimlerini getirme simülasyonu
    await Future.delayed(Duration(seconds: 2));
    // Kullanıcı resimleri için gerçek Firebase Firestore sorgusunu burada değiştirin
    return [
      'https://images.unsplash.com/photo-1592194996308-7b43878e84a6?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDF8fHxlbnwwfHx8fHw%3D',
      'https://images.unsplash.com/photo-1592194996308-7b43878e84a6?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDF8fHxlbnwwfHx8fHw%3D',
      'https://images.unsplash.com/photo-1592194996308-7b43878e84a6?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDF8fHxlbnwwfHx8fHw%3D',
      'https://images.unsplash.com/photo-1592194996308-7b43878e84a6?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDF8fHxlbnwwfHx8fHw%3D',
      'https://images.unsplash.com/photo-1592194996308-7b43878e84a6?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDF8fHxlbnwwfHx8fHw%3D',
      'https://images.unsplash.com/photo-1592194996308-7b43878e84a6?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDF8fHxlbnwwfHx8fHw%3D',
      'https://images.unsplash.com/photo-1592194996308-7b43878e84a6?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDF8fHxlbnwwfHx8fHw%3D',
      'https://images.unsplash.com/photo-1592194996308-7b43878e84a6?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDF8fHxlbnwwfHx8fHw%3D',
      'https://images.unsplash.com/photo-1592194996308-7b43878e84a6?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDF8fHxlbnwwfHx8fHw%3D',
      'https://images.unsplash.com/photo-1592194996308-7b43878e84a6?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDF8fHxlbnwwfHx8fHw%3D',
      'https://images.unsplash.com/photo-1592194996308-7b43878e84a6?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDF8fHxlbnwwfHx8fHw%3D',
      // Daha fazla resim URL'sini buraya ekleyin
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Screen'),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text('Change Password'),
                value: 'change_password',
              ),
              PopupMenuItem(
                child: Text('Log Out'),
                value: 'log_out',
              ),
            ],
            onSelected: (value) {
              if (value == 'change_password') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChangePasswordScreen()),
                );
              } else if (value == 'log_out') {
                // Çıkış işlemleri
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()), // MainPage'e yönlendirme
                );
              }
            },
          ),
        ],
      ),
      body: Center(
        child: FutureBuilder<Map<String, String>>(
          future: getUserData(),
          builder: (context, userDataSnapshot) {
            if (userDataSnapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (userDataSnapshot.hasError) {
              return Text('Error: ${userDataSnapshot.error}');
            } else if (!userDataSnapshot.hasData) {
              return Text('Data not found.');
            } else {
              return FutureBuilder<List<String>>(
                future: getUserImages(),
                builder: (context, imagesSnapshot) {
                  if (imagesSnapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (imagesSnapshot.hasError) {
                    return Text('Error: ${imagesSnapshot.error}');
                  } else if (!imagesSnapshot.hasData) {
                    return Text('Images not found.');
                  } else {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 80,
                          backgroundImage: CachedNetworkImageProvider(
                            imagesSnapshot.data![0], // Profil resmi için ilk resmi kullanın
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          userDataSnapshot.data!['username'] ?? 'Username',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                          userDataSnapshot.data!['email'] ?? 'Email',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        SizedBox(height: 20),
                        // Kullanıcı resimlerini görüntüleme
                        Expanded(
                          child: GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                            ),
                            itemCount: imagesSnapshot.data!.length,
                            itemBuilder: (context, index) {
                              return Stack(
                                alignment: Alignment.bottomLeft,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(1.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: CachedNetworkImageProvider(
                                            imagesSnapshot.data![index],
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    color: Colors.black.withOpacity(0.4),
                                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                    child: Text(
                                      '8', // Rating text
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 20),

                      ],
                    );
                  }
                },
              );
            }
          },
        ),
      ),
    );
  }
}
