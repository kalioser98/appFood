import 'package:flutter/material.dart';
import 'package:foodloop/Entities/product_entity.dart';
import 'package:foodloop/Entities/user_entity.dart';
import 'package:foodloop/States/favorites_list_state.dart';
import 'package:foodloop/States/product_detail_state.dart';
import 'package:foodloop/ViewModels/product_detail_view_model.dart';
import 'package:foodloop/Views/utils/AppColor.dart';
import 'package:foodloop/Views/widgets/fl_app_bar.dart';
import 'package:provider/provider.dart';

class ProductDetail extends StatelessWidget {

  final String prodId;

  const ProductDetail({super.key, required this.prodId});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProductDetailState(),
      child: _ProductDetailStateful(prodId, ProductDetailViewModel(prodId)),
    );
  }
}

class _ProductDetailStateful extends StatelessWidget {

  final ProductDetailViewModel vm;

  const _ProductDetailStateful(String prodId, this.vm);

  @override
  Widget build(BuildContext context) {

    var prodState = context.watch<ProductDetailState>();
    var favsState = context.watch<FavoritesListState>();
    vm.initialize(
      prodState: prodState, favsState: favsState, currentUserId: User.USER_ID);

    Product? prod = prodState.getProduct();
    bool favorite = vm.isFavorite();
    IconData icon;
    Widget body;

    if(favorite) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    if (prodState.isLoading()) {
      body = Center(child:Container(width: 100, height: 100,
        child: const CircularProgressIndicator(color: AppColor.primary,),));
    } else if(prod == null) {
      body = const Text("Product not found :(");
    } else {
      body = Center(
          child: ListView(
            children: [
              Image.network(prod.imgUrl, height: 277, fit: BoxFit.cover),
              Container(
                color: AppColor.primary,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(prod.name, style: const TextStyle(color: AppColor.secondary, fontSize: 16),),
                          favsState.isLoading() ?
                          const SizedBox(
                            height: 40,
                            width: 40,
                            child: Center(
                              child: SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(color: AppColor.secondary,),
                              ),
                            ),
                          ) : 
                          IconButton(
                            onPressed: (){
                              vm.toggleFavorite(prod);
                            },
                            icon: Icon(icon, semanticLabel: "Add to favorites", color: AppColor.secondary, size: 24,)
                          ),
                        ],
                      ),
                      const SizedBox(height: 23,),
                      Row(
                        children: [
                          Text(prod.description, style: const TextStyle(color: AppColor.secondary, fontSize: 14),),
                        ],
                      )
                    ],
                  ),
                )
              ),
              Container(
                color: AppColor.lightGrey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("\$${prod.price.round()}", style: const TextStyle(decoration: TextDecoration.lineThrough),),
                      Text("\$${prod.discountPrice.round()}", style: const TextStyle(fontWeight: FontWeight.bold),),
                      Text("Expiration date: ${prod.expirationDate}")
                    ]
                  ),
                ),
              )
            ],
          ),
        );
    }

    return Scaffold(
      appBar: FlAppBar(navState: Navigator.of(context)).appBar(),
      body: body,
    );
  }
}