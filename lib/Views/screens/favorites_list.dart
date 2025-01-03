import "package:flutter/material.dart";
import "package:foodloop/Entities/product_entity.dart";
import "package:foodloop/Entities/user_entity.dart";
import "package:foodloop/Models/product_model.dart";
import "package:foodloop/States/favorites_list_state.dart";
import "package:foodloop/ViewModels/favorites_view_model.dart";
import "package:foodloop/Views/screens/product_detail.dart";
import "package:foodloop/Views/utils/AppColor.dart";
import "package:foodloop/Views/widgets/fl_app_bar.dart";
import "package:provider/provider.dart";

class FavoritesList extends StatelessWidget {

  final FavoritesViewModel vm = FavoritesViewModel();

  @override
  Widget build(BuildContext context) {
    FavoritesListState favsState = context.watch<FavoritesListState>();
    vm.initialize(
      currentUserId: User.USER_ID,
      favsState: favsState
    );

    List<Product> favList = favsState.getFavorites();

    Widget body;

    if (favsState.isLoading()) {
      body = Center(child: Container(width: 100, height: 100,
        child: const CircularProgressIndicator(color: AppColor.primary,),));
    } else {
      body = Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: ListView(
            children: [
              const Center(child: Text(
                "These are the products in your favorites list",
                style: TextStyle(fontSize: 12, color: AppColor.grey),
              )),
              ...favList.map<Widget>((fav) {
                return Padding(padding: const EdgeInsets.only(top: 12),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ProductDetail(prodId: fav.id))
                      );
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(fav.imgUrl, height: 70, width: 70, fit: BoxFit.cover,)),
                            const SizedBox(width: 13),
                            Expanded(child:
                              Column(children: [
                                Row(
                                  children: [
                                    Text(fav.name, textAlign: TextAlign.left),
                                  ],
                                ),
                                Row(children: [
                                  Text("\$${fav.discountPrice.round()}", style: const TextStyle(fontWeight: FontWeight.bold)),
                                  const SizedBox(width: 6),
                                  Text("\$${fav.price.round()}", style: const TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    color: AppColor.grey)
                                  ),
                                  const SizedBox(width: 6,),
                                  Text("-${ProductModel.calculateProductDiscount(fav)}%", style: const TextStyle(color: AppColor.primary),)
                                ])
                              ])
                            ),
                            IconButton(
                              onPressed: () {
                                  vm.removeFavorite(fav);
                              },
                              icon: const Icon(
                                Icons.favorite,
                                semanticLabel: "Remove favorite",
                                color: AppColor.favRed,
                              )
                            )
                        ]),
                      )
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: FlAppBar(navState: Navigator.of(context)).appBar(),
      body: body
    );
  }
}