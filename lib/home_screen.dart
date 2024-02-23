import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wireframe/login_signup_screen.dart';
import 'date_selection_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> staticData = [
    { 'name': 'Grand Plaza Suites', 'image': 'img1.jpg', 'price': 100.0, 'rooms': 2, 'child': 5, 'adults': 1, 'area': 'vadodra' },
    { 'name': 'Oasis Retreat Hotel', 'image': 'img2.jpg', 'price': 220.0, 'rooms': 3, 'child': 4, 'adults': 2,  'area': 'rajkot' },
    { 'name': 'Serenity Inn & Spa', 'image': 'img3.jpg', 'price': 150.0, 'rooms': 4, 'child': 3, 'adults': 3, 'area': 'vadodra' },
    { 'name': 'Harmony Haven Resort', 'image': 'img4.jpg', 'price': 720.0, 'rooms': 5, 'child': 2, 'adults': 4,  'area': 'rajkot' },
    { 'name': 'Sunset Mirage Lodge', 'image': 'img5.jpg', 'price': 1000.0, 'rooms': 1, 'child': 1, 'adults': 5,  'area': 'vadodra' },
    { 'name': 'Royal Orchid Palace', 'image': 'img6.jpg', 'price': 1270.0, 'rooms': 0, 'child': 2, 'adults': 1,  'area': 'jamnagar' },
    { 'name': 'Tranquil Waterside Retreat', 'image': 'img7.jpg', 'price': 1250.0, 'rooms': 1, 'child': 2, 'adults': 2,  'area': 'bhavnagar' },
    { 'name': 'Majestic Heights Hotel', 'image': 'img8.jpg', 'price': 2400.0, 'rooms': 2, 'child': 4, 'adults': 2,  'area': 'bhavnagar' },
    { 'name': 'Silver Moon Boutique Hotel', 'image': 'img9.jpg', 'price': 5250.0, 'rooms': 5, 'child': 3, 'adults': 4,  'area': 'jamnagar' },
    { 'name': 'Emerald Springs Resort', 'image': 'img10.jpg', 'price': 4120.0, 'rooms': 4, 'child': 1, 'adults': 2,  'area': 'jamnagar' },
    { 'name': 'Regal Horizon Lodge', 'image': 'img11.jpg', 'price': 2220.0, 'rooms': 3, 'child': 5, 'adults': 3,  'area': 'rajkot' },
    { 'name': 'Azure Skies Resort & Spa', 'image': 'img12.jpg', 'price': 780.0, 'rooms': 1, 'child': 4, 'adults': 4,  'area': 'jamnagar' },
    { 'name': 'Velvet Sands Inn', 'image': 'img13.jpg', 'price': 1440.0, 'rooms': 2, 'child': 4, 'adults': 4,  'area': 'surat' },
    { 'name': 'Enchanting Pines Lodge', 'image': 'img14.jpg', 'price': 710.0, 'rooms': 3, 'child': 5, 'adults': 1,  'area': 'jamnagar' },
    { 'name': 'Sapphire Shores Hotel', 'image': 'img15.jpg', 'price': 900.0, 'rooms': 1, 'child': 3, 'adults': 2,  'area': 'rajkot' },
    { 'name': 'Celestial Summit Retreat', 'image': 'img1.jpg', 'price': 750.0, 'rooms': 1, 'child': 5, 'adults': 2,  'area': 'surat' },
    { 'name': 'Whispering Pines Resort', 'image': 'img5.jpg', 'price': 660.0, 'rooms': 4, 'child': 1, 'adults': 3,  'area': 'asa' },
    { 'name': 'Opulent Oasis Hotel', 'image': 'img9.jpg', 'price': 800.0, 'rooms': 4, 'child': 0, 'adults': 4,  'area': 'rajkot' },
    { 'name': 'Radiant Blossom Inn', 'image': 'img10.jpg', 'price': 1500.0, 'rooms': 5, 'child': 5, 'adults': 5,  'area': 'surat' },
    { 'name': 'Golden Crest Retreat', 'image': 'img7.jpg', 'price': 4640.0, 'rooms': 1, 'child': 4, 'adults': 1,  'area': 'surat' },
  ];
  List<Map<String, dynamic>> searchResults = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search for hotel by area . . . .',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  searchResults = staticData
                      .where((hotel) =>
                      hotel['area'].toLowerCase().contains(value.toLowerCase()))
                      .toList();
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder( itemCount: searchResults.isEmpty ? staticData.length : searchResults.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DateAndLocationSelectionScreen(),
                      ),
                    );
                  },

                    child: Card(
                      margin: const EdgeInsets.all(5.0),
                      shadowColor: Colors.blue,
                      color: Colors.yellow[50],
                      child: ListTile(
                        title: Text('Name: ${searchResults.isNotEmpty ? searchResults[index]['name'] : staticData[index]['name']}' , style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                          color: Colors.blueGrey,
                          backgroundColor: Colors.pink[100],
                        ),),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/${searchResults.isNotEmpty ? searchResults[index]['image'] : staticData[index]['image']}', // Update the path as needed
                              height: 220,
                              width: 400,
                            ),
                            Text('Price: ${staticData[index]['price']}'
                              ,  style: const TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                            Text('Room: ${staticData[index]['rooms']}'
                              ,  style: const TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                            Text('child: ${staticData[index]['child']}'
                              ,  style: const TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                            Text('adult: ${staticData[index]['adults']}'
                              ,  style: const TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                            Text('area: ${staticData[index]['area']}'
                              ,  style: const TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          if (index == 1) {
            _logout();
          }
        },
      ),
    );
  }
  Future<void> _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Clear user data
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginSignupScreen()));
  }

}
