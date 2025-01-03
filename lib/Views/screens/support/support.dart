import 'package:flutter/material.dart';
import 'package:foodloop/Entities/purchase_entity.dart';
import 'package:foodloop/ServiceAdapters/Firebase/fb_purchase_service.dart';
import 'package:foodloop/views/screens/support/Support2.dart';

import '../../utils/AppColor.dart';

class Support extends StatefulWidget {
  const Support({super.key});
  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  final String title = "Support";
  bool  load= true;
  FbPurchaseServiceAdapter fbPurchaseServiceAdapter = FbPurchaseServiceAdapter();
  // List<Map<String, dynamic>> orders = [
  //   {
  //     "image": "assets/images/carulla.png",
  //     "order": "Order 1",
  //     "date": "10/10/2023",
  //   },
  //   {
  //     "image": "assets/images/carulla.png",
  //     "order": "Order 2",
  //     "date": "10/10/2024",
  //   },
  //   {
  //     "image": "assets/images/carulla.png",
  //     "order": "Order 3",
  //     "date": "10/10/2024",
  //   },
  // ];
List<Purchase> purchases=[];
String userId="4hGdoRo0AORn9Q4o3TP9";
  @override
  void initState() {
    super.initState();
    customInitState();
  }
    void customInitState()async {
      purchases=await fbPurchaseServiceAdapter.getPurchasesByUserId(userId);
      // print(purchases);
      load=false;
      setState(() {
        
      });
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        title: Image.asset(
          'assets/images/logo_small.png', // Ruta de la imagen para el título
          width: 120, // Ancho de la imagen
          height: 40, // Altura de la imagen
        ),
        centerTitle: true, // Centrar el título
        leading: Container(
          // Botón a la izquierda
          margin: EdgeInsets.all(8), // Margen alrededor del contenedor
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), // Esquinas redondeadas
            color: Colors.white, // Color de fondo blanco
          ),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);// Acción al presionar el botón
            },
            icon: Image.asset(
              'assets/images/Vector.png', // Ruta de la imagen para el botón izquierdo
              width: 24, // Ancho de la imagen
              height: 24, // Altura de la imagen
            ),
          ),
        ),
        actions: [
          Container(
            // Botón a la derecha
            margin: EdgeInsets.all(8), // Margen alrededor del contenedor
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), // Esquinas redondeadas
              color: Colors.white, // Color de fondo blanco
            ),
            child: IconButton(
              onPressed: () {

              },
              icon: Image.asset(
                'assets/images/shopping_cart.png', // Ruta de la imagen para el botón derecho
                width: 24, // Ancho de la imagen
                height: 24, // Altura de la imagen
                color: Colors.black, // Color de la imagen
              ),
            ),
          ),
        ],
      ),

      // body: Padding(
      //   padding: EdgeInsets.all(20),
      //   child: Center(
      //     child: ListView(
      //       children: <Widget>[
      //         Container(
      //           width: double.infinity,
      //           height: 75,
      //           decoration: BoxDecoration(
      //             color: AppColor.grey,
      //             borderRadius: BorderRadius.circular(20),
      //           ),
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //             children: [
      //               Text("Imagen"), // Texto simulando la imagen
      //               Text("Order 1"), // Texto simulando Order 1
      //               Text("10/10/2024"), // Texto simulando la fecha
      //             ],
      //           ),
      //         ),
      //         SizedBox(height: 20),
      //         Container(
      //           width: double.infinity,
      //           height: 75,
      //           decoration: BoxDecoration(
      //             color: AppColor.grey,
      //             borderRadius: BorderRadius.circular(20),
      //           ),
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //             children: [
      //               Text("Imagen"), // Texto simulando la imagen
      //               Text("Order 1"), // Texto simulando Order 1
      //               Text("10/10/2024"), // Texto simulando la fecha
      //             ],
      //           ),
      //         ),
      //         SizedBox(height: 20),
      //         Container(
      //           width: double.infinity,
      //           height: 75,
      //           decoration: BoxDecoration(
      //             color: AppColor.grey,
      //             borderRadius: BorderRadius.circular(20),
      //           ),
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //             children: [
      //               Text("Imagen"), // Texto simulando la imagen
      //               Text("Order 1"), // Texto simulando Order 1
      //               Text("10/10/2024"), // Texto simulando la fecha
      //             ],
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),

      // This trailing comma makes auto-formatting nicer for build methods.
      body: load==true? Center(child:Container(width: 100, height: 100,child: CircularProgressIndicator(),)): ListView.builder(
        padding: EdgeInsets.all(20),
        itemCount: purchases.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              title: Text('Orden ${index+1}'), // Texto simulando Order 1,
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/images/carulla.png"),      
              ),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Suport2(purchaseId:purchases[index].id,userId:userId)));
              },
              subtitle: Text(purchases[index].purchaseDate.toString()),
            ),
          );
        },
      )
    );
  }
  

}
