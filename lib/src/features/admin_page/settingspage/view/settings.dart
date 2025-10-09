import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool darkMode = false;
  bool twoFactorAuth = false;
  String language = "English";

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 700;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          _buildSection("🔐 Account Settings", [
            _buildListTile(
              icon: Icons.person,
              title: "Update Profile",
              subtitle: "Change your name, email, and phone",
              onTap: () {},
            ),
            _buildListTile(
              icon: Icons.lock,
              title: "Change Password",
              subtitle: "Update your account password",
              onTap: () {},
            ),
            SwitchListTile(
              value: twoFactorAuth,
              onChanged: (val) => setState(() => twoFactorAuth = val),
              title: const Text("Two-Factor Authentication"),
              subtitle: const Text("Add extra security to your account"),
              secondary: const Icon(Icons.security),
            ),
          ]),

          _buildSection("🌐 System Settings", [
            _buildListTile(
              icon: Icons.business,
              title: "Company Information",
              subtitle: "Update company name, logo, contact info",
              onTap: () {},
            ),
            _buildListTile(
              icon: Icons.payment,
              title: "Payment Settings",
              subtitle: "Configure available payment methods",
              onTap: () {},
            ),
            _buildListTile(
              icon: Icons.local_shipping,
              title: "Default Dispatch Location",
              subtitle: "Set a default dispatch hub",
              onTap: () {},
            ),
          ]),

          _buildSection("🎨 UI Preferences", [
            SwitchListTile(
              value: darkMode,
              onChanged: (val) => setState(() => darkMode = val),
              title: const Text("Dark Mode"),
              subtitle: const Text("Switch between light and dark theme"),
              secondary: const Icon(Icons.dark_mode),
            ),
            ListTile(
              leading: const Icon(Icons.language),
              title: const Text("Language"),
              subtitle: Text(language),
              trailing: DropdownButton<String>(
                value: language,
                underline: const SizedBox(),
                items: const [
                  DropdownMenuItem(value: "English", child: Text("English")),
                  DropdownMenuItem(value: "French", child: Text("French")),
                  DropdownMenuItem(value: "Spanish", child: Text("Spanish")),
                ],
                onChanged: (val) => setState(() => language = val!),
              ),
            ),
          ]),

          _buildSection("📦 Logistics Settings", [
            _buildListTile(
              icon: Icons.timeline,
              title: "Default Status Flow",
              subtitle: "Edit package status stages",
              onTap: () {},
            ),
            _buildListTile(
              icon: Icons.inventory,
              title: "Shipment Categories",
              subtitle: "Manage weight and size categories",
              onTap: () {},
            ),
            _buildListTile(
              icon: Icons.monetization_on,
              title: "Payment Modes",
              subtitle: "Add or remove payment options",
              onTap: () {},
            ),
          ]),

          _buildSection("🛡 Security Settings", [
            _buildListTile(
              icon: Icons.admin_panel_settings,
              title: "Manage Roles & Permissions",
              subtitle: "Control admin/staff access levels",
              onTap: () {},
            ),
            _buildListTile(
              icon: Icons.devices,
              title: "Login Sessions",
              subtitle: "View active sessions & devices",
              onTap: () {},
            ),
            _buildListTile(
              icon: Icons.block,
              title: "Account Locking",
              subtitle: "Enable lock after failed logins",
              onTap: () {},
            ),
          ]),
        ],
      ),
    );
  }

  /// 🔹 Section Wrapper
  Widget _buildSection(String title, List<Widget> children) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ExpansionTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        childrenPadding: const EdgeInsets.symmetric(horizontal: 16),
        children: children,
      ),
    );
  }

  /// 🔹 Reusable Tile
  Widget _buildListTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.blueAccent),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
