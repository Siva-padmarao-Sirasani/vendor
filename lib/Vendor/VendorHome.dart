import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled/Configurations/AppColors.dart';
import 'package:untitled/Configurations/AppStyles.dart';

class VendorHome extends StatefulWidget {
  const VendorHome({super.key});

  @override
  State<VendorHome> createState() => _VendorHomeState();
}

class _VendorHomeState extends State<VendorHome> {
  final CollectionReference particularsCollection =
  FirebaseFirestore.instance.collection('particular');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          "Vendor Home",
          style: AppStyles.boldnText(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: particularsCollection.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }

            // If there is no data in the collection
            if (snapshot.data!.docs.isEmpty) {
              return Text('No data available');
            }

            // Extracting the latest document from the snapshot
            var latestDocument = snapshot.data!.docs.last;
            var penValue = latestDocument['penValue'] ?? 'Not available';
            var pencilValue = latestDocument['pencilValue'] ?? 'Not available';
            var bookValue = latestDocument['bookValue'] ?? 'Not available';

            return Column(
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
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Pen: $penValue'),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Pencil: $pencilValue'),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Book: $bookValue'),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

