import 'package:flutter/material.dart';
import 'package:mdday3/Welcome.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: SignUpPage(),
  ));
}

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override 
  _SignUpPage createState() => _SignUpPage();
}

//class FormModel {}

class _SignUpPage extends State<SignUpPage> {
  bool isButtonActive = false;
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();

  nameController.addListener(() {
    final isButtonActive = nameController.text.isNotEmpty;
    setState(() => this.isButtonActive = isButtonActive);
  });

    emailController.addListener(() {
    final isButtonActive = emailController.text.isNotEmpty;
    setState(() => this.isButtonActive = isButtonActive);
  });
    passwordController.addListener(() {
    final isButtonActive = passwordController.text.isNotEmpty;
    setState(() => this.isButtonActive = isButtonActive);
  });
  }

  @override
  void dispose(){
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }
 
 String dropdownvalue = 'Male';
 var items = ['Male', 'Female', 'Prefer not to say'];

 @override 
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar (
       title: Text('Flutter Exercise 3'),
       ),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: ListView(
          children: <Widget>[
            Image.asset('assets/images/mewlions.jpeg', width: 300, height:300,),
            Container(      
              alignment: Alignment.center,
              padding: EdgeInsets.all(5),
              child: Text(
                'Welcome, Mewlions',
              style: TextStyle(
                color: Colors.black, 
                fontWeight: FontWeight.w900,
                fontSize: 30,
                fontStyle: FontStyle.italic),
       )
       ),

      
       Container(
         alignment: Alignment.center,
         padding: EdgeInsets.all(10),
         child: TextField(
         controller:nameController,
         decoration: InputDecoration(
           border: OutlineInputBorder(),
           labelText: 'Name',
           ),
         ),
       ),
      Container(
         alignment: Alignment.center,
         padding: EdgeInsets.all(10),
         child: TextField(
        controller:emailController,
         decoration: InputDecoration(
           border: OutlineInputBorder(),
           labelText: 'Email',
           ),
         ),
       ),
       Container(
         padding: EdgeInsets.all(10),
         child: TextField(
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
           ),
         ),
       ),
       Container(
          padding: EdgeInsets.all(10),
          height: 80,
          width: 100,

          child: Row(
            children: [
              Text('Gender: ', style: TextStyle(color:Colors.black, fontSize: 20)),
              Container(width: 20),
            DropdownButton(
             // isExpanded: true,
              value: dropdownvalue,
              style: TextStyle(color: Colors.black, fontSize: 20),
            icon: Icon(Icons.keyboard_arrow_down),
            items: items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items)
                );
            }
            ).toList(),

            onChanged: (String? newValue){
              setState(() {
                dropdownvalue = newValue!;
              });
            },
            ),
          ],
          ),

       ),
        Container(
          height: 50,
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: MaterialButton(
                      textColor: Colors.black,
                      color: Colors.cyanAccent,
                      shape: StadiumBorder(side: BorderSide(color: Colors.black12,width: 2)),
                      child: Text('Sign In', style: TextStyle(fontSize:20)),

                      onPressed: isButtonActive?  () {
                        setState(() => isButtonActive = false);
                        nameController.clear();
                        emailController.clear();
                        passwordController.clear();                        
 //                       print(nameController.text);
 //                       print(emailController.text);
 //                       print(passwordController.text);
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyApp()),
                      );} 
                      : null,
                    )
                    ),
          ],
     )));
  }
 }