import 'package:flutter/material.dart';
import 'package:logistics_website/src/features/admin_page/admin_auth/view/login_page.dart';

class LogoutPage extends StatelessWidget {
  const LogoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        margin: const EdgeInsets.all(24),
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 🔹 Logout Icon / Illustration
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.red.shade100,
                child: const Icon(Icons.logout, size: 50, color: Colors.red),
              ),
              const SizedBox(height: 20),

              // 🔹 Title
              Text(
                "Log Out",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey[800],
                ),
              ),
              const SizedBox(height: 10),

              // 🔹 Subtitle
              const Text(
                "Are you sure you want to log out of your account?\nYou will need to log in again to access the admin panel.",
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),

              // 🔹 Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton.icon(
                    icon: const Icon(Icons.cancel, color: Colors.blueGrey),
                    label: const Text("Cancel"),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 14,
                      ),
                      side: BorderSide(color: Colors.blueGrey.shade200),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      // Go back to dashboard or previous tab
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.logout, color: Colors.white),
                    label: const Text("Logout"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      // 🔹 Redirect to login page
                      // Navigator.pushReplacementNamed(context, "/login");
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginPage()),
                        (route) => false, // removes all previous routes
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
