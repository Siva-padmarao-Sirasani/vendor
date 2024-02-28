import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled/Configurations/AppColors.dart';
import 'package:untitled/Configurations/AppStyles.dart';
import 'package:untitled/Subhash/Subhash.dart';

class SubhashHome extends StatefulWidget {
  const SubhashHome({Key? key}) : super(key: key);

  @override
  State<SubhashHome> createState() => _SubhashHomeState();
}

class _SubhashHomeState extends State<SubhashHome> {
  String penValue = 'DropDown';
  String pencilValue = 'DropDown';
  String bookValue = 'DropDown';

  final CollectionReference particularsCollection =
  FirebaseFirestore.instance.collection('particular');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          "Subhash Stationary",
          style: AppStyles.boldnText(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Particulars'),
                Text("Inventory")
              ],
            ),
            const SizedBox(height: 16.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('Pen:'),
                DropdownButton<String>(
                  value: penValue,
                  onChanged: (String? newValue) {
                    setState(() {
                      penValue = newValue!;
                      saveSelectedValuesToDatabase(); // Call the function here
                    });
                  },
                  items: <String>["DropDown",'High', 'Medium', 'Low']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('Pencil:'),
                DropdownButton<String>(
                  value: pencilValue,
                  onChanged: (String? newValue) {
                    setState(() {
                      pencilValue = newValue!;
                      saveSelectedValuesToDatabase(); // Call the function here
                    });
                  },
                  items: <String>["DropDown",'High', 'Medium', 'Low']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('Book:'),
                DropdownButton<String>(
                  value: bookValue,
                  onChanged: (String? newValue) {
                    setState(() {
                      bookValue = newValue!;
                      saveSelectedValuesToDatabase(); // Call the function here
                    });
                  },
                  items: <String>["DropDown",'High', 'Medium', 'Low']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(height: 16.0,),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 45.0,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context)=>const Subhash()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: AppColors.primaryColor, // Use your primary color
                ),
                child: Text(
                  'Log Out',
                  style: AppStyles.boldnText(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> saveSelectedValuesToDatabase() async {
    try {
      DocumentReference documentReference =
      await particularsCollection.add({
        'penValue': penValue,
        'pencilValue': pencilValue,
        'bookValue': bookValue,
      });
      String documentId = documentReference.id;

      print('Data added successfully with ID: $documentId');
    } catch (e) {
      print('Error saving values to the database: $e');
    }
  }

}
