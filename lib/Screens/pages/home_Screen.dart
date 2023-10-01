// ignore: file_names
import 'package:e_commerce_app/Screens/details.dart';
import 'package:e_commerce_app/Widgets/product_card.dart';
import 'package:e_commerce_app/model/myproduct.dart';
import 'package:e_commerce_app/provider/randomprovider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // use to inisilize data
    final provider = ScreenChangeProvider.of(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Text(
            "Our Product",
            style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // screen shiftting
              _buildproductcategery(index: 0, name: "All Products"),
              _buildproductcategery(index: 1, name: "Jackets"),
              _buildproductcategery(index: 2, name: "Sneakers"),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
              // logic for screen shifting
              child: provider.Pagevalue == 0
                  ? _buildAllProducts()
                  : provider.Pagevalue == 1
                      ? _buildJacket()
                      : _buildSneakers())
        ],
      ),
    );
  }

  // this is for custom tab bars
  _buildproductcategery({required int index, required String name}) {
    final provider = ScreenChangeProvider.of(context);
    return GestureDetector(
      onTap: () {
        // this is to shift the screens maunualy
        provider.Changepages(index);
      },
      child: Container(
        width: 80,
        height: 40,
        margin: const EdgeInsets.only(top: 10, right: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color:
                provider.Pagevalue == index ? Colors.red : Colors.red.shade300,
            borderRadius: BorderRadius.circular(8)),
        child: Text(
          name,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  // THIS IS FOR ALL PRODUCTS
  _buildAllProducts() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (100 / 140),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12),
      scrollDirection: Axis.vertical,
      itemCount: myproduct.allProducts.length,
      itemBuilder: (context, index) {
        final allproducts = myproduct.allProducts[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailsScreen(product: allproducts)));
          },
          child: ProductCard(
            product: allproducts,
          ),
        );
      },
    );
  }

  // THIS IS FOR JACKETS

  _buildJacket() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (100 / 140),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12),
      scrollDirection: Axis.vertical,
      itemCount: myproduct.JacketList.length,
      itemBuilder: (context, index) {
        final jacketlist = myproduct.JacketList[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailsScreen(product: jacketlist)));
          },
          child: ProductCard(
            product: jacketlist,
          ),
        );
      },
    );
  }
  // THIS IS FOR sneckers

  _buildSneakers() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (100 / 140),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12),
      scrollDirection: Axis.vertical,
      itemCount: myproduct.sneckerList.length,
      itemBuilder: (context, index) {
        final sneckerlist = myproduct.sneckerList[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailsScreen(product: sneckerlist)));
          },
          child: ProductCard(
            product: sneckerlist,
          ),
        );
      },
    );
  }
}
