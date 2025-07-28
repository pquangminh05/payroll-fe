import 'package:flutter/material.dart';
import '../services/api_service.dart';

class TimeTrackingScreen extends StatefulWidget {
  const TimeTrackingScreen({Key? key}) : super(key: key);

  @override
  State<TimeTrackingScreen> createState() => _TimeTrackingScreenState();
}

class _TimeTrackingScreenState extends State<TimeTrackingScreen> {
  String displayName = 'Người dùng';
  List<Map<String, String>> attendanceRecords = [];

  @override
  void initState() {
    super.initState();
    _fetchUserInfo();
    _fetchAttendanceRecords();
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

  Future<void> _fetchAttendanceRecords() async {
    // Replace with your API call to get attendance records
    // Example:
    // final records = await ApiService.getAttendanceRecords(token);
    // setState(() { attendanceRecords = records; });
    // For now, use static data
    setState(() {
      attendanceRecords = [
        {'date': 'Ngày 26/6/2025', 'checkIn': 'Check-in: 8h00', 'checkOut': 'Check-out: 18h00'},
        {'date': 'Ngày 25/6/2025', 'checkIn': 'Check-in: 8h15', 'checkOut': 'Check-out: 17h45'},
        {'date': 'Ngày 24/6/2025', 'checkIn': 'Check-in: 7h55', 'checkOut': 'Check-out: 18h10'},
        {'date': 'Ngày 23/6/2025', 'checkIn': 'Check-in: 8h05', 'checkOut': 'Check-out: 17h55'},
        {'date': 'Ngày 22/6/2025', 'checkIn': 'Check-in: 8h00', 'checkOut': 'Check-out: 18h00'},
        {'date': 'Ngày 21/6/2025', 'checkIn': 'Check-in: 8h10', 'checkOut': 'Check-out: 17h50'},
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
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
            onPressed: () {
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
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      itemCount: attendanceRecords.length,
                      itemBuilder: (context, index) {
                        final record = attendanceRecords[index];
                        return Column(
                          children: [
                            _buildAttendanceRecord(
                              date: record['date'] ?? '',
                              checkIn: record['checkIn'] ?? '',
                              checkOut: record['checkOut'] ?? '',
                            ),
                            _buildDivider(),
                          ],
                        );
                      },
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