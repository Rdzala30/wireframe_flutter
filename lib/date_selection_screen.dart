import 'package:flutter/material.dart';
import 'room_selection_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DateAndLocationSelectionScreen(),
    );
  }
}

class DateAndLocationSelectionScreen extends StatefulWidget {
  const DateAndLocationSelectionScreen({super.key});

  @override
  _DateAndLocationSelectionScreenState createState() =>
      _DateAndLocationSelectionScreenState();
}

class _DateAndLocationSelectionScreenState
    extends State<DateAndLocationSelectionScreen> {
  TextEditingController searchController = TextEditingController();
  DateTime? checkInDate;
  DateTime? checkOutDate;

  Future<void> _selectDate(BuildContext context, bool isCheckIn) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (pickedDate != null && pickedDate != (isCheckIn ? checkOutDate : checkInDate)) {
      setState(() {
        if (isCheckIn) {
          checkInDate = pickedDate;
        } else {
          checkOutDate = pickedDate;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search and Select'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            const SizedBox(height: 16),
            ListTile(
              title: const Center(
                child: Text('Select Date for Check-In' , style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                ),
                ),
              ),
              subtitle: Center(child: Text(checkInDate?.toString() ?? 'Open Calender' ,
                 style: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w300,
              ),

              )),
              onTap: () => _selectDate(context, true),
            ),

               ListTile(
                title: const Center(
                  child: Text('Select Date for Check-Out' , style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w500,


                  ),),
                ),
                subtitle: Center(child: Text(checkOutDate?.toString() ?? 'Open Calender ',
                  style: const TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w300,
                  ),
                )),
                onTap: () => _selectDate(context, false),
              ),

            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RoomSelectionScreen()),
                );
              },
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
