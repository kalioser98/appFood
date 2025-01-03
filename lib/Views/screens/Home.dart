import 'package:flutter/material.dart';
import 'package:foodloop/Entities/product_entity.dart';
import 'package:foodloop/Entities/supermarket_entity.dart';
import 'package:foodloop/States/location_state.dart';
import 'package:foodloop/States/product_list_state.dart';
import 'package:foodloop/States/supermarket_list_state.dart';
import 'package:foodloop/ViewModels/home_view_model.dart';
import 'package:foodloop/Views/screens/product_detail.dart';
import 'package:foodloop/Views/widgets/fl_app_bar.dart';
import 'package:foodloop/Views/widgets/supermarker_horizontal_card.dart';
import 'package:provider/provider.dart';
import 'package:foodloop/Views/widgets/fl_sidemenu.dart';
import 'package:foodloop/views/utils/AppColor.dart';


class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffoldKey,
      drawer: FlSideMenu().getDrawer(Navigator.of(context)),
      appBar: FlAppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: AppColor.secondary,
          ),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
      ).appBar(),
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ProductListState()),
          ChangeNotifierProvider(create: (_) => SupermarketListState()),
          ChangeNotifierProvider(create: (_) => LocationState()),
        ],
        child: _HomeStateful(),
      ),
    );
  }
}

class _HomeStateful extends StatelessWidget {

  final HomeViewModel vm = HomeViewModel();

  @override
  Widget build(BuildContext context) {

    var prodsState = context.watch<ProductListState>();
    var supersState = context.watch<SupermarketListState>();
    var locState = context.watch<LocationState>();

    vm.initialize(
      prodsState: prodsState,
      supersState: supersState,
      locState: locState,
    );

    List<Product> products = prodsState.getProducts();
    List<Supermarket> supers = supersState.getSupermarkets();
    bool loading = prodsState.isLoading() || supersState.isLoading();
    bool error = prodsState.errorOcurred() || supersState.errorOcurred();

    Widget body;

    if (error) {
      body = const Text("An error occured when trying to retrive Products or Supermarkts");
    } else if(loading) {
      body = const Center(child: CircularProgressIndicator(color: AppColor.primary,));
    } else {
       body = ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: [
          // Section - Products
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'List of Supermarkets',
                  style: TextStyle(
                    fontFamily: 'inter',
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                ...supers.map<Card>((sup) {
                  return SupermarketHorizontalCard.card(
                    sup,
                    vm.getDistanceFromSuperMarket(sup)
                  );
                }),
                const Text(
                  'List of Products',
                  style: TextStyle(
                    fontFamily: 'inter',
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                // Display the list of products
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    Product product = products[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => ProductDetail(prodId: product.id))
                        );
                      },
                      child: Card(
                        margin: EdgeInsets.symmetric(vertical: 8),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  product.imgUrl,
                                  height: 80,
                                  width: 80,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product.name,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(height: 6),
                                    Row(
                                      children: [
                                        Text(
                                          '\$${product.discountPrice.round()}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: AppColor.primary,
                                          ),
                                        ),
                                        SizedBox(width: 6),
                                        Text(
                                          '\$${product.price.round()}',
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.lineThrough,
                                            color: AppColor.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      );
    }

    return body;
  }
}
