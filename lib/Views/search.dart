import 'package:flutter/material.dart';
import 'package:foodloop/ServiceAdapters/Firebase/fb_char_service.dart';
import 'package:foodloop/ServiceAdapters/Firebase/fb_purchase_service.dart';
import 'package:foodloop/views/bar_sync_fusion_content.dart';
import  'package:foodloop/views/utils/config.dart' as config;

import 'utils/AppColor.dart';

class search extends StatefulWidget {
  const search({super.key});
  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  bool load=true;
  double totalPrice=0;
  Map<String, dynamic> purchasesByMonth = {};
  FbCharService fbChartService = FbCharService();
  FbPurchaseServiceAdapter fbPurchaseServiceAdapter = FbPurchaseServiceAdapter(); 
  @override
  void initState() {
    super.initState();
    customInitState();
  }
    void customInitState()async {
      totalPrice=await fbChartService.SumaTotal();
      purchasesByMonth= await fbPurchaseServiceAdapter.getPurchasesByMont("4hGdoRo0AORn9Q4o3TP9");
      load=false;
      setState(() {
        
      });
    }
  void actualizar(){
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
              Navigator.pop(context); // Acción al presionar el botón
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
              onPressed: () {},
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
      body: load==true? Center(child:Container(width: 100, height: 100,child: CircularProgressIndicator(),)): Container(
        color: AppColor.primarySecondary,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Savings',
              style: TextStyle(
                color: Color(0Xff042A2B),
                fontWeight: FontWeight.bold,
                fontFamily: 'inter',
                fontSize: 6 * 6, // Aumentar el tamaño del texto 15 veces
              ),
            ),
            Text(
              'In ${config.mes} you have saved:',
              style: TextStyle(
                color: Color(0Xff0A5550),
                fontWeight: FontWeight.bold,
                fontFamily: 'inter',
                fontSize: 15, // Aumentar el tamaño del texto 15 veces
              ),
            ),
            Text(
              "\$"'${config.valorMes}',
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.bold,
                fontFamily: 'inter',
                fontSize: 40, // Aumentar el tamaño del texto 15 veces
              ),
            ),
            SizedBox(height: 20), // Espacio entre los textos
            Text(
              'Accumulated Savings: \$${totalPrice}',
              style: TextStyle(
                color: Color(0Xff0A5550),
                fontWeight: FontWeight.bold,
                fontFamily: 'inter',
                fontSize: 5 * 5, // Aumentar el tamaño del texto 15 veces
              ),
            ),
            Expanded(
              child: Container(
                child:
                    BarSyncFusionContent(actualizar:actualizar,totalPrice:totalPrice, purchasesByMonth:purchasesByMonth), // Agregar el widget BarSyncFusionContent aquí
              ),
            ),
          ],
        ),
      ),
    );
  }
}
