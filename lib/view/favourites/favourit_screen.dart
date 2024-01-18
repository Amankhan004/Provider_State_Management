import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/provider/favouriteitem_provider.dart';
import 'package:provider_state_management/view/dark_theme.dart';
import 'package:provider_state_management/view/favourites/myfavourite_screen.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("built");
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Favourite Screen")),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MyFavouriteScreen()),
                );
              },
              child: const Icon(Icons.favorite),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<FavouriteItemProvider>(
              builder: (context, value, child) {
                return ListView.builder(
                  itemCount: 100,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        if (value.selectedItem.contains(index)) {
                          value.removeValue(index);
                        } else {
                          value.addValue(index);
                        }
                      },
                      title: Text("Item${index.toString()}"),
                      trailing: Icon(
                        value.selectedItem.contains(index)
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                      ),
                    );
                  },
                );
              },
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DarkThemeScreen()));
              },
              child: const Text("nav to DarkScreen"))
        ],
      ),
    );
  }
}
