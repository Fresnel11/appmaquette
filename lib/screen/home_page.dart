import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:appmaquette/screen/aside_bar.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Homenavbar();
  }
}

class Homenavbar extends StatelessWidget {
  const Homenavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Row(
          children: [
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                iconColor: Colors.grey[300],
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              icon: const Icon(Icons.filter_list, color: Colors.black),
              label: const Text(
                'Filters',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                // Action pour le filtre
              },
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Rechercher...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                ),
              ),
            ),
            const SizedBox(width: 10),
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {
                // Action pour les notifications
              },
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                // Action pour les paramètres
              },
            ),
          ],
        ),
      ),
      drawer: const AsideBar(),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'OVERVIEW',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _OverviewCard(
                  title: 'New Clients',
                  value: '+42',
                  description: '14% more than yesterday',
                  icon: Icons.person_add_alt_1,
                  color: Colors.green,
                ),
                _OverviewCard(
                  title: 'New Reminders',
                  value: '-5',
                  description: '25% less than yesterday',
                  icon: Icons.notifications_active,
                  color: Colors.red,
                ),
                _OverviewCard(
                  title: 'In Service',
                  value: '+16',
                  description: '8% more than yesterday',
                  icon: Icons.build,
                  color: Colors.green,
                ),
              ],
            ),
            SizedBox(height: 40),
            Text(
              'CLIENTS',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ClientsTable(),
            ),
            Expanded(child: MainContent())
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}

class _OverviewCard extends StatelessWidget {
  final String title;
  final String value;
  final String description;
  final IconData icon;
  final Color color;

  const _OverviewCard({
    required this.title,
    required this.value,
    required this.description,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width / 3.5,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 30, color: color),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              value,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ClientsTable extends StatefulWidget {
  const ClientsTable({super.key});

  @override
  State<ClientsTable> createState() => _ClientsTableState();
}

class _ClientsTableState extends State<ClientsTable> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Table(
        border:
            TableBorder.all(width: 1, color: const Color.fromARGB(33, 0, 0, 0)),
        children: [
          TableRow(
            children: [
              TableCell(
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    child: const Text('Name',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.grey)),
                  ),
                ),
              ),
              TableCell(
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    child: const Text('Contact',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.grey)),
                  ),
                ),
              ),
              TableCell(
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    child: const Text('Description',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.grey)),
                  ),
                ),
              ),
              TableCell(
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    child: const Text('Date',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.grey)),
                  ),
                ),
              ),
              TableCell(
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    child: const Text('Price',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.grey)),
                  ),
                ),
              ),
              TableCell(
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    child: const Text('Status',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.grey)),
                  ),
                ),
              ),
            ],
          ),
          ...List<TableRow>.generate(
            10,
            (index) => TableRow(
              children: [
                TableCell(
                  child: Container(
                    padding: const EdgeInsets.all(6.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.person,
                          size: 15,
                        ),
                        const SizedBox(width: 4),
                        Text('Name $index',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    ),
                  ),
                ),
                TableCell(
                  child: Container(
                    padding: const EdgeInsets.all(6.0),
                    child: const Row(
                      children: [
                        Icon(Icons.phone, size: 15),
                        SizedBox(width: 4),
                        Text('00 11 22 33',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    ),
                  ),
                ),
                TableCell(
                  child: Container(
                    padding: const EdgeInsets.all(6.0),
                    child: const Row(
                      children: [
                        Icon(Icons.description, size: 15),
                        SizedBox(width: 4),
                        Text('Description',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    ),
                  ),
                ),
                TableCell(
                  child: Container(
                    padding: const EdgeInsets.all(6.0),
                    child: const Row(
                      children: [
                        Icon(Icons.date_range, size: 15),
                        SizedBox(width: 4),
                        Text('10/10/2024',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    ),
                  ),
                ),
                TableCell(
                  child: Container(
                    padding: const EdgeInsets.all(6.0),
                    child: const Row(
                      children: [
                        Icon(Icons.price_change_outlined, size: 15),
                        SizedBox(width: 4),
                        Text('150KM',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    ),
                  ),
                ),
                TableCell(
                  child: Container(
                    padding: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      color:
                          index % 2 == 0 ? Colors.green[100] : Colors.red[100],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      index % 2 == 0 ? 'Actif' : 'Inactif',
                      style: TextStyle(
                        color: index % 2 == 0 ? Colors.green : Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({super.key});

  Future<List> fetchData() async {
    final response =
        await http.get(Uri.parse('https://restcountries.com/v3.1/all'));

    if (response.statusCode == 200) { // si le code est 200(OK), cela signifie que la requête a reussi
      return jsonDecode(response.body); // les données récuperer sont  converties en json
    } else {
      throw Exception('Failed to load countries'); // gestion des erreurs si  la requête a echoue
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(  // pour s'assurer que le contenu ne se trouve pas derrière les éléments comme la barre d'état ou les bords de l'écran
        child: FutureBuilder<List>(  //construire son widget en fonction de l'état d'un Future. Il prend fetchData comme future ce qui signifie qu'il attend que les données soient chargées.
          future: fetchData(),
          builder: (context, snapshot) { // fonction qui retourne un widget en fonction del'état actuel du snapshot, qui contient les informations sur la connexion à l'API
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child:
                      CircularProgressIndicator()); // Retourne un loader pendant que l'api charge les données
            } else if (snapshot.hasError) {
              // Si il y a une erreur lors de la récupération des données on retourne nun code d'erreur
              return Center(child: Text('Erreur : ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                  child: Text(
                      'Aucun pays trouvé.')); // Dans le cas ou l'API renvoie bien les données mais qu'ils sont vide on affiche un message
            } else {
              // Dans le cas où les données sont bien récuperer et ne sont pas vide in utilises les propriétés et les widgets nécéssaire pour afficher les donnés dans la vue
              final countries = snapshot.data!;
              return ListView.builder(
                itemCount: countries.length,  //ListView.builder crée une liste de widget basée sur le nombre de pays récupérés.
                itemBuilder: (context, index) {
                  return ListTile( // pour chaque pays, un ListTile est créé. Le leading contient une image du drapeau récupérée depuis l'api
                    leading: Image.network(
                      countries[index]['flags']['png'],
                      width: 50,
                      height: 30,
                      fit: BoxFit.cover,
                    ),
                    title: Text(countries[index]['name']['common']),
                    subtitle: Column( // Pour afficher plusieurs lignes d'informations sous le nom
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Population : ${countries[index]['population']?.toString() ?? 'N/A'}'),
                        Text('Capital : ${countries[index]['capital'][0]}'),
                        Text(
                            'Langues:  ${countries[index]['languages']?.values.join(', ') ?? 'N/A'}')
                      ],
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
