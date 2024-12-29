import 'dart:io';
import 'package:flutter/material.dart';

class Registration extends StatefulWidget{
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {

  final _formKey = GlobalKey<FormState>();
  FocusNode nameFocusNode = FocusNode();

  void ValidateAndRedirect(GlobalKey<FormState> _formKey){
    if(_formKey.currentState!.validate()){
      nameFocusNode.unfocus();
      return;
    }
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Registration()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(20),
        child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Image.asset('assets/welocme.jpg', width: 200, height: 200),
            Form(
              key: _formKey,
              child: Column(
              children: [
                TextFormField(
                  focusNode: nameFocusNode,
                  decoration: InputDecoration(
                    hintText: 'Enter your name',
                    labelText: 'Name',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) => value!.isEmpty ? 'Enter your name' : null,
                ),
                Padding(padding: EdgeInsets.all(10)),
                ElevatedButton(onPressed: () => ValidateAndRedirect(_formKey), child: Text('Submit'))
              ],
            ))
          ],
        ),
        ),
      )
    );
  }
}