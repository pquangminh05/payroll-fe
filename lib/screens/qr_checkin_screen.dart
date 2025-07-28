import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class QRCheckInScreen extends StatelessWidget {
  const QRCheckInScreen({super.key});

  String _getDisplayName(User? user) {
    if (user == null) return 'Người dùng';

    if (user.displayName != null && user.displayName!.isNotEmpty) {
      String fullName = user.displayName!;
      if (fullName.length > 10) {
        return '${fullName.substring(0, 8)}...';
      }
      return fullName;
    }

    if (user.email != null && user.email!.isNotEmpty) {
      String emailName = user.email!.split('@')[0];
      if (emailName.isNotEmpty) {
        String displayName =
            emailName[0].toUpperCase() + emailName.substring(1).toLowerCase();
        if (displayName.length > 10) {
          return '${displayName.substring(0, 8)}...';
        }
        return displayName;
      }
    }

    return 'Người dùng';
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: Color(0xFFC2CAD0),
      appBar: AppBar(
        backgroundColor: Color(0xFF557A95),
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: CircleAvatar(
            backgroundColor: Colors.red,
            child: Icon(Icons.person, color: Colors.white, size: 20),
          ),
        ),
        title: Row(
          children: [
            Text(
              _getDisplayName(user),
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Icon(Icons.keyboard_arrow_down, color: Colors.black),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.qr_code, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.logout, color: Colors.black),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Nút quay lại
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
          ),

          SizedBox(height: 40),

          // Vùng scan
          Center(
            child: Column(
              children: [
                Text(
                  'Tìm mã để quét',
                  style: TextStyle(fontSize: 18, color: Colors.black87),
                ),
                SizedBox(height: 20),
                Icon(
                  Icons.qr_code_scanner,
                  size: 150,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 0,
        child: SizedBox(
          height: 60,
          child: Center(
            child: IconButton(
              icon: Icon(Icons.home, size: 28, color: Colors.blue),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
            ),
          ),
        ),
      ),
    );
  }
}
