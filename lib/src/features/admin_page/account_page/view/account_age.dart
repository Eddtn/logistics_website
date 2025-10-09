import 'package:flutter/material.dart';

class AccountsPage extends StatefulWidget {
  const AccountsPage({super.key});

  @override
  State<AccountsPage> createState() => _AccountsPageState();
}

class _AccountsPageState extends State<AccountsPage> {
  final TextEditingController _searchController = TextEditingController();

  List<Map<String, dynamic>> users = [
    {
      "name": "John Doe",
      "email": "john@example.com",
      "role": "Customer",
      "status": "Active",
      "date": "2025-09-01",
    },
    {
      "name": "Alice Smith",
      "email": "alice@example.com",
      "role": "Admin",
      "status": "Suspended",
      "date": "2025-08-15",
    },
    {
      "name": "Michael Lee",
      "email": "michael@example.com",
      "role": "Staff",
      "status": "Active",
      "date": "2025-09-10",
    },
    {
      "name": "Sarah Johnson",
      "email": "sarah@example.com",
      "role": "Customer",
      "status": "Active",
      "date": "2025-09-20",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 700;
    final filteredUsers = users.where((user) {
      final query = _searchController.text.toLowerCase();
      return user["name"].toLowerCase().contains(query) ||
          user["email"].toLowerCase().contains(query);
    }).toList();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // 🔍 Search bar
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: "Search users by name or email...",
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
              fillColor: Colors.grey[100],
            ),
            onChanged: (_) => setState(() {}),
          ),
          const SizedBox(height: 20),

          // 📊 Responsive layout
          Expanded(
            child: isWide
                ? _buildDataTable(filteredUsers) // Desktop
                : _buildCards(filteredUsers), // Mobile
          ),
        ],
      ),
    );
  }

  /// 📊 DataTable for desktop/tablet
  Widget _buildDataTable(List<Map<String, dynamic>> data) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        headingRowColor: WidgetStateProperty.all(Colors.blue.shade50),
        border: TableBorder.all(color: Colors.grey.shade300),
        columns: const [
          DataColumn(label: Text("Name")),
          DataColumn(label: Text("Email")),
          DataColumn(label: Text("Role")),
          DataColumn(label: Text("Status")),
          DataColumn(label: Text("Date Registered")),
          DataColumn(label: Text("Actions")),
        ],
        rows: data.map((user) {
          return DataRow(
            cells: [
              DataCell(Text(user["name"])),
              DataCell(Text(user["email"])),
              DataCell(Text(user["role"])),
              DataCell(_statusChip(user["status"])),
              DataCell(Text(user["date"])),
              DataCell(
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.blue),
                      tooltip: "Edit",
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.block, color: Colors.orange),
                      tooltip: "Suspend",
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      tooltip: "Delete",
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.info, color: Colors.green),
                      tooltip: "View Profile",
                      onPressed: () {
                        _showUserProfile(context, user);
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  /// 📱 Card list for mobile
  Widget _buildCards(List<Map<String, dynamic>> data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (_, i) {
        final user = data[i];
        return Card(
          elevation: 4,
          margin: const EdgeInsets.symmetric(vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blueAccent,
              child: Text(user["name"][0]),
            ),
            title: Text(user["name"]),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Email: ${user["email"]}"),
                Text("Role: ${user["role"]}"),
                Text("Date: ${user["date"]}"),
                Row(
                  children: [
                    const Text("Status: "),
                    _statusChip(user["status"]),
                  ],
                ),
              ],
            ),
            isThreeLine: true,
            trailing: PopupMenuButton<String>(
              onSelected: (val) {
                if (val == "profile") _showUserProfile(context, user);
              },
              itemBuilder: (ctx) => [
                const PopupMenuItem(value: "edit", child: Text("Edit")),
                const PopupMenuItem(value: "suspend", child: Text("Suspend")),
                const PopupMenuItem(value: "delete", child: Text("Delete")),
                const PopupMenuItem(
                  value: "profile",
                  child: Text("View Profile"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// 🎨 Status Chip
  Widget _statusChip(String status) {
    Color color;
    switch (status) {
      case "Active":
        color = Colors.green;
        break;
      case "Suspended":
        color = Colors.red;
        break;
      default:
        color = Colors.grey;
    }
    return Chip(
      label: Text(status, style: const TextStyle(color: Colors.white)),
      backgroundColor: color,
    );
  }

  /// 👤 User Profile Dialog
  void _showUserProfile(BuildContext context, Map<String, dynamic> user) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text("Profile: ${user['name']}"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.email),
              title: Text(user["email"]),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: Text("Role: ${user["role"]}"),
            ),
            ListTile(
              leading: const Icon(Icons.date_range),
              title: Text("Registered: ${user["date"]}"),
            ),
            ListTile(
              leading: const Icon(Icons.check_circle),
              title: Text("Status: ${user["status"]}"),
            ),
          ],
        ),
        actions: [
          TextButton(
            child: const Text("Close"),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
