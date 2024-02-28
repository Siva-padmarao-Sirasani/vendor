import 'package:flutter/material.dart';
import 'package:untitled/Subhash/Subhash.dart';
import 'package:untitled/Vendor/Vendor.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Subhash()),
                );
              },
                child: CContainer("Subhash App",const Color(0xff625bff))),
            const SizedBox(height: 20.0,),
            InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Vendor()),
                );
              },
                child: CContainer("Vendor App",const Color(0xfffe7133))),
          ],
        ),
      ),
    );
  }
  Widget CContainer(String label,Color color){
    return Container(
      height: 50.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: const Color(0xff282466).withOpacity(0.1)),
      ),
      child: Center(child: Text(label,style: const TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,color: Color(0xffffffff)),)),
    );
  }
}
