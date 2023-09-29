// ignore: file_names
import 'package:e_commerce_app/provider/favourite_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class FavouiteScreen extends StatefulWidget {
  const FavouiteScreen({super.key});

  @override
  State<FavouiteScreen> createState() => _FavouiteScreenState();
}

class _FavouiteScreenState extends State<FavouiteScreen> {
  @override
  Widget build(BuildContext context) {
    // this is use to initilize provider
    final provider = FavouriteProvider.of(context);
    // this is use store favourite data
    final finalist = provider.favourite;
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 20.0, left: 20),
            child: Row(
              children: [
                Text(
                  "Favourite",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Expanded(
              // lsitbuilder is user
              child: ListView.builder(
            itemCount: finalist.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Slidable(
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) {
                          finalist.removeAt(index);
                          setState(() {});
                        },
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: "Delete",
                      )
                    ],
                  ),
                  child: ListTile(
                    // use to fetch data from model
                    title: Text(
                      finalist[index].name,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      finalist[index].describtion,
                      overflow: TextOverflow.ellipsis,
                    ),
                    leading: CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(finalist[index].image),
                    ),
                    trailing: Text(
                      '\$ ${finalist[index].price}',
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    tileColor: Colors.white,
                  ),
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}
