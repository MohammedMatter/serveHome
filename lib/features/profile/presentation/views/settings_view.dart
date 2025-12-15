import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/router/app_router.dart';
import 'package:serve_home/core/styles/app_style.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Settings",
          style: AppStyle.body17.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(height: 20),
            Text(
              "Account",
              style: AppStyle.body16.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            const SizedBox(height: 10),

            _settingItem(
              icon: Icons.person_outline,
              title: "Edit Profile",
              onTap: () => context.push("/editProfile"),
            ),
            _settingItem(
              icon: Icons.lock_outline,
              title: "Change Password",
              onTap: () {
                GoRouter.of(context).pushNamed(AppRouter.changePasswordView) ; 
              },
            ),

            const SizedBox(height: 25),
            Text(
              "App Settings",
              style: AppStyle.body16.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            const SizedBox(height: 10),

            _settingItem(
              icon: Icons.notifications_none,
              title: "Notifications",
              onTap: () {},
            ),
            _settingItem(
              icon: Icons.language_outlined,
              title: "Language",
              trail: "English",
              onTap: () {
                _showLanguageSheet(context);
              },
            ),
            _settingItem(
              icon: Icons.info_outline,
              title: "About App",
              onTap: () =>GoRouter.of(context).pushNamed(AppRouter.aboutAppView),
            ),

            const Spacer(),

            // Logout button
            GestureDetector(
              onTap: () => _logout(context),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.red.withOpacity(0.08),
                ),
                child: Center(
                  child: Text(
                    "Logout",
                    style: AppStyle.body17.copyWith(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _settingItem({
    required IconData icon,
    required String title,
    String? trail,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: AppColor.primary.withOpacity(0.1),
              child: Icon(icon, color: AppColor.primary),
            ),

            const SizedBox(width: 14),

            Expanded(
              child: Text(
                title,
                style: AppStyle.body16.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            if (trail != null)
              Text(
                trail,
                style: AppStyle.body15.copyWith(color: Colors.grey[600]),
              ),

            const SizedBox(width: 8),

            Icon(Icons.arrow_forward_ios,
                size: 18, color: Colors.grey[400])
          ],
        ),
      ),
    );
  }

  // -------------------------
  // Logout Dialog
  // -------------------------
  void _logout(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Confirm Logout"),
        content: Text("Are you sure you want to logout?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel", style: TextStyle(color: AppColor.primary)),
          ),
          TextButton(
            onPressed: () {
              // Add logout logic
            },
            child: const Text("Logout", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }


  void _showLanguageSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius:
            BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Select Language",
                  style: AppStyle.body17.copyWith(
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(height: 20),

              _languageItem("English", context),
              const SizedBox(height: 10),
              _languageItem("Arabic", context),

              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  Widget _languageItem(String lang, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(lang, style: AppStyle.body16),
        ),
      ),
    );
  }
}
