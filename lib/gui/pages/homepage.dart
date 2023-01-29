import 'package:book_aviyan_final/gui/common_widgets/custom_bottom_navbar.dart';
import 'package:book_aviyan_final/gui/pages/book_seller/book_seller_page.dart';
import 'package:book_aviyan_final/gui/pages/category/category_page.dart';
import 'package:book_aviyan_final/gui/pages/home/home.dart';
import 'package:book_aviyan_final/gui/pages/profile/user_profile_page.dart';
import 'package:book_aviyan_final/gui/pages/promotion/promotion_page.dart';
import 'package:book_aviyan_final/gui/pages/settings/settings_page.dart';
import 'package:book_aviyan_final/gui/pages/upload_books/upload_books_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedPage = 0;
  List _pages = [
    Home(),
    CategoryPage(),
    BookSellerPage(),
    SettingsPage()
  ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final value = await showDialog<bool>(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text('Are you sure you want to exit?'),
                actions: <Widget>[
                  TextButton(
                    child: Text('No'),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                  ),
                  TextButton(
                    child: Text('Yes, exit'),
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                  ),
                ],
              );
            });

        return value == true;
      },
      child: Scaffold(
        body: _pages[_selectedPage],
        bottomNavigationBar: BottomNavbar(
          onChange: (index) {
            _selectedPage = index;
            setState(() {});
          },
        ),
      ),
    );
  }
}
