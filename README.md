# ejemploriveranimation

A new Flutter application.

## Rive.app

Para poder usar las animcaciones creadas en river.app vamos a usar esta librería:

```sh
flare_flutter: ^2.0.1

```

Si queremos añadir nuevas animaciones, debemos descar el formato .flr y guardarlo en la carpeta assets/animations

En el caso que sea nuestra primera vez, debemos crear la carpeta assets en la raiz del proyecto y debemos añadir la ruta en el pubspec.yaml, de la siguiente forma:

```sh
assets:
    - assets/animations/

```

En nuestro caso no sería necesario crear esta segunda carpeta (animations), pero vamos a ser un poco organizados si para futuros casos queremos añadir distintas imagenes, vídeos, etc.
No siempre será necesario especificar la carpeta entera, también podemos especifar el archivo que queremos que cargue.
Por último debemos recordar que toda aquella carpeta o archivo no añadido en pubspec.yaml en el apartado assets no se podrá llamar desde la aplicación.

Debemos saber que el proyecto creado en rive.app no tiene qué tener solamente una imación, podremos crear más de una en el mismo proyecto.
Para usar una o otra animación, es muy sencillo, solamente debemos indicar en "animation" el nombre que le hagamos puesto a una de nuestras animaciones como se muestra a continuación.

```sh
FlareActor("assets/animations/splash.flr", alignment: Alignment.center, fit:BoxFit.contain, animation:"Animation 1"),

```

Un ejemplo que dentro de un proyecto podemos realizar diferentes animaciones y que debemos rellenar en el campo animation del FlareActor, es tan simple como poner el nombre que le hagamos puesto como se puede apreciar en la captura que he dejado dentro del proyecto en assets con el nombre de captura-proyecto-animaciones.png

