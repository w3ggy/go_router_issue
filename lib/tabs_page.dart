import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({
    required this.navigationShell,
    required this.tabsCount,
    super.key,
  });

  final StatefulNavigationShell navigationShell;
  final int tabsCount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: N1BottomNavigationBar(navigationShell, tabsCount),
    );
  }
}

class N1BottomNavigationBar extends StatefulWidget {
  const N1BottomNavigationBar(
    this.navigationShell,
    this.tabsCount, {
    super.key,
  });

  final StatefulNavigationShell navigationShell;
  final int tabsCount;

  @override
  State<N1BottomNavigationBar> createState() => _N1BottomNavigationBarState();
}

class _N1BottomNavigationBarState extends State<N1BottomNavigationBar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        widget.navigationShell.goBranch(
          index,
          initialLocation: index == widget.navigationShell.currentIndex,
        );

        setState(() {
          currentIndex = index;
        });
      },
      items: List.generate(
        widget.tabsCount,
        (index) => BottomNavigationBarItem(
          icon: const Icon(Icons.tab),
          label: 'Item $index',
        ),
      ),
    );
  }
}
