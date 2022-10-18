import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  // const LoginPage({super.key});
  static String id = 'login_page';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  late final pref;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Image.asset(
                'assets/images/logo.png',
                height: 300,
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            _userTextField(),
            SizedBox(
              height: 15,
            ),
            _passwordTextField(),
            SizedBox(
              height: 20,
            ),
            _buttonLogin(),
          ],
        ),
      )),
    );
  }

  Future<void> validarDatos(String email, String password) async {
    final response = await LoginService().validar(email, password);

    if (response.statusCode == 200) {
      //almacenar de alguna manera el login

      await pref.setString('usuario', email);

      Global.login = email;
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Principal()));
    } else {
      CoolAlert.show(
        context: context,
        type: CoolAlertType.error,
        title: 'Oops...',
        text: 'El pepe ete sech',
        loopAnimation: false,
      );
    }
  }

  String? login_guardado = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cargaPreferencia();
  }

  void cargaPreferencia() async {
    pref = await SharedPreferences.getInstance();
    login_guardado = pref.getString("usuario");
    emailController.text = login_guardado == null ? "" : login_guardado!;
  }

  Widget _userTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: TextField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              icon: Icon(Icons.email),
              hintText: 'ejemplo@correo.cl',
              labelText: 'Correo Electronico',
            ),
            onChanged: (value) {}),
      );
    });
  }

  Widget _passwordTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: TextField(
            controller: passwordController,
            keyboardType: TextInputType.emailAddress,
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon(Icons.lock),
              hintText: 'Contraseña',
              labelText: 'Contraseña',
            ),
            onChanged: (value) {}),
      );
    });
  }

  Widget _buttonLogin() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return RaisedButton(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
          child: const Text(
            'Iniciar Sesion',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 10,
        color: Colors.amber,
        onPressed: () {
          if (emailController.text.length == 0) {
            Fluttertoast.showToast(
                msg: "Ingrese un email valido",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          } else {
            validarDatos(emailController.text, passwordController.text);
          }
        },
      );
    });
  }
}

class LoginService {
  Future<http.Response> validar(String login, String pass) async {
    return await http.post(
      Uri.parse('https://3437baaa465f.sa.ngrok.io/api/Usuarios'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'login': login, 'pass': pass}),
    );
  }
}

class Global {
  static String login = "";
}

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Principal ${Global.login}"),
        ),
        body: Center(
          child: const Text("ඞඞඞඞඞඞඞ login success"),
        ));
  }
}
