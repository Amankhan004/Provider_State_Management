import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/provider/favouriteitem_provider.dart';

class MyFavouriteScreen extends StatelessWidget {
  const MyFavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("MyFavourite Screen")),
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<FavouriteItemProvider>(
              builder: (context, value, child) {
                return ListView.builder(
                    itemCount: value.selectedItem.length,
                    itemBuilder: ((context, index) {
                      return Consumer<FavouriteItemProvider>(
                          builder: (context, value, child) {
                        return ListTile(
                          onTap: () {
                            value.removeValue(value.selectedItem[index]);
                          },
                          title: Text("Item${value.selectedItem[index]}"),
                          trailing: const Icon(Icons.favorite),
                        );
                      });
                    }));
              },
            ),
          )
        ],
      ),
    );
  }
}
