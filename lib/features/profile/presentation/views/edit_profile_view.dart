import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/helpers/screen_size.dart';
import 'package:serve_home/core/styles/app_style.dart';
import 'package:serve_home/features/auth/data/models/user_model.dart';
import 'package:serve_home/features/auth/presentation/view_models/auth_view_model.dart';
import 'package:serve_home/features/profile/presentation/view_models/profile_view_model.dart';

class EditProfileView extends StatefulWidget {
  final UserModel user;
  const EditProfileView({super.key, required this.user});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.user.name);
    emailController = TextEditingController(text: widget.user.email);
    phoneController = TextEditingController(text: widget.user.phone);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = ScreenSize.w(context);
    final screenHeight = ScreenSize.h(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white, size: screenWidth * 0.07),
        shadowColor: Colors.white,
        title: Text(
          'Edit Profile',
          style: AppStyle.body19(context).copyWith(
            color: Colors.white,
            fontSize: screenWidth * 0.055,
          ),
        ),
        backgroundColor: AppColor.primary,
      ),
      body: Consumer2<ProfileViewModel, AuthViewModel>(
        builder: (context, provProfile, provAuth, child) => Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.05),
              child: Column(
                children: [
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      prefixIcon: Icon(Icons.account_circle, size: screenWidth * 0.07),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(screenWidth * 0.03),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  TextField(
                    controller: phoneController,
                    decoration: InputDecoration(
                      labelText: 'Mobile',
                      prefixIcon: Icon(Icons.phone_android, size: screenWidth * 0.07),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(screenWidth * 0.03),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        await provProfile.updateUserData(
                          idUser: provAuth.user!.id!,
                          name: nameController.text,
                          email: emailController.text,
                          phone: phoneController.text,
                        );
                        final user = FirebaseAuth.instance.currentUser;
                        await user!.updateDisplayName(nameController.text);
                        await user.updateEmail(emailController.text);
                        await user.reload();
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.primary,
                        padding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.02,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(screenWidth * 0.04),
                        ),
                      ),
                      child: Text(
                        'Save',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.045,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (provProfile.isLoading)
              Center(
                child: CircularProgressIndicator(color: AppColor.primary),
              ),
          ],
        ),
      ),
    );
  }
}
