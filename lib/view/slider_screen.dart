import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/provider/slider_provider.dart';
import 'package:provider_state_management/view/favourites/favourit_screen.dart';

// ignore: must_be_immutable
class SliderScreen extends StatelessWidget {
  SliderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<SliderProvider>(context, listen: false);
    // print("built");
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Slider_Example")),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Consumer<SliderProvider>(builder: (context, value, child) {
          return Slider(
              min: 0,
              max: 1,
              value: value.value,
              onChanged: (val) {
                value.setValue(val);
              });
        }),
        Consumer<SliderProvider>(builder: (context, value, child) {
          return Row(
            children: [
              Expanded(
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.green.withOpacity(value.value)),
                  child: const Center(child: Text("Container 1")),
                ),
              ),
              Expanded(
                child: Container(
                  height: 100,
                  decoration:
                      BoxDecoration(color: Colors.red.withOpacity(value.value)),
                  child: const Center(child: Text("Container 2")),
                ),
              )
            ],
          );
        }),
       const SizedBox(
          height: 25,
        ),
        MaterialButton(
          color: Colors.blue,
          child:const Text("navigate to favourite screen"),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) =>const FavouriteScreen()));
          },
        )
      ]),
    );
  }
}
