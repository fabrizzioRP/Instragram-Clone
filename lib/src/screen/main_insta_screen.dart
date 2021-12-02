import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//
import 'package:instagram_clone_app/src/widgets/insta_history.dart';
import 'package:instagram_clone_app/src/provider/providers.dart';
import 'package:instagram_clone_app/src/widgets/insta_post.dart';

// ignore: use_key_in_widget_constructors
class MainInstagramDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<InteraccionInstaProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Instagram'),
        actions: [
          IconButton(
            icon: (!themeState.isDarkEnabled)
                ? const Icon(Icons.dark_mode)
                : const Icon(Icons.light_mode),
            onPressed: () =>
                themeState.isDarkEnabled = !themeState.isDarkEnabled,
          ),
          IconButton(
            icon: const Icon(Icons.add_box_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.heart),
            onPressed: () {},
          ),
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.facebookMessenger),
            onPressed: () {},
          ),
        ],
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          //Histories :
          SliverList(
            delegate: SliverChildListDelegate(
              [
                InstaHistoryWidget(),
              ],
            ),
          ),
          // Post User :
          InstaPostWidget(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          const BottomNavigationBarItem(
              icon: Icon(Icons.home_filled), label: ' '),
          const BottomNavigationBarItem(icon: Icon(Icons.search), label: ' '),
          const BottomNavigationBarItem(
              icon: Icon(Icons.movie_outlined), label: ' '),
          const BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined), label: ' '),
          BottomNavigationBarItem(icon: _navigationprofileUser(), label: ' '),
        ],
      ),
    );
  }

  Container _navigationprofileUser() => Container(
        width: 30,
        height: 30,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage('assets/elonmusk.jpg'),
          ),
        ),
      );
}
