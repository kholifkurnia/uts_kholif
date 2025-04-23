import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/auth_controller.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final username =
        Provider.of<AuthController>(context).username ?? 'Pengguna';

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 233, 2, 2),
      body: Column(
        children: [
          // Header Biru
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 24),
            color: const Color.fromARGB(255, 101, 101, 101),
            child: const Center(
              child: Text(
                'Dashboard',
                style: TextStyle(
                  color: Color.fromARGB(255, 13, 13, 13),
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          // Grid Menu
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildDashboardCard(
                    context,
                    icon: Icons.add_circle,
                    label: 'Counter',
                    route: '/counter',
                  ),
                  _buildDashboardCard(
                    context,
                    icon: Icons.person,
                    label: 'Profile',
                    route: '/profile',
                  ),
                  _buildDashboardCard(
                    context,
                    icon: Icons.settings,
                    label: 'Settings',
                    route: '/settings',
                  ),
                  _buildDashboardCard(
                    context,
                    icon: Icons.logout,
                    label: 'Logout',
                    onTap: () {
                      Provider.of<AuthController>(
                        context,
                        listen: false,
                      ).logout();
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          // Welcome Box
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 81, 81, 81),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'Selamat datang, $username ',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDashboardCard(
    BuildContext context, {
    required IconData icon,
    required String label,
    String? route,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap:
          onTap ??
          () {
            if (route != null) Navigator.pushNamed(context, route);
          },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 4,
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 50, color: const Color.fromARGB(255, 0, 0, 0)),
              const SizedBox(height: 10),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
