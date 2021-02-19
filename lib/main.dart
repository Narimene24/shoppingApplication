import 'package:flutter/material.dart';
import 'package:klausse/navigationbar.dart';
import 'package:klausse/shop_menu.dart';
import 'package:klausse/signup_form.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Klausse',
      theme: ThemeData(
          brightness: Brightness.light,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primaryColor: Colors.teal[900], // Changing this will change the color of the TabBar
          accentColor: Colors.cyan[600],
          primarySwatch: Colors.blue,
          textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'Montserrat',
              fontSizeFactor: 0.9,
              fontSizeDelta: 2.0,



      )),
      home: MyHomePage(title: 'Klausse'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title, style : TextStyle(color : Colors.pink, fontSize: 22) ),

      ),
      extendBody: true,
      bottomNavigationBar: NavigationBar(),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget> [

            MySignBottom("Sign in", ShopMenu()),
            Container(
                width: 100,
                height: 20,
                child: Align (
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forgot your password ?",
                    style: TextStyle(
                        color: Colors.black, fontSize: 9),
                  ),
                )
            ),
            MySignBottom("Sign up", SignUpForm()),

          ],
        )
      ),

    );
  }
}

class MySignBottom extends StatelessWidget {
  String bottomText;
  Widget routeWidget;
  MySignBottom(this.bottomText, this.routeWidget);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.teal,
          onPrimary: Colors.white,
          textStyle: TextStyle(fontSize: 17),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => routeWidget),
          );
        },
        child: Text(bottomText),
      ),
    );
  }
}



/*body: Container(
        child :Align(
          alignment: Alignment.bottomCenter,
          child : Container (
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[

              IconButton(icon: Icon(Icons.home,
                color: Colors.white),
                onPressed: () {

                },
              ),

              IconButton(icon: Icon(Icons.favorite,
                  color: _hasBeenPressed ? Colors.grey : Colors.cyan),
                  onPressed: () => {
                  setState(() {
                    _hasBeenPressed = !_hasBeenPressed;
                  }
                  ),
                },
              ),

              IconButton(icon: Icon(Icons.shopping_basket,
                  color: Theme.of(context).accentColor),
                  onPressed: () {

                },
              ),

              IconButton(icon: Icon(Icons.search,
                  color: Theme.of(context).accentColor),
                onPressed: () {

                },
              ),

            ],
          ),
          ),

      ),
    ),  */



/*body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),    */ // This trailing comma makes auto-formatting nicer for build methods.

/* int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }   */