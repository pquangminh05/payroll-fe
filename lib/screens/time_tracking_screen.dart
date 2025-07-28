import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TimeTrackingScreen extends StatelessWidget {
  const TimeTrackingScreen({Key? key}) : super(key: key);

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
              color: Colors.grey[200],
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
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
            icon: Icon(Icons.grid_3x3, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.notifications_outlined, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.help_outline, color: Colors.black),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'Lịch sử chấm công:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),

                  // Attendance Records
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      children: [
                        _buildAttendanceRecord(
                          date: 'Ngày 26/6/2025:',
                          checkIn: 'Check-in: 8h00',
                          checkOut: 'Check-out: 18h00',
                        ),
                        _buildDivider(),
                        _buildAttendanceRecord(
                          date: 'Ngày 25/6/2025:',
                          checkIn: 'Check-in: 8h15',
                          checkOut: 'Check-out: 17h45',
                        ),
                        _buildDivider(),
                        _buildAttendanceRecord(
                          date: 'Ngày 24/6/2025:',
                          checkIn: 'Check-in: 7h55',
                          checkOut: 'Check-out: 18h10',
                        ),
                        _buildDivider(),
                        _buildAttendanceRecord(
                          date: 'Ngày 23/6/2025:',
                          checkIn: 'Check-in: 8h05',
                          checkOut: 'Check-out: 17h55',
                        ),
                        _buildDivider(),
                        _buildAttendanceRecord(
                          date: 'Ngày 22/6/2025:',
                          checkIn: 'Check-in: 8h00',
                          checkOut: 'Check-out: 18h00',
                        ),
                        _buildDivider(),
                        _buildAttendanceRecord(
                          date: 'Ngày 21/6/2025:',
                          checkIn: 'Check-in: 8h10',
                          checkOut: 'Check-out: 17h50',
                        ),
                        SizedBox(height: 20),
                      ],
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
                  color: Colors.blue[700],
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.3),
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

  Widget _buildAttendanceRecord({
    required String date,
    required String checkIn,
    required String checkOut,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            date,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 8),
          Text(
            checkIn,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(height: 4),
          Text(
            checkOut,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 1,
      color: Colors.grey[200],
    );
  }
}