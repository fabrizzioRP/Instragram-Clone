import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//
import 'package:instagram_clone_app/src/provider/providers.dart';

// ignore: use_key_in_widget_constructors
class InstaHistoryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).users;
    // ignore: sized_box_for_whitespace
    return Container(
      width: double.infinity,
      height: 130,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: user.length, // numero de personas o historias
              itemBuilder: (_, i) => _HistoryStyle(i),
            ),
          ),
        ],
      ),
    );
  }
}

class _HistoryStyle extends StatelessWidget {
  final int index;

  const _HistoryStyle(this.index);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).users;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Expanded(
            child: _StyleHistoryDetails(user[index]['foto']),
          ),
          Text(user[index]['name']),
        ],
      ),
    );
  }
}

class _StyleHistoryDetails extends StatelessWidget {
  final String image;

  const _StyleHistoryDetails(this.image);

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<InteraccionInstaProvider>(context);
    return Container(
      width: 80,
      decoration: BoxDecoration(
        gradient: !themeState.isShow
            ? const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF9B2282),
                  Color(0xFFEEA863),
                ],
              )
            : const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.grey,
                  Colors.grey,
                ],
              ),
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: !themeState.isDarkEnabled ? Colors.white : Colors.black,
          ),
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: GestureDetector(
              onTap: () => themeState.isShow = !themeState.isShow,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage(image)),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
