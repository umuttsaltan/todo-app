import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp/core/common/widgets/filled_field.dart';
import 'package:todoapp/core/common/widgets/white_space.dart';
import 'package:todoapp/core/helper/db_helper.dart';
import 'package:todoapp/core/res/colors.dart';
import 'package:todoapp/features/authentication/views/sign_in_screen.dart';
import 'package:todoapp/features/todo/views/add_task_screen.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final tabController = useTabController(initialLength: 2);
    final tabTextStyle = GoogleFonts.poppins(
        fontSize: 16,
        color: Colours.backgroundDark,
        fontWeight: FontWeight.bold);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(85),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RotatedBox(
                      quarterTurns: 2,
                      child: IconButton(
                        onPressed: () async {
                          final navigator = Navigator.of(context);
                          await DBHelper.logout();
                          navigator.pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (_) => const SignInScreen()),
                              (route) => false);
                        },
                        icon: const Icon(
                          AntDesign.logout,
                          color: Colours.light,
                        ),
                      ),
                    ),
                    Text(
                      'Task Management',
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colours.light),
                    ),
                    IconButton.filled(
                      style: IconButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(9)),
                          backgroundColor: Colours.light),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => const AddTaskScreen(),),);
                      },
                      icon: const Icon(
                        Icons.add,
                        color: Colours.backgroundDark,
                      ),
                    ),
                  ],
                ),
                const WhiteSpace(
                  height: 25,
                ),
                const FilledField(
                  prefixIcon: Icon(
                    AntDesign.search1,
                    color: Colours.lightGrey,
                  ),
                  hintText: 'Search',
                  suffixIcon:
                      Icon(FontAwesome.sliders, color: Colours.lightGrey),
                )
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
          children: [
            Row(
              children: [
                const Icon(FontAwesome.tasks, size: 20, color: Colours.light),
                const WhiteSpace(width: 10),
                Text(
                  "Today's Tasks",
                  style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colours.light),
                ),
              ],
            ),
            const WhiteSpace(height: 25),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: ColoredBox(
                color: Colours.light,
                child: TabBar(
                  controller: tabController,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: BoxDecoration(
                    color: Colours.lightGrey,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  labelPadding: EdgeInsets.zero,
                  isScrollable: false,
                  labelColor: Colours.lightBlue,
                  labelStyle: GoogleFonts.poppins(
                      fontSize: 24,
                      color: Colours.lightBlue,
                      fontWeight: FontWeight.bold),
                  unselectedLabelColor: Colours.light,
                  tabs: [
                    Tab(
                      child: SizedBox(
                          width: screenWidth * 0.5,
                          child: Center(
                            child: Text(
                              'Pending',
                              style: tabTextStyle,
                            ),
                          )),
                    ),
                    Tab(
                      child: SizedBox(
                          width: screenWidth * 0.5,
                          child: Center(
                            child: Text(
                              'Completed',
                              style: tabTextStyle,
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
            WhiteSpace(
              height: 20,
            ),
            SizedBox(
              height: screenHeight * 0.26,
              child: TabBarView(
                controller: tabController,
                children: [
                  ColoredBox(color: Colors.red),
                  ColoredBox(color: Colors.blue)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
