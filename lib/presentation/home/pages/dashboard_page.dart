// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:byte_store/core/assets/assets.gen.dart';
import 'package:byte_store/core/constants/colors.dart';
import 'package:byte_store/presentation/home/pages/home_page.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  final int currentTab;
  const DashboardPage({
    Key? key,
    required this.currentTab,
  }) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late int _selectedIndex;
  final List<Widget> _pages = [
    const Center(
      child: HomePage(),
    ),
    const Center(
      child: Text('This page 2'),
    ),
    const Center(
      child: Text('This page 3'),
    ),
    const Center(
      child: Text('This page 4'),
    ),
  ];

  void _onItemTapped(int index) {
    _selectedIndex = index;
    setState(() {});
  }

  @override
  void initState() {
    _selectedIndex = widget.currentTab;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.primary,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Assets.icons.home.svg(
              colorFilter: const ColorFilter.mode(
                AppColors.grey,
                BlendMode.srcIn,
              ),
            ),
            activeIcon: Assets.icons.home.svg(),
            label: 'HOME',
          ),
          BottomNavigationBarItem(
            icon: Assets.icons.search.svg(
              colorFilter: const ColorFilter.mode(
                AppColors.grey,
                BlendMode.srcIn,
              ),
            ),
            activeIcon: Assets.icons.search.svg(),
            label: 'EXPLORE',
          ),
          BottomNavigationBarItem(
            icon: Assets.icons.order.svg(
              colorFilter: const ColorFilter.mode(
                AppColors.grey,
                BlendMode.srcIn,
              ),
            ),
            activeIcon: Assets.icons.order.svg(),
            label: 'ORDER',
          ),
          BottomNavigationBarItem(
            icon: Assets.icons.person.svg(
              colorFilter: const ColorFilter.mode(
                AppColors.grey,
                BlendMode.srcIn,
              ),
            ),
            activeIcon: Assets.icons.person.svg(),
            label: 'ACCOUNT',
          ),
        ],
      ),
    );
  }
}
