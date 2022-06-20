import 'package:flutter/material.dart';

class iniSearch extends SearchDelegate {
  List<String> osasResults = [
    'Wijaya Hotel',
    'The Oberoi Lombok',
    'Intercontinental Bali Resort',
    'Four Seasons Resort Bali at Jimbaran Bay',
    'Amanjiwo',
    'Alila Purnama',
    'Bawah Reserve',
    'Nihi Sumba',
    'The Mulia, Nusa Dua',
    'Banyan Tree Ungasan, Bali',
    'W Retreat & Spa Bali',
  ];

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
          icon: const Icon(Icons.clear),
        ),
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        onPressed: () => close(context, null),
        icon: const Icon(Icons.arrow_back),
      );

  @override
  Widget buildResults(BuildContext context) => Center(
        child: Text(
          query,
          style: const TextStyle(fontSize: 64),
        ),
      );

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> kesuges = osasResults.where((osasResult) {
      final result = osasResult.toLowerCase();
      final input = query.toLowerCase();

      return result.contains(input);
    }).toList();

    return ListView.builder(
      itemCount: kesuges.length,
      itemBuilder: (context, index) {
        final osas = kesuges[index];

        return ListTile(
          title: Text(osas),
          onTap: () {
            query = osas;
            showResults(context);
          },
        );
      },
    );
  }
}
