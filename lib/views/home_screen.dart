import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_mvvm_example/view_models/product_list_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    final productListViewModel =
        Provider.of<ProductListViewModel>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      productListViewModel.fetchProducts();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to Example shop'),
      ),
      body: FutureBuilder(
        future: context.watch<ProductListViewModel>().futureProducts,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Oops! some error occurs.');
          } else if (snapshot.hasData) {
            return ListView.builder(itemBuilder: (context, index) {
              final product = snapshot.data![index];
              return ListTile(
                title: Text(product.title ?? 'Untitle'),
                subtitle: Text('price: ${product.price}'),
              );
            });
          } else {
            return const CircularProgressIndicator.adaptive();
          }
        },
      ),
    );
  }
}
