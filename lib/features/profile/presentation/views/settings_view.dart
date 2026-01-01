import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/router/app_router.dart';
import 'package:serve_home/core/styles/app_style.dart';
import 'package:serve_home/core/helpers/screen_size.dart';
import 'package:serve_home/features/auth/presentation/view_models/auth_view_model.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = ScreenSize.w(context);
    double screenHeight = ScreenSize.h(context);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Settings",
          style: AppStyle.body17(context).copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: screenWidth * 0.05,
          ),
        ),
      ),
      body: Consumer<AuthViewModel>(
        builder: (context, provAuth, child) => Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.02),
              Text(
                "Account",
                style: AppStyle.body16(context).copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                  fontSize: screenWidth * 0.045,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              _settingItem(
                icon: Icons.person_outline,
                context: context,
                title: "Edit Profile",
                screenWidth: screenWidth,
                onTap: () => GoRouter.of(context).pushNamed(
                  AppRouter.editProfileView,
                  extra: provAuth.user,
                ),
              ),
              _settingItem(
                icon: Icons.lock_outline,
                context: context,
                title: "Change Password",
                screenWidth: screenWidth,
                onTap: () => GoRouter.of(context).pushNamed(AppRouter.changePasswordView),
              ),
              SizedBox(height: screenHeight * 0.025),
              Text(
                "App Settings",
                style: AppStyle.body16(context).copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                  fontSize: screenWidth * 0.045,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              _settingItem(
                icon: Icons.info_outline,
                context: context,
                title: "About App",
                screenWidth: screenWidth,
                onTap: () => GoRouter.of(context).pushNamed(AppRouter.aboutAppView),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => _logout(context),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(screenWidth * 0.04),
                    color: Colors.red.withOpacity(0.08),
                  ),
                  child: Center(
                    child: Text(
                      "Logout",
                      style: AppStyle.body17(context).copyWith(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth * 0.05,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
            ],
          ),
        ),
      ),
    );
  }

  Widget _settingItem({
    required IconData icon,
    required String title,
    required BuildContext context,
    required double screenWidth,
    required VoidCallback onTap,
    String? trail,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: screenWidth * 0.03),
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.035,
          vertical: screenWidth * 0.04,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(screenWidth * 0.035),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: screenWidth * 0.06,
              // ignore: deprecated_member_use
              backgroundColor: AppColor.primary.withOpacity(0.1),
              child: Icon(icon, color: AppColor.primary, size: screenWidth * 0.065),
            ),
            SizedBox(width: screenWidth * 0.035),
            Expanded(
              child: Text(
                title,
                style: AppStyle.body16(context).copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: screenWidth * 0.045,
                ),
              ),
            ),
            if (trail != null)
              Text(
                trail,
                style: AppStyle.body15(context).copyWith(
                  color: Colors.grey[600],
                  fontSize: screenWidth * 0.04,
                ),
              ),
            SizedBox(width: screenWidth * 0.02),
            Icon(Icons.arrow_forward_ios, size: screenWidth * 0.045, color: Colors.grey[400]),
          ],
        ),
      ),
    );
  }

  void _logout(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Consumer<AuthViewModel>(
        builder: (context, provAuth, child) => Stack(
          children: [
            AlertDialog(
              title: const Text("Confirm Logout"),
              content: const Text("Are you sure you want to logout?"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    "Cancel",
                    style: TextStyle(color: AppColor.primary),
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    await provAuth.signOut();
                    provAuth.reset(context);
                    GoRouter.of(context).pushReplacementNamed(AppRouter.signInView);
                  },
                  child: const Text("Logout", style: TextStyle(color: Colors.red)),
                ),
              ],
            ),
            provAuth.isLoading
                ? const Center(child: CircularProgressIndicator())
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
