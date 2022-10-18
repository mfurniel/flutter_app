import 'dart:convert';

import 'package:login_test/models/mensaje.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'side_bar.dart';

class Mensajes extends StatefulWidget {
  const Mensajes({super.key});

  @override
  State<Mensajes> createState() => _MensajesState();
}

class _MensajesState extends State<Mensajes> {
  final url = Uri.parse("https://3437baaa465f.sa.ngrok.io/api/mensajes");
  late Future<List<Mensaje>> mensajes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('SuperMensajes'),
        ),
        drawer: const NavBar(),
        body: FutureBuilder<List<Mensaje>>(
            future: mensajes,
            builder: (context, snap) {
              if (snap.hasData) {
                return ListView.builder(
                    itemCount: snap.data!.length,
                    itemBuilder: (context, i) {
                      return Column(
                        children: [
                          ListTile(
                            title: Text(snap.data![i].login),
                            subtitle: Text(snap.data![i].fecha),
                          ),
                          Divider(),
                        ],
                      );
                    });
              }
              if (snap.hasError) {
                return const Center(
                  child: Text("Ocurrio un error con los datos"),
                );
              }
              return CircularProgressIndicator();
            }));
  }

  @override
  void initState() {
    super.initState();
    mensajes = getmensajes();
  }

  Future<List<Mensaje>> getmensajes() async {
    final res = await http.get(url);
    final lista = List.from(jsonDecode(res.body));
    List<Mensaje> mensajes = [];
    lista.forEach((element) {
      final Mensaje user = Mensaje.fromJson(element);
      mensajes.add(user);
    });
    return mensajes;
  }
}
