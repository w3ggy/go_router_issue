import 'package:flutter/material.dart';

class SamplePage extends StatefulWidget {
  const SamplePage({
    required this.page,
    required this.name,
    this.onTap,
    super.key,
  });

  final int page;
  final String name;
  final void Function(BuildContext)? onTap;

  @override
  State<StatefulWidget> createState() {
    return SamplePageState();
  }
}

class SamplePageState extends State<SamplePage> {
  String get pageName => '${widget.name} ${widget.page}';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => widget.onTap?.call(context),
        child: Center(child: Text(pageName)),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    debugPrint('$pageName is created');
  }
}
