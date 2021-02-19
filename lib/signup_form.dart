import 'package:flutter/material.dart';
import 'package:klausse/user.dart';

class SignUpForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<SignUpForm> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailAddressController = TextEditingController();
  final passwordController = TextEditingController();
  User user = new User();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    firstNameController.dispose();
    lastNameController.dispose();
    emailAddressController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // Initially password is obscure
  bool _obscureText = true;
  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      appBar: AppBar(

        title: Text('Inscription', style : TextStyle(color : Colors.pink, fontSize: 22) ),

      ),

      body: Center(
        child: Container(
          margin: EdgeInsets.all(30),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: TextFormField(
                    controller: firstNameController,
                    decoration: InputDecoration(
                        hintText: 'Please enter your first name',
                        labelText: 'First name *'),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter first name';
                      }
                      return null;
                    },
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: TextFormField(
                    controller: lastNameController,
                    decoration: InputDecoration(
                      hintText: 'Please enter your last name',
                      labelText: 'Last name *',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter last Name';
                      }
                      return null;
                    },
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: TextFormField(
                    controller: emailAddressController,
                    decoration: InputDecoration(
                      hintText: 'Please enter your email address',
                      labelText: 'Email address *',
                    ),
                    validator: (value) {
                      if (value.isEmpty || !value.characters.contains("@")) {
                        return 'Enter email address';
                      }
                      return null;
                    },
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 8,
                        child: TextFormField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            hintText: 'Please enter your password',
                            labelText: 'Password *',
                          ),
                          validator: (value) {
                            if (value.isEmpty || value.length < 8) {
                              return 'Enter correct password';
                            }
                            return null;
                          },
                          obscureText: _obscureText,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: IconButton(
                          icon: Icon(Icons.remove_red_eye_outlined),
                          onPressed: _toggle,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.teal,
                          onPrimary: Colors.white,
                          textStyle: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                      onPressed: () {
                        user.firstName = firstNameController.text;
                        user.lastName = lastNameController.text;
                        user.emailAddress = emailAddressController.text;
                        user.password = passwordController.text;

                        if (_formKey.currentState.validate()) {
                          // If the form is valid, display a Snackbar.
                        }
                      },
                      child: Text('Submit'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
