import 'package:aditya_movie/infrastructure/theme/colors.dart';
import 'package:aditya_movie/infrastructure/theme/fonts.dart';
import 'package:aditya_movie/presentation/profile/widget/profile_menu.widget.dart';
import 'package:flutter/material.dart';

import 'package:remixicon/remixicon.dart';
import 'package:sizer/sizer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          top: false,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                child: Container(
                  height: 30.h,
                  width: 100.w,
                  color: primaryColor,
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 4.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(flex: 3, child: Icon(Remix.arrow_left_s_line, color: whiteColor)),
                          Flexible(
                            flex: 6,
                            child: Text(
                              'Profile',
                              style: whitetTextStyle.copyWith(fontSize: 14.sp),
                            ),
                          ),
                          Flexible(flex: 1, child: Container())
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CircleAvatar(
                        radius: 30.sp,
                        backgroundImage: AssetImage('assets/image/ic_avatar.png'),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        'Dedi Kurniawan',
                        style: whitetTextStyle.copyWith(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 25.h,
                child: Container(
                  height: 100.h,
                  width: 100.w,
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Column(
                          children: [
                            ProfileMenuWidget(
                                title: 'Account', desc: 'Privacy, security and settings', icon: Remix.user_line),
                            Divider(
                              thickness: 2,
                            ),
                            ProfileMenuWidget(
                                title: 'Notifications', desc: 'Message, news', icon: Remix.notification_badge_line),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Column(
                          children: [
                            ProfileMenuWidget(
                                title: 'Notifications', desc: 'Message, news', icon: Remix.notification_badge_line),
                            Divider(
                              thickness: 2,
                            ),
                            ProfileMenuWidget(
                                title: 'Categories', desc: 'Choose, add and delete categories', icon: Remix.stack_line),
                            Divider(
                              thickness: 2,
                            ),
                            ProfileMenuWidget(title: 'Storage', desc: 'Manage download', icon: Remix.hard_drive_2_line),
                            Divider(
                              thickness: 2,
                            ),
                            ProfileMenuWidget(
                                title: 'Help', desc: 'Help Center and contat us ', icon: Remix.stack_line),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
