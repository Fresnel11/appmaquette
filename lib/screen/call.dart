import 'package:appmaquette/screen/aside_bar.dart';
import 'package:flutter/material.dart';

class Call extends StatelessWidget {
  const Call({super.key});

  @override
  Widget build(BuildContext context) {
    return const Homenavbar();
  }
}

class Homenavbar extends StatelessWidget {
  const Homenavbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // Couleur blanche pour ressembler à un header standard
        elevation: 0, // Enlever l'ombre de l'AppBar
        iconTheme: const IconThemeData(color: Colors.black), // Icônes en noir
    
        title: Row(
          children: [
            // Bouton de filtre avec texte "Filters" et couleur gris clair
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                iconColor: Colors.grey[300], // Couleur gris clair
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              icon: const Icon(Icons.filter_list, color: Colors.black), // Icône de filtre
              label: const Text(
                'Filters',
                style: TextStyle(color: Colors.black), // Texte en noir
              ),
              onPressed: () {
                // Action pour le filtre
              },
            ),
    
            const SizedBox(width: 10), // Espace entre le bouton de filtre et l'input
    
            // Input de recherche avec une icône de recherche à gauche
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Rechercher...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                ),
              ),
            ),
    
            const SizedBox(width: 10), // Espace entre l'input et les icônes
    
            // Icône de notification
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {
                // Action pour les notifications
              },
            ),
    
            // Icône de paramètres
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
      body: const Center(
        child: Text('Contenu principal de la page call'),
      ),
    );
  }
}
