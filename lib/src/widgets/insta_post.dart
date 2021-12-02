import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//
import 'package:instagram_clone_app/src/provider/providers.dart';

// ignore: use_key_in_widget_constructors
class InstaPostWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    final interaccion = Provider.of<InteraccionInstaProvider>(context);
    // print('imprimo desde insta post widget : ' + '${user.user}');

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (_, i) => Container(
          padding: const EdgeInsets.only(bottom: 10),
          height: 650,
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 10),
              // titulo :
              _HeaderPost(user.users[i]['foto'], user.users[i]['name']),
              const SizedBox(height: 8),
              // imagen :
              _ImagenHistory(user.users[i]['postImage']),
              // iconos reaccion :
              Row(
                children: [
                  IconButton(
                    icon: !interaccion.isLike
                        ? const Icon(Icons.favorite_outline_rounded)
                        : const Icon(Icons.favorite, color: Colors.red),
                    onPressed: () => interaccion.isLike = !interaccion.isLike,
                  ),
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.comment),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.near_me_outlined),
                    onPressed: () {},
                  ),
                  const SizedBox(width: 190),
                  IconButton(
                    icon: !interaccion.isSave
                        ? const Icon(Icons.bookmark_outline)
                        : const Icon(Icons.bookmark),
                    onPressed: () => interaccion.isSave = !interaccion.isSave,
                  ),
                ],
              ),
              // Reviews:
              _ReactionsPost(
                  user.users[i]['likes'],
                  user.users[i]['descripcion'],
                  user.users[i]['comentario'],
                  user.users[i]['hora']),
            ],
          ),
        ),
        childCount: user.users.length,
      ),
    );
  }
}

class _HeaderPost extends StatelessWidget {
  final String name, image;

  const _HeaderPost(this.image, this.name);

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<InteraccionInstaProvider>(context);
    return Row(
      children: [
        const SizedBox(width: 10),
        Container(
          width: 50,
          height: 45,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF9B2282),
                Color(0xFFEEA863),
              ],
            ),
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: Container(
              decoration: BoxDecoration(
                color: !themeState.isDarkEnabled ? Colors.white : Colors.black,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(1),
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
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          ),
        ),
        const Icon(Icons.more_vert),
        const SizedBox(width: 30),
      ],
    );
  }
}

class _ImagenHistory extends StatelessWidget {
  final String image;
  const _ImagenHistory(this.image);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // ignore: sized_box_for_whitespace
      child: Container(
        width: double.infinity,
        child: FadeInImage(
          placeholder: const AssetImage('assets/giphy.gif'),
          image: NetworkImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _ReactionsPost extends StatelessWidget {
  final String likes, descripcion, comentario, hora;

  const _ReactionsPost(
    this.likes,
    this.descripcion,
    this.comentario,
    this.hora,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      width: double.infinity,
      child: Column(
        children: [
          // likes :
          Row(
            children: [
              Text('$likes likes',
                  style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 4),
          // Description :
          Text(
            descripcion,
            style: const TextStyle(fontSize: 15),
          ),
          // Comment :
          Row(
            children: [
              TextButton(
                style: const ButtonStyle(),
                child: Text(comentario,
                    style: TextStyle(color: Colors.grey.shade500)),
                onPressed: () {},
              ),
            ],
          ),
          // Post Time :
          Row(
            children: [
              Text(hora, style: const TextStyle(fontSize: 11)),
            ],
          )
        ],
      ),
    );
  }
}
