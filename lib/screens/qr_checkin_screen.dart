import 'package:flutter/material.dart';
import '../services/api_service.dart';

class QRCheckInScreen extends StatefulWidget {
  const QRCheckInScreen({super.key});

  @override
  State<QRCheckInScreen> createState() => _QRCheckInScreenState();
}

class _QRCheckInScreenState extends State<QRCheckInScreen> {
  String displayName = 'Người dùng';

  @override
  void initState() {
    super.initState();
    _fetchUserInfo();
  }

  Future<void> _fetchUserInfo() async {
    final token = '';
    final info = await ApiService.getUserInfo(token);
    if (info != null && info['displayName'] != null) {
      setState(() {
        displayName = info['displayName'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
              displayName,
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
            onPressed: () {
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
