import 'package:flutter/material.dart';
import 'package:latihan_kuis/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

    @override
  State<LoginPage> createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {
  String username = '';
  String password = '';
  bool isLoginSuccess = true;
  bool visible = true;

  _navigatePage() async{
    await Future.delayed(Duration(seconds: 2)); //asyn sama await buat nahan perpindahan halaman, biar snackbar login berhasilnya muncul duluan

    Navigator.push(context, MaterialPageRoute(builder: (context){
      return HomePage(
      username: username
    );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Login Page")
        ),
        body: Column(
          children: [
            usernameField(),
            passwordField(),
            loginButton(context)
          ],
        ),
      ),
    );
  }
  

  Widget usernameField(){
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20, vertical: 10
      ),
      child: TextFormField(
        onChanged: (value){
          username = value;
        },
        enabled: true,
        decoration: InputDecoration(
          labelText: 'Username',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color:Colors.blue)
          )
        ),
      ),
    );
  }

  Widget passwordField(){
    return Container(
      padding: EdgeInsets.symmetric
      (horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: true,
        onChanged: (value){ //sifatnya fungsi makanya pake ()
          password = value;
        },
        obscureText: visible,
        decoration: InputDecoration(
          suffixIcon: IconButton(
          onPressed: (){
            setState(() {
              visible = !visible;
            });
          },
          icon: Icon(visible ? Icons.visibility : Icons. visibility_off),),
          labelText: 'Password',
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.blue)
        )),
      ),
    );
}

  Widget loginButton(BuildContext context){ //widget butuh return, context nerima data dari parent
return Container(
  padding: EdgeInsets.symmetric
      (horizontal: 20, vertical: 10),
      width: MediaQuery.of(context).size.width, //lebarnya bakal ngikutin size parent karena dari variabel context
      child: ElevatedButton(
        onPressed: () {
          String text = ''; // buat nyimpen data
          if (username == 'admin' && password == 'admin'){
             _navigatePage(); //fungsi buat perpindahan halaman
            setState(() {
              text = 'Login Berhasil'; 
              isLoginSuccess = true;
            });
          }
          else {
             setState(() {
              text = 'Login Gagal'; 
              isLoginSuccess = false;
            });
          }

          SnackBar snackBar = SnackBar(
            duration: Durations.medium2,
            backgroundColor: isLoginSuccess ? Colors.green : Colors.red, //yg green sukses dlu, yg red gagal
            content: Text(text));

          ScaffoldMessenger.of(context).showSnackBar(snackBar); //nampilin di layar bagian bawah
        }, 
        child: Text('Login')),
);
}

}