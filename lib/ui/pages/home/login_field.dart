// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class LoginField extends StatefulWidget {
  const LoginField({super.key});

  @override
  State<LoginField> createState() => _LoginFieldState();
}

class _LoginFieldState extends State<LoginField> {
  @override
  Widget build(BuildContext context) {
    // bool isRecordarme = false;

    Widget buildEmail() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Correo',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ]),
            height: 60,
            child: const TextField(
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(
                color: Colors.black87,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.email,
                  color: Color(0xff5ac18e),
                ),
                hintText: 'Correo',
                hintStyle: TextStyle(
                  color: Colors.black38,
                ),
              ),
            ),
          ),
        ],
      );
    }

    Widget buildPass() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Contraseña',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ]),
            height: 60,
            child: const TextField(
              obscureText: true,
              style: TextStyle(
                color: Colors.black87,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Color(0xff5ac18e),
                ),
                hintText: 'Contraseña',
                hintStyle: TextStyle(
                  color: Colors.black38,
                ),
              ),
            ),
          ),
        ],
      );
    }

    // Widget buildOlvPass() {
    //   return Container(
    //     alignment: Alignment.centerRight,
    //     child: TextButton(
    //       onPressed: () => print("Olvide la contraseña"),
    //       //padding: const EdgeInsets.only(right: 0),
    //       child: const Text(
    //         'Olvide la contraseña',
    //         style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    //       ),
    //     ),
    //   );
    // }

/*     Widget buildRecordar() {
      return SizedBox(
        height: 20,
        child: Row(children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.green),
            child: Checkbox(
              value: isRecordarme,
              checkColor: Colors.white,
              activeColor: Colors.green,
              onChanged: (value) {
                setState(() {
                  isRecordarme = value!;
                });
              },
            ),
          ),
          const Text(
            'Recordarme',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          )
        ]),
      );
    } */

    Widget buildLoginBtn() {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 25),
        width: double.infinity,
        child: ElevatedButton(
          //onPressed: () => print('Login presionado'),
          onPressed: () => Navigator.of(context).pushNamed('/home'),

          child: const Text(
            'Login',
            style: TextStyle(
              //color: Color(0xff5ac18e),
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }

    // Widget buildCrearCuenta() {
    //   return GestureDetector(
    //     onTap: () => print('Crear cuenta presionado'),
    //     child: RichText(
    //       text: const TextSpan(children: [
    //         TextSpan(
    //           text: 'No tienes cuenta?',
    //           style: TextStyle(
    //             color: Colors.black,
    //             fontSize: 18,
    //             fontWeight: FontWeight.w500,
    //           ),
    //         ),
    //         TextSpan(
    //           text: ' Creala',
    //           style: TextStyle(
    //             color: Colors.green,
    //             fontSize: 18,
    //             fontWeight: FontWeight.bold,
    //           ),
    //         ),
    //       ]),
    //     ),
    //   );
    // }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          'Iniciar Sesión',
          style: TextStyle(
            color: Colors.black,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 50),
        buildEmail(),
        const SizedBox(height: 20),
        buildPass(),
        // buildOlvPass(),
        // buildRecordar(),
        buildLoginBtn(),
        // buildCrearCuenta()
      ],
    );
  }
}
