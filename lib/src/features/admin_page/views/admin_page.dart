import 'package:flutter/material.dart';
import 'package:logistics_website/src/features/admin_page/account_page/view/account_age.dart';
import 'package:logistics_website/src/features/admin_page/delivery/view/addDeliveriespage.dart';
import 'package:logistics_website/src/features/admin_page/admin_auth/view/logout_page.dart';
import 'package:logistics_website/src/features/admin_page/settingspage/view/settings.dart';
import 'package:logistics_website/src/features/admin_page/delivery/view/dashboard.dart';

class AdminPanel extends StatelessWidget {
  const AdminPanel({super.key});

  @override
  Widget build(BuildContext context) {
    bool isWide = MediaQuery.of(context).size.width >= 800;

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Admin Panel"),
          actions: [
            IconButton(icon: const Icon(Icons.search), onPressed: () {}),
            IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, color: Colors.blue),
              ),
            ),
          ],
          bottom: TabBar(
            isScrollable: !isWide, // scrollable on mobile, fixed on desktop
            indicatorColor: Colors.white,
            tabs: const [
              Tab(icon: Icon(Icons.dashboard), text: "Dashboard"),
              Tab(icon: Icon(Icons.add_box), text: "Add Tracking"),
              Tab(icon: Icon(Icons.people), text: "Accounts"),
              Tab(icon: Icon(Icons.settings), text: "Settings"),
              Tab(icon: Icon(Icons.logout), text: "Logout"),
            ],
          ),
        ),
        body: const TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            DashboardPage(),
            AddDeliveriesPage(),
            AccountsPage(),
            SettingsPage(),
            LogoutPage(),
          ],
        ),
      ),
    );
  }
}
