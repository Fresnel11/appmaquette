import 'package:flutter/material.dart';

class AsideBar extends StatelessWidget {
  const AsideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.white),
            child: Text(
              'ESHOP',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
          ListTile(
            title: const Text('Main Menu'),
            leading: const Icon(Icons.home), // Icône de la maison pour le menu principal
            onTap: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
          const ListTile(
            title: Text(
              'Device',
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.build), // Icône d'outil pour "In Service"
            title: const Text('In Service'),
            onTap: () {
              Navigator.pushNamed(context, '/inservice');
            },
          ),
          ListTile(
            leading: const Icon(Icons.watch_later), // Icône de montre pour "Reserved"
            title: const Text('Reserved'),
            onTap: () {
              Navigator.pushNamed(context, '/reserved');
            },
          ),
          ListTile(
            leading: const Icon(Icons.check_circle), // Icône de coche pour "Repaired"
            title: const Text('Repaired'),
            onTap: () {
              Navigator.pushNamed(context, '/repaired');
            },
          ),
          const ListTile(
            title: Text('CLIENTS'),
          ),
          ListTile(
            leading: const Icon(Icons.people), // Icône de personnes pour "Clients List"
            title: const Text('Clients List'),
            onTap: () {
              Navigator.pushNamed(context, '/clientslist');
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart), // Icône de panier pour "In order"
            title: const Text('In order'),
            onTap: () {
              Navigator.pushNamed(context, '/inorder');
            },
          ),
          ListTile(
            leading: const Icon(Icons.phone), // Icône de téléphone pour "Call"
            title: const Text('Call'),
            onTap: () {
              Navigator.pushNamed(context, '/call');
            },
          ),
          const ListTile(
            title: Text('OTHERS'),
          ),
          ListTile(
            leading: const Icon(Icons.note), // Icône de note pour "Notes"
            title: const Text('Notes'),
            onTap: () {
              Navigator.pushNamed(context, '/notes');
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications), // Icône de cloche pour "Reminders"
            title: const Text('Reminders'),
            onTap: () {
              Navigator.pushNamed(context, '/reminders');
            },
          ),
          ListTile(
            leading: const Icon(Icons.calendar_today), // Icône de calendrier pour "Calendar"
            title: const Text('Calendar'),
            onTap: () {
              Navigator.pushNamed(context, '/calendar');
            },
          ),
        ],
      ),
    );
  }
}
