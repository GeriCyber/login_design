import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:catalog_design/screens/screens.dart';
import 'package:catalog_design/services/services.dart';
import 'package:provider/provider.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final itemsService = Provider.of<ItemsService>(context);
    if(itemsService.isLoading) {
      return const LoadingScreen();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Catalog'),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) => GestureDetector(
          child: ItemCard(item: itemsService.items[index]),
          onTap: () {
            itemsService.selectedItem = itemsService.items[index].copy();
            Navigator.pushNamed(context, 'item');
          },
        ), 
        itemCount: itemsService.items.length,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          
        },
      ),
    );
  }
}