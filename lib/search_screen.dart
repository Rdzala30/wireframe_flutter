import 'package:flutter/material.dart';
import 'date_selection_screen.dart';

class SearchPage extends StatelessWidget {
  final List<Map<String, dynamic>> searchResults;

  const SearchPage({super.key, required this.searchResults});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Results'),
      ),
      body: ListView.builder(
        itemCount: searchResults.length,
        itemBuilder: (context, index) {

          return GestureDetector(
            onTap: (){
              _handleItemClick(context, searchResults[index]);
            },
            child: ListTile(
              title: Text('Name: ${searchResults[index]['name']}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/${searchResults[index]['image']}',
                    height: 400,
                    width: 400,
                  ),
                  Text('Price: ${searchResults[index]['price']}'),
                  Text('Room: ${searchResults[index]['rooms']}'),
                  Text('child: ${searchResults[index]['child']}'),
                  Text('adult: ${searchResults[index]['adult']}'),
                  Text('area: ${searchResults[index]['area']}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _handleItemClick(BuildContext context, Map<String, dynamic> item) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const DateAndLocationSelectionScreen(),
      ),
    );
  }
}


