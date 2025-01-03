import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodloop/Views/screens/authentication/Welcome.dart';
import 'package:foodloop/Views/screens/favorites_list.dart';
import 'package:foodloop/Views/screens/Recipe/recipe_list.dart';
import 'package:foodloop/Views/search.dart';
import 'package:foodloop/Views/utils/AppColor.dart';
import "package:foodloop/views/screens/support/Support.dart";

class FlSideMenu {
  Drawer getDrawer(NavigatorState navState) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              child: Column(
            children: [
              Container(
                  decoration: const BoxDecoration(
                      color: AppColor.primary, shape: BoxShape.circle),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.person,
                      color: AppColor.secondary,
                      size: 40,
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              const Row(children: [Text("Pedro Perez")]),
              const Row(
                children: [Text("pedro.perez@uniandes.edu.co")],
              ),
            ],
          )),
          ListTile(
            title: const Row(
              children: [
                Icon(Icons.list),
                SizedBox(
                  width: 14,
                ),
                Text("My orders")
              ],
            ),
            onTap: () {
              navState.push(MaterialPageRoute(builder: (_) => const Support()));
            },
          ),
          ListTile(
            title: const Row(
              children: [
                Icon(Icons.favorite),
                SizedBox(
                  width: 14,
                ),
                Text("My favorites")
              ],
            ),
            onTap: () {
              navState.push(
                  MaterialPageRoute(builder: (context) => FavoritesList()));
            },
          ),
          ListTile(
            title: const Row(
              children: [
                Icon(Icons.menu_book),
                SizedBox(
                  width: 14,
                ),
                Text("My recipes")
              ],
            ),
            onTap: () {
              navState.push(
                  MaterialPageRoute(builder: (context) => RecipeProduct()));
            },
          ),
          ListTile(
            title: const Row(
              children: [
                Icon(Icons.bar_chart),
                SizedBox(
                  width: 14,
                ),
                Text("My savings")
              ],
            ),
            onTap: () {
              navState.push(MaterialPageRoute(builder: (_) => const search()));
            },
          ),
          ListTile(
            title: const Row(
              children: [
                Icon(Icons.exit_to_app),
                SizedBox(
                  width: 14,
                ),
                Text("Sign Out")
              ],
            ),
            onTap: () {
              FirebaseAuth.instance.signOut();
              navState
                  .push(MaterialPageRoute(builder: (context) => WelcomePage()));

              // Aquí debes agregar la lógica para cerrar sesión
            },
          ),

          // ListTile(
          //   title: const Row(
          //     children: [
          //       Icon(Icons.bar_chart),
          //       SizedBox(width: 14,),
          //       Text("Example prod")
          //     ],
          //   ),
          //   onTap: () {
          //     navState.push(
          //       MaterialPageRoute(builder: (_) => const ProductDetail(prodId: Product.PROD_ID)),
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}
