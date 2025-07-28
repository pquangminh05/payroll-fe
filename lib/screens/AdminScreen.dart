import 'package:flutter/material.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  String displayName = 'ADMIN';

  void _logout() {
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC2CAD0),
      appBar: AppBar(
        backgroundColor: Color(0xFF557A95),
        elevation: 0,
        leading: CircleAvatar(
          backgroundColor: Colors.red,
          child: Icon(Icons.person, color: Colors.white, size: 20),
        ),
        title: Row(
          children: [
            Text(
              displayName,
              style: TextStyle(
                color: Color(0xFFFFFFFF),
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
            onPressed: _logout,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40),

            // Main Admin Panel
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 15,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(height: 20),

                  // Admin Functions
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildAdminMenuItem(
                        icon: Icons.manage_accounts,
                        label: 'Quản lý tài\nkhoản',
                        color: Colors.blue[600]!,
                        onTap: () => Navigator.pushNamed(context, '/account-management'),
                      ),
                      _buildAdminMenuItem(
                        icon: Icons.business_center,
                        label: 'Quản lý\nphòng ban',
                        color: Colors.green[600]!,
                        onTap: () => Navigator.pushNamed(context, '/department-management'),
                      ),
                    ],
                  ),

                  SizedBox(height: 40),

                  // Additional admin options (if needed)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildAdminMenuItem(
                        icon: Icons.analytics,
                        label: 'Báo cáo\nthống kê',
                        color: Colors.orange[600]!,
                        onTap: () => Navigator.pushNamed(context, '/reports'),
                      ),
                      _buildAdminMenuItem(
                        icon: Icons.settings,
                        label: 'Cài đặt\nhệ thống',
                        color: Colors.purple[600]!,
                        onTap: () => Navigator.pushNamed(context, '/system-settings'),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),
                ],
              ),
            ),

            SizedBox(height: 100),

            // Floating Home Button
            Container(
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
                Icons.admin_panel_settings,
                color: Colors.white,
                size: 30,
              ),
            ),

            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget _buildAdminMenuItem({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey[200]!, width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                icon,
                color: color,
                size: 28,
              ),
            ),
            SizedBox(height: 12),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey[700],
                fontWeight: FontWeight.w500,
                height: 1.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}