// ignore: file_names
import 'package:flutter/material.dart';
import 'package:foodloop/ServiceAdapters/Firebase/fb_support_service.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/AppColor.dart';

class Suport2 extends StatefulWidget {
  final String purchaseId;
  final String userId;
  const Suport2({super.key, required this.purchaseId,required this.userId});
  @override
  State<Suport2> createState() => _Suport2State();
}

class _Suport2State extends State<Suport2> {
  final String title = "Support";
  XFile? photo;

  void UploadAndSaveSupport() async{
    if(photo!=null){
      FbSupportService fbSupportService = FbSupportService();
      await fbSupportService.uploadPhoto(photo!, widget.purchaseId, widget.userId);
    }
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

      body: Padding(
  padding: EdgeInsets.all(20),
  child: Center(
    child: ListView(
      children: <Widget>[
        Container(
          width: 200,
          height: 70,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 10),
              Expanded(
                child: Center(
                  child: Text(
                    "Product in poor condition",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              IconButton(
                onPressed: () async {
                  final ImagePicker picker = ImagePicker();
                  photo = await picker.pickImage(source: ImageSource.camera);
                  UploadAndSaveSupport();
                  setState(() {});
                  // Acción al presionar el botón de la cámara
                },
                icon: Icon(Icons.camera_alt),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Container(
          width: 200,
          height: 70,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 10),
              Expanded(
                child: Center(
                  child: Text(
                    "Products are missing",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  // Acción al presionar el botón de la flecha
                },
                icon: Icon(Icons.arrow_forward),
              ),
            ],
          ),
        ),
      ],
    ),
  ),
),


      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
