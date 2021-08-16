import 'package:flutter/material.dart';

import 'dice.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dice game',
      home: LogIn(),
    );
  }
}

class LogIn extends StatefulWidget {
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<LogIn> {

  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log in'),
        backgroundColor: Colors.grey,
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: (){}
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: (){}
          )
        ],
      ),
      body: Builder(
         builder: (context) {
           return SingleChildScrollView(
             child: Column(
               children: <Widget>[
                 Form(
                     child: Theme(
                         data: ThemeData(
                             primaryColor: Colors.teal,
                             inputDecorationTheme: InputDecorationTheme(
                                 labelStyle: TextStyle(
                                     color: Colors.teal,
                                     fontSize: 15.0
                                 )
                             )
                         ),
                         child: Container(
                           padding: EdgeInsets.all(40.0),
                           child: Column(
                             children: [
                               TextField(
                                 controller: controller,
                                 decoration: InputDecoration(
                                     labelText: 'Enter "dice"'
                                 ),
                                 keyboardType: TextInputType.emailAddress,
                               ),
                               TextField(
                                 controller: controller2,
                                 decoration: InputDecoration(
                                     labelText: 'Enter Password'
                                 ),
                                 keyboardType: TextInputType.text,
                                 obscureText: true,
                               ),
                               SizedBox(
                                 height: 10.0,
                               ),
                               ButtonTheme(
                                 minWidth: 100.0,
                                 height: 50.0,
                                 child: ElevatedButton(
                                   style: ElevatedButton.styleFrom(
                                     primary: Colors.grey, // background
                                     // onPrimary: Colors.white, // foreground
                                   ),
                                   child: Icon(
                                     Icons.arrow_forward,
                                     color: Colors.white,
                                   ),
                                   onPressed: (){
                                     if(controller.text == 'dice' && controller2.text == '1234') {
                                       Navigator.push(context,
                                           MaterialPageRoute(builder: (BuildContext context)=>Dice()));
                                     }else {
                                        showSnackBar(context);
                                     }
                                   },
                                 ),
                               )
                             ],
                           ),
                         ))
                 )
               ],
             ),
           );
         },
      ),
    );
  }
}

void showSnackBar(BuildContext context) {

  Scaffold.of(context).showSnackBar(
      SnackBar(content:
      Text('로그인 정보를 확인하세요.',
        textAlign: TextAlign.center,),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
     )
  );
}