import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EmployeeInfoScreen extends StatelessWidget {
  const EmployeeInfoScreen({Key? key}) : super(key: key);

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
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Color(0xFF557A95),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.red,
              radius: 16,
              child: Icon(Icons.person, color: Colors.white, size: 18),
            ),
            SizedBox(width: 8),
            Text(
              _getDisplayName(user),
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Icon(Icons.keyboard_arrow_down, color: Colors.white),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.grid_3x3, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.notifications_outlined, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.help_outline, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.logout, color: Colors.white),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Header
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'Thông tin Nhân viên',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),

                  // Avatar
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.person,
                      size: 40,
                      color: Colors.grey[600],
                    ),
                  ),

                  SizedBox(height: 30),

                  // Form fields
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          _buildInfoField('Mã:'),
                          SizedBox(height: 16),
                          _buildInfoField('Họ và tên:'),
                          SizedBox(height: 16),
                          _buildInfoField('Số điện thoại:'),
                          SizedBox(height: 16),
                          _buildInfoField('Email:'),
                          SizedBox(height: 16),
                          _buildInfoField('Phòng ban:'),
                          SizedBox(height: 16),
                          _buildInfoField('Chức vụ:'),
                          SizedBox(height: 16),
                          _buildInfoField(''),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Bottom home button
          Container(
            margin: EdgeInsets.only(bottom: 30),
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Color(0xFF557A95),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF557A95).withOpacity(0.3),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.home,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoField(String label) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: Color(0xFF557A95),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}