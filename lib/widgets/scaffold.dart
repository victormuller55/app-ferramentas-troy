import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Scaffold getScaffoldDefault({
  String? title,
  required Widget body,
  Widget? floatingActionButton,
  Widget? drawer,
  Widget? leading,
  double? expandedHeight,
  Widget? bottomNavigatorBar,
  Widget? flexibleSpace,
  Color? appBarColor,
  Color? bodyColor,
  AppBar? appBar,
  List<Widget>? actions,
}) {


  return Scaffold(
    body: CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          stretch: true,
          floating: true,
          title: title != null ? Text(title.toUpperCase(), style: const TextStyle(fontSize: 17, color: Colors.white)) : null,
          backgroundColor: appBarColor ?? HexColor('050045'),
          actions: actions ?? [],
          leading: leading,
          expandedHeight: expandedHeight,
          pinned: false,
          flexibleSpace: flexibleSpace,
        ),
        SliverList(
          delegate: SliverChildListDelegate([body]),
        ),
      ],
    ),
    floatingActionButton: floatingActionButton,
    drawer: drawer,
    bottomNavigationBar: bottomNavigatorBar,
    backgroundColor: bodyColor ?? Colors.white,
  );
}
