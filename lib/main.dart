import 'package:flutter/material.dart';
import 'package:login_test/src/pages/mensajes.dart';
import 'package:login_test/src/pages/login_page.dart';
import 'package:login_test/src/pages/side_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Mensajes(),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      // initialRoute: LoginPage.id,
      // routes: {
      //   LoginPage.id: (context) => LoginPage(),
      // },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required String title}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sidebar'),
      ),
      // drawer: const NavigationDrawer(),
      drawer: NavBar(),
      body: Center(),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildHeader(context),
            buildMenuItems(context),
          ],
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
      ),
    );
  }

  Widget buildMenuItems(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.add),
          title: const Text('Agregar'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.group),
          title: const Text('Integrantes'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.exit_to_app_outlined),
          title: const Text('Salir'),
          onTap: () {},
        ),
      ],
    );
  }
}
