import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final screenSize = MediaQuery.of(context).copyWith().size;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Center(
              child: Container(
                padding: EdgeInsets.all(20.0),
                child: Image.asset(
                'assets/route.png',
                  width: 100,
                  height: 100,
                ),
              ),
            ),
            Text(
              'Bienvenido a ITravel',
              style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(245, 115, 127, 1.0),
              ),
            ),
            SizedBox(height: 7.0),
            Text(
              'Viaje seguro con nosotros',
              style: TextStyle(
                  fontSize: 16.0,
                color: Colors.black45
              ),
            ),
            Expanded(child: Container()),
            _buildForm(context)
          ],
        ),
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Form(
        child: Column(
          children: <Widget>[
            _buildInputEmail(),
            SizedBox(height: 15.0),
            _buildInputPass(),
            SizedBox(height: 15.0),
            _buildButton(context),
            SizedBox(height: 15.0),
            _buildRegisterButton(context)
          ],
        ),
      ),
    );
  }

  Widget _buildInputEmail() {

    return TextFormField(
      cursorColor: Color.fromRGBO(245, 115, 127, 1.0),
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0)
          ),
          labelText: 'Ingrese su correo electronico'
      ),
      textCapitalization: TextCapitalization.sentences,
      validator: (value){
        if(value.length < 3){
          return 'Ingrese un usuario valido';
        }else{
          return null;
        }
      },
    );
  }

  Widget _buildInputPass() {
    return TextFormField(
      cursorColor: Color.fromRGBO(245, 115, 127, 1.0),
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0)
          ),
          labelText: 'Ingrese su contraseña'
      ),
      obscureText: true,
      validator: (value){
        if(value.length < 3){
          return 'Ingrese una contraseña valida';
        }else{
          return null;
        }
      },
    );
  }

  _buildButton(BuildContext context){
    return RaisedButton(
      elevation: 2.0,
      color: Color.fromRGBO(245, 115, 127, 1.0),
      textColor: Colors.white,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 80.0),
        child: Text('Ingresar', style: TextStyle(fontSize: 18.0),),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0)
      ),
      onPressed: (){
        Navigator.pushReplacementNamed(context, 'home');
      },
    );
  }

  _buildRegisterButton(BuildContext context){
    return GestureDetector(
      child: Text('Registrarse en ITravel',
        style: TextStyle(
            color: Color.fromRGBO(245, 115, 127, 1.0),
            fontWeight: FontWeight.bold
        )
      ),
      onTap: () {},
    );
  }
}
