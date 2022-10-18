import 'package:flutter/material.dart';
import 'package:login_test/src/pages/agregar.dart';
import 'package:login_test/src/pages/integrantes.dart';
import 'package:login_test/src/pages/login_page.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('Nombre'),
            accountEmail: const Text('correo'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://cdn.pixabay.com/photo/2015/01/06/16/14/woman-590490_960_720.jpg',
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                image: const NetworkImage(
                    'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text('Agregar'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Agregar(),
              ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.group),
            title: const Text('Integrantes'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Integrantes(),
              ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app_outlined),
            title: const Text('Salir'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => LoginPage(),
              ));
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}
