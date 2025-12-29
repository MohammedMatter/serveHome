import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemUiOverlayStyle;
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/router/app_router.dart';
import 'package:serve_home/core/styles/app_style.dart';
import 'package:serve_home/features/auth/presentation/view_models/auth_view_model.dart';
import 'package:serve_home/features/booking/presentation/view_models/booking_view_model.dart';
import 'package:serve_home/features/home/presentation/widgets/mobile_widgets/bottom_navigation_bar_widget.dart';
import 'package:serve_home/features/profile/presentation/views/edit_profile_view.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  void initState() {
    super.initState();
    final authVM = Provider.of<AuthViewModel>(context, listen: false);
    final idUser = FirebaseAuth.instance.currentUser!.uid;

    authVM.listenToUser(idUser: idUser);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBarWidget(),
        body: Consumer2<BookingViewModel, AuthViewModel>(
          builder: (context, provBooking, provAuth, child) {
            if (provAuth.user == null) {
              return const Center(child: CircularProgressIndicator());
            }
            
            return SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          color: AppColor.primary,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 40,
                        left: 20,
                        child: Text(
                          'My Profile',
                          style: AppStyle.body17.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 30,
                        right: 20,
                        child: IconButton(
                          onPressed: () {
                            GoRouter.of(
                              context,
                            ).pushNamed(AppRouter.settingsView);
                          },
                          icon: Icon(
                            Icons.settings,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 120,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.white,
                            foregroundColor: AppColor.primary,
                            backgroundImage: AssetImage(
                              'assets/images/placeholderImage/placeholder.png',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 80),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        _buildProfileItem(
                          Icons.account_circle_outlined,
                          'Name',
                          provAuth.user!.name,
                        ),
                        _buildProfileItem(
                          Icons.email_outlined,
                          'Email',
                          provAuth.user!.email,
                        ),
                        _buildProfileItem(
                          Icons.phone_android_outlined,
                          'Mobile',
                          provAuth.user!.phone,
                        ),
                        _buildProfileItem(
                          Icons.event,
                          'My Bookings',
                          provBooking.allBookings.length.toString(),
                        ),
                        const SizedBox(height: 20),

                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (_) => EditProfileView(
                                            user: provAuth.user!,
                                          ),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColor.primary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 15,
                                  ),
                                ),
                                child: Text(
                                  'Edit Profile',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder:
                                        (context) => Consumer<AuthViewModel>(
                                          builder:
                                              (
                                                context,
                                                provAuth,
                                                child,
                                              ) => Stack(
                                                children: [
                                                  AlertDialog(
                                                    title: Text(
                                                      'Confirm Logout',
                                                    ),
                                                    content: Text(
                                                      'Are you sure you want to logout?',
                                                    ),
                                                    actions: [
                                                      TextButton(
                                                        onPressed:
                                                            () =>
                                                                GoRouter.of(
                                                                  context,
                                                                ).pop(),
                                                        child: Text(
                                                          'Cancel',
                                                          style: TextStyle(
                                                            color:
                                                                AppColor
                                                                    .primary,
                                                          ),
                                                        ),
                                                      ),
                                                      TextButton(
                                                        onPressed: () async {
                                                          await provAuth
                                                              .signOut();
                                                          provAuth.reset(
                                                            context,
                                                          );
                                                          GoRouter.of(
                                                            // ignore: use_build_context_synchronously
                                                            context,
                                                          ).pushReplacementNamed(
                                                            AppRouter
                                                                .signInView,
                                                          );
                                                        },
                                                        child: Text(
                                                          'Logout',
                                                          style: TextStyle(
                                                            color: Colors.red,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  provAuth.isLoading
                                                      ? Center(
                                                        child:
                                                            CircularProgressIndicator(
                                                              color:
                                                                  AppColor
                                                                      .primary,
                                                            ),
                                                      )
                                                      : SizedBox.shrink(),
                                                ],
                                              ),
                                        ),
                                  );
                                },
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(color: Colors.red, width: 2),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 15,
                                  ),
                                ),
                                child: Text(
                                  'Logout',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildProfileItem(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppColor.primary.withOpacity(0.1),
          child: Icon(icon, color: AppColor.primary),
        ),
        title: Text(value, style: AppStyle.body16),
        subtitle: Text(
          title,
          style: AppStyle.body15.copyWith(color: Colors.grey[600]),
        ),
        tileColor: Colors.grey[100],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
