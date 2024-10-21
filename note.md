Les Future en Flutter et Dart

1. Introduction aux Future

1.1 Qu'est-ce qu'un Future ?
En Dart, un Future représente une valeur ou un événement qui sera disponible à un moment futur. Les Future sont utilisés pour les opérations asynchrones, c'est-à-dire les tâches qui prennent du temps, comme :

--Récupérer des données depuis une API.
--Lire/écrire dans une base de données locale.
--Effectuer des opérations réseau.

Un Future permet de démarrer une opération asynchrone sans bloquer l'exécution du programme. Cela améliore la réactivité de l'application, en particulier dans les interfaces utilisateur.

1.2 États d'un Future
Un Future peut être dans trois états :
--En attente (pending) : Le Future est encore en cours d'exécution et la valeur n'est pas encore disponible.
--Terminé avec succès (completed with value) : L'opération s'est bien déroulée et la valeur est disponible.
--Terminé avec une erreur (completed with error) : Une erreur s'est produite pendant l'opération.

2. Créer et utiliser un Future
2.1 Créer un Future
Un Future peut être créé de plusieurs manières en Dart. La façon la plus simple est d'utiliser un constructeur ou de déclarer une fonction asynchrone qui retourne un Future.

Exemple 1 : Future avec une fonction anonyme

````dart
Future<String> fetchData() {
  return Future.delayed(Duration(seconds: 2), () {
    return "Données récupérées après 2 secondes";
  });
}
````
Dans cet exemple, la fonction fetchData() retourne un Future<String> qui attend 2 secondes avant de retourner une chaîne de caractères.

2.2 Utilisation du Future
Pour utiliser un Future, il faut attendre que l'opération soit terminée pour accéder à sa valeur. Cela peut être fait de deux manières principales :
Avec then() : Méthode pour traiter un Future une fois qu'il est terminé.
Avec async et await : Syntaxe plus propre et intuitive pour les opérations asynchrones.

Exemple 2 : Utilisation de then()
```dart
fetchData().then((result) {
  print(result);
}).catchError((error) {
  print("Erreur : $error");
});
```
Dans cet exemple, then() est utilisé pour exécuter une fonction lorsque le Future est complété avec succès. En cas d'erreur, catchError() permet de gérer l'exception.

Exemple 3 : Utilisation de async et await
````dart
Future<void> getData() async {
  try {
    String result = await fetchData();
    print(result);
  } catch (error) {
    print("Erreur : $error");
  }
}
````
Avec async et await, le code semble synchrone et est plus facile à lire. Le mot-clé await suspend l'exécution de la fonction jusqu'à ce que le Future soit complété.

3. Gestion des erreurs avec Future
Les erreurs dans un Future peuvent se produire si l'opération échoue (ex. : échec de la connexion réseau). Vous pouvez gérer ces erreurs de deux manières principales :

3.1 Utilisation de catchError()
Comme vu précédemment, catchError() permet de capturer les erreurs lors de l'utilisation de then().

````dart
fetchData().then((result) {
  print(result);
}).catchError((error) {
  print("Une erreur est survenue : $error");
});
````
3.2 Utilisation de try-catch avec async-await
Lorsque vous utilisez await, vous pouvez capturer les erreurs avec un bloc try-catch.

````dart
Future<void> getData() async {
  try {
    String result = await fetchData();
    print(result);
  } catch (error) {
    print("Erreur lors de la récupération des données : $error");
  }
}
````
4. Utiliser Future avec Flutter
Dans une application Flutter, les Future sont souvent utilisés pour des opérations asynchrones comme les requêtes réseau, l'accès à la base de données, etc. Pour mettre à jour l'interface utilisateur après la complétion d'un Future, vous pouvez utiliser un widget comme FutureBuilder.

4.1 Le widget FutureBuilder
Le FutureBuilder est un widget Flutter qui attend la complétion d'un Future et reconstruit l'interface utilisateur en fonction de l'état du Future.

Exemple 4 : Utilisation de FutureBuilder
````dart
import 'package:flutter/material.dart';

class FutureExample extends StatelessWidget {
  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 2));
    return "Données récupérées";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FutureBuilder Example'),
      ),
      body: Center(
        child: FutureBuilder<String>(
          future: fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Erreur : ${snapshot.error}');
            } else {
              return Text('Résultat : ${snapshot.data}');
            }
          },
        ),
      ),
    );
  }
}
````
4.2 Explication de FutureBuilder
future : Le Future à exécuter.
builder : Fonction qui définit l'interface utilisateur en fonction de l'état du Future.
snapshot.connectionState : Indique l'état du Future (en attente, terminé, etc.).
snapshot.data : Contient la donnée une fois que le Future est terminé.
snapshot.error : Contient l'erreur si le Future échoue.

5. Les autres méthodes des Future
5.1 Future.wait()
Si vous avez plusieurs Future à attendre en même temps, vous pouvez utiliser Future.wait().

Exemple 5 : Utilisation de Future.wait()
````dart
Future<void> fetchMultipleData() async {
  List<String> results = await Future.wait([
    fetchData(),
    fetchData(),
    fetchData(),
  ]);
  print(results); // Affichera une liste de résultats.
}
````
5.2 Future.any()
Future.any() renvoie le premier Future complété parmi une liste de Future.

````dart
Future<void> fetchFirstData() async {
  String result = await Future.any([
    fetchData(),
    fetchData(),
    fetchData(),
  ]);
  print(result); // Affichera le premier résultat disponible.
}
````
6. Conclusion
Vous avez appris à utiliser les Future pour gérer des opérations asynchrones en Dart et Flutter. Vous savez maintenant :

Créer et manipuler des Future.
Utiliser then(), catchError(), async et await pour travailler avec des Future.
Gérer les erreurs des opérations asynchrones.
Utiliser FutureBuilder dans Flutter pour mettre à jour l'interface utilisateur en fonction de l'état d'un Future.


<!--
 ██████╗ ██████╗  █████╗ ██╗   ██╗ ██████╗ 
 ██╔══██╗██╔══██╗██╔══██╗██║   ██║██╔═══██╗
 ██████╔╝██████╔╝███████║██║   ██║██║   ██║
 ██╔══██╗██╔══██╗██╔══██║╚██╗ ██╔╝██║   ██║
 ██████╔╝██║  ██║██║  ██║ ╚████╔╝ ╚██████╔╝
 ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝  ╚═══╝   ╚═════╝ 
 
 Par [Melchior BANKOLE]

-->