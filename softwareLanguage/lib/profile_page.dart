import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'user_store.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userStore = Provider.of<UserStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Profil"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(height: 20), // Daha yukarı taşımak için
                Hero(
                  tag: 'profile-pic',
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        // Profile picture tap action
                      },
                      child: Ink(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        child: CircleAvatar(
                          radius: 75,
                          backgroundColor: Colors.blueAccent,
                          child: Icon(
                            Icons.account_circle,
                            size: 150,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Profil",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                SizedBox(height: 40),
                buildProfileInfo("İsim-Soyisim:", userStore.name ?? ''),
                SizedBox(height: 10),
                buildProfileInfo("Kullanıcı adı:", '@${userStore.username ?? ''}'),
                SizedBox(height: 10),
                buildProfileInfo("E-posta:", userStore.email ?? ''),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.blue[50],
    );
  }

  Widget buildProfileInfo(String label, String info) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(width: 10),
        Text(
          info,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
