import 'package:flutter/material.dart';
import 'result_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RoomSelectionScreen(),
    );
  }
}

class RoomSelectionScreen extends StatefulWidget {
  const RoomSelectionScreen({super.key});

  @override
  _RoomSelectionScreenState createState() => _RoomSelectionScreenState();
}

class _RoomSelectionScreenState extends State<RoomSelectionScreen> {
  int selectedRooms = 1;
  int selectedAdults = 1;
  int selectedChildren = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Room Selection'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Select Number of Rooms:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            DropdownButton<int>(
              value: selectedRooms,
              items: List.generate(
                5,
                    (index) => DropdownMenuItem<int>(
                  value: index + 1,
                  child: Text('${index + 1} Rooms'),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  selectedRooms = value!;
                });
              },
            ),
            const SizedBox(height: 16),
            const Text(
              'Select Number of Adults:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            DropdownButton<int>(
              value: selectedAdults,
              items: List.generate(
                5,
                    (index) => DropdownMenuItem<int>(
                  value: index + 1,
                  child: Text('${index + 1} Adults'),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  selectedAdults = value!;
                });
              },
            ),
            const SizedBox(height: 16),
            const Text(
              'Select Number of Children:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            DropdownButton<int>(
              value: selectedChildren,
              items: List.generate(
                5,
                    (index) => DropdownMenuItem<int>(
                  value: index,
                  child: Text('$index Children'),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  selectedChildren = value!;
                });
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                navigateToResultScreen(context);
              },
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }

  void navigateToResultScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(
          selectedRooms: selectedRooms,
          selectedAdults: selectedAdults,
        ),
      ),
    );
  }
}
