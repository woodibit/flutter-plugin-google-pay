import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple.shade400, Colors.purple.shade300],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(0), // Remove padding for full-width header
          children: <Widget>[
            // Profile Header
            Container(
              padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade700.withOpacity(0.5), // Semi-transparent header
              ),
              child: Column(
                children: <Widget>[
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white70,
                    child: Icon(
                      Icons.auto_awesome, // Witchy icon
                      size: 50,
                      color: Colors.deepPurple,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    'Enchanted User',
                    style: textTheme.headlineMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Mystic Wanderer | Seeker of Truths',
                    style: textTheme.titleSmall?.copyWith(color: Colors.white70),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),

            // Personal Details Section
            _buildSectionHeader(context, 'Personal Details'),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              color: Colors.white.withOpacity(0.1),
              child: Column(
                children: [
                  _buildProfileListTile(
                    icon: Icons.cake_outlined,
                    title: 'Birthday',
                    subtitle: 'October 31st',
                    iconColor: Colors.pinkAccent,
                  ),
                  _buildProfileListTile(
                    icon: Icons.wb_cloudy_outlined, // Could be a zodiac icon
                    title: 'Zodiac Sign',
                    subtitle: 'Scorpio',
                    iconColor: Colors.lightBlueAccent,
                  ),
                  _buildProfileListTile(
                    icon: Icons.work_outline,
                    title: 'Magical Profession',
                    subtitle: 'Potion Brewer',
                    iconColor: Colors.greenAccent,
                  ),
                  _buildProfileListTile(
                    icon: Icons.location_on_outlined,
                    title: 'Enchanted Abode',
                    subtitle: 'Whispering Woods',
                    iconColor: Colors.orangeAccent,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),

            // App Preferences/Stats Section
            _buildSectionHeader(context, 'App Preferences & Stats'),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
               color: Colors.white.withOpacity(0.1),
              child: Column(
                children: [
                  _buildProfileListTile(
                    icon: Icons.favorite_border,
                    title: 'Favorite Reading Type',
                    subtitle: 'Ancient Runes',
                    iconColor: Colors.redAccent,
                  ),
                  _buildProfileListTile(
                    icon: Icons.settings_outlined,
                    title: 'Notification Settings',
                    subtitle: 'Tap to configure your mystical alerts',
                    iconColor: Colors.tealAccent,
                    onTap: () {
                      // Navigate to notification settings
                    },
                  ),
                   _buildProfileListTile(
                    icon: Icons.bar_chart_outlined,
                    title: 'Spells Cast',
                    subtitle: '42',
                    iconColor: Colors.amberAccent,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24.0),

            // Logout Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
              child: ElevatedButton.icon(
                icon: const Icon(Icons.exit_to_app, color: Colors.white),
                label: const Text('Depart from this Realm (Logout)', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent.shade400.withOpacity(0.8),
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  textStyle: textTheme.labelLarge,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))
                ),
                onPressed: () {
                  // Handle logout
                },
              ),
            ),
            const SizedBox(height: 24.0),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Colors.white.withOpacity(0.9),
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }

  Widget _buildProfileListTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color iconColor,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: iconColor, size: 28),
      title: Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
      subtitle: Text(subtitle, style: TextStyle(color: Colors.white.withOpacity(0.7))),
      trailing: onTap != null ? Icon(Icons.arrow_forward_ios, color: Colors.white.withOpacity(0.7), size: 16) : null,
      onTap: onTap,
    );
  }
}
