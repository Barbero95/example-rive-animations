import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Ejemplo de River animation'),
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
  int _rouletteState = 0;
  String rouletteWord = 'Active';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Este es un ejemplo simple donde solamente tiene una animación, esta cogida de: https://rive.app/a/pollux/files/flare/success-check
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Text("Ejemplo sencillo"),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              width: 100.0,
              height: 100.0,
              child: FlareActor("assets/animations/Success Check.flr",
                fit: BoxFit.cover,
                animation: ("Untitled"),
              ),
            ),
            //Este caso es para nota, cada vez que apretemos sobre la ruleta cambia de estado y se mueve.
            //Pero como podemos comprobar no acaba siempre en el mismo color, tiene 4 estados (acaba en 4 colores diferentes)
            //La animación está es casera y está hecha por mi, eso quiere decir que es cutre
            //Dejo una captura de las animaciones que dispone la ruleta, son 4 estados pero para cada uno de los tres casos Active, Static y Stars
            //Solo nos debemos centrar en los casos:
            // - Static //Caso cuando arranca el apk
            // - Active_1 //Caso apretamos sobre la ruleta primera vez
            // - Active_2 //Caso cuando apretamos por segunda vez
            // - Active_3 //Caso cuando apretamos por tercera vez
            // - Active_4 //Cuando apretamos por quinta vez
            // Una vez llegamos al estado 4, el siguiente estado es el 1 y empezamos de nuevo
            //podremos ver que concatenamos correctamente los colores de inicio de animación con el final de la anterior
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              child: Text("Ejemplo con más de una animación"),
            ),
            GestureDetector(
                onTap: () {
                  int nextRouletteState = _rouletteState == 0
                      ? 1
                      : _rouletteState == 4 ? 1 : _rouletteState + 1;
                  setState(() {
                    rouletteWord = 'Active';
                    _rouletteState = nextRouletteState;
                  });
                },
                child: Container(
                  color: Colors.transparent,
                  height: 160,
                  width: 200,
                  child: FlareActor("assets/animations/roulette.flr",
                      fit: BoxFit.cover,
                      animation: rouletteWord == 'Active' && _rouletteState == 0
                          ? "Static"
                          : rouletteWord + "_$_rouletteState"),
                )),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
