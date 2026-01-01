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
import 'package:serve_home/core/helpers/screen_size.dart';

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
    authVM.listenToUser(idUser: idUser, password: '');
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = ScreenSize.h(context);
    double screenWidth = ScreenSize.w(context);

    double headerHeight = screenHeight * 0.25;
    double avatarRadius = screenWidth * 0.15;
    double topPadding = screenHeight * 0.04;
    double horizontalPadding = screenWidth * 0.05;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        bottomNavigationBar: const BottomNavigationBarWidget(),
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
                        height: headerHeight,
                        decoration: BoxDecoration(
                          color: AppColor.primary,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(screenWidth * 0.1),
                            bottomRight: Radius.circular(screenWidth * 0.1),
                          ),
                        ),
                      ),
                      Positioned(
                        top: topPadding,
                        left: horizontalPadding,
                        child: Text(
                          'My Profile',
                          style: AppStyle.body15(context).copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: screenWidth * 0.06,
                          ),
                        ),
                      ),
                      Positioned(
                        top: topPadding,
                        right: horizontalPadding,
                        child: IconButton(
                          onPressed: () {
                            GoRouter.of(context).pushNamed(AppRouter.settingsView);
                          },
                          icon: Icon(
                            Icons.settings,
                            color: Colors.white,
                            size: screenWidth * 0.07,
                          ),
                        ),
                      ),
                      Positioned(
                        top: headerHeight * 0.6,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: CircleAvatar(
                            radius: avatarRadius,
                            backgroundColor: Colors.white,
                            foregroundColor: AppColor.primary,
                            backgroundImage: const AssetImage(
                              'assets/images/placeholderImage/placeholder.png',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: avatarRadius * 0.9),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                    child: Column(
                      children: [
                        _buildProfileItem(
                          context,
                          Icons.account_circle_outlined,
                          'Name',
                          provAuth.user!.name,
                          screenWidth,
                        ),
                        _buildProfileItem(
                          context,
                          Icons.email_outlined,
                          'Email',
                          provAuth.user!.email,
                          screenWidth,
                        ),
                        _buildProfileItem(
                          context,
                          Icons.phone_android_outlined,
                          'Mobile',
                          provAuth.user!.phone,
                          screenWidth,
                        ),
                        _buildProfileItem(
                          context,
                          Icons.event,
                          'My Bookings',
                          provBooking.allBookings.length.toString(),
                          screenWidth,
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  GoRouter.of(context).pushNamed(
                                    AppRouter.editProfileView,
                                    extra: provAuth.user,
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColor.primary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(screenWidth * 0.03),
                                  ),
                                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.018),
                                ),
                                child: Text(
                                  'Edit Profile',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: screenWidth * 0.045,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: screenWidth * 0.03),
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => Consumer<AuthViewModel>(
                                      builder: (context, provAuth, child) => Stack(
                                        children: [
                                          AlertDialog(
                                            title: const Text('Confirm Logout'),
                                            content: const Text('Are you sure you want to logout?'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => GoRouter.of(context).pop(),
                                                child: Text(
                                                  'Cancel',
                                                  style: TextStyle(color: AppColor.primary),
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () async {
                                                  await provAuth.signOut();
                                                  provAuth.reset(context);
                                                  provBooking.reset();
                                                  GoRouter.of(context).pushReplacementNamed(AppRouter.signInView);
                                                },
                                                child: const Text(
                                                  'Logout',
                                                  style: TextStyle(color: Colors.red),
                                                ),
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
                                },
                                style: OutlinedButton.styleFrom(
                                  side: const BorderSide(color: Colors.red, width: 2),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(screenWidth * 0.03),
                                  ),
                                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.018),
                                ),
                                child: Text(
                                  'Logout',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: screenWidth * 0.045,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.04),
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

  Widget _buildProfileItem(
      BuildContext context, IconData icon, String title, String value, double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenWidth * 0.02),
      child: ListTile(
        leading: CircleAvatar(
          radius: screenWidth * 0.06,
          backgroundColor: AppColor.primary.withOpacity(0.1),
          child: Icon(icon, color: AppColor.primary, size: screenWidth * 0.07),
        ),
        title: Text(value, style: AppStyle.body16(context).copyWith(fontSize: screenWidth * 0.045)),
        subtitle: Text(
          title,
          style: AppStyle.body15(context)
              .copyWith(color: Colors.grey[600], fontSize: screenWidth * 0.038),
        ),
        tileColor: Colors.grey[100],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(screenWidth * 0.03)),
      ),
    );
  }
}
