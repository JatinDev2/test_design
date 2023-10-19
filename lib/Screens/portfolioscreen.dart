import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_design/Screens/projectTab.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(414, 896));

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Portfolio",
          ),
          actions: [
            SvgPicture.asset("assets/bag.svg", height: 24.h, width: 24.w),
            SizedBox(width: 16.w),
            SvgPicture.asset("assets/notification.svg",
                height: 24.h, width: 24.w),
            SizedBox(width: 16.w),
          ],
          bottom: TabBar(
            tabs: const [
              Tab(text: "Project"),
              Tab(text: "Saved"),
              Tab(text: "Shared"),
              Tab(text: "Achievement"),
            ],
            indicatorColor: const Color(0xffDF5532),
            labelColor: const Color(0xffDF5532),
            unselectedLabelColor: Colors.grey.shade600,
            isScrollable: true,
          ),
        ),
        body: const TabBarView(
          children: [
            ProjectTab(),
            Center(child: Text("Saved Tab")),
            Center(child: Text("Shared Tab")),
            Center(child: Text("Achievement Tab")),
          ],
        ),
      ),
    );
  }
}
