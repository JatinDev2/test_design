import 'dart:math';
import 'package:flutter/material.dart';
import 'package:faker_dart/faker_dart.dart';
import '../Customs/customCard.dart';
import '../Modals/itemsClass.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProjectTab extends StatefulWidget {
  const ProjectTab({super.key});

  @override
  State<ProjectTab> createState() => _ProjectTabState();
}

class _ProjectTabState extends State<ProjectTab> {
  final faker = Faker.instance;
  final List<Items> _items = [];
  final List<Items> _searchResult = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 10; i++) {
      String imgUrl =
          '${faker.image.unsplash.image(keyword: 'education')},${Random().nextInt(100)}';
      String name = faker.company.companyName();
      String upHead = faker.name.fullName();
      String lowHead =
          "${faker.name.firstName()} ${faker.name.middleName()} ${faker.name.lastName()}";

      Items newItem = Items(
        name: name,
        upHead: upHead,
        lowHead: lowHead,
        imgUrl: imgUrl,
      );
      _items.add(newItem);
    }
  }

  TextEditingController _searchController = TextEditingController();

  void handleSearch() {
    setState(() {
      _searchResult.clear();
      for (int i = 0; i < _items.length; i++) {
        Items tempItem = _items[i];
        if (tempItem.name
                .toLowerCase()
                .contains(_searchController.text.toLowerCase()) ||
            tempItem.upHead
                .toLowerCase()
                .contains(_searchController.text.toLowerCase()) ||
            tempItem.lowHead
                .toLowerCase()
                .contains(_searchController.text.toLowerCase())) {
          setState(() {
            _searchResult.add(tempItem);
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(414, 896));

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.w),
            child: TextField(
              controller: _searchController,
              onChanged: (_) => handleSearch(),
              decoration: InputDecoration(
                hintText: 'Search a Project',
                hintStyle: TextStyle(
                  fontSize: 14.sp,
                  color: const Color(0xff9e95a2),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.w),
                  borderSide: const BorderSide(color: Color(0xffe0e0e0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.w),
                  borderSide: const BorderSide(color: Color(0xffe0e0e0)),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.w),
                  borderSide: const BorderSide(color: Color(0xffe0e0e0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.w),
                  borderSide: const BorderSide(color: Color(0xffe0e0e0)),
                ),
                suffixIcon: Padding(
                  padding: EdgeInsets.all(8.w),
                  child: Container(
                    width: 28.w,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(10.w),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 16.w,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount:
                  _searchResult.isEmpty ? _items.length : _searchResult.length,
              itemBuilder: (BuildContext context, int index) {
                final item = _searchResult.isEmpty
                    ? _items[index]
                    : _searchResult[index];
                return CustomWidget(
                  item: item,
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: 120.w, // Use w for width scaling
        child: FloatingActionButton(
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.w),
          ),
          onPressed: () {},
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.filter_list_outlined,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  'Filter',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.white, fontSize: 14.sp),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
