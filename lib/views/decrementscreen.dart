import 'package:flutter/material.dart';
import 'package:multiprovider/controllers/countercontroller.dart';
import 'package:multiprovider/controllers/imageupload.dart';
import 'package:provider/provider.dart';

class Decrement extends StatelessWidget {
  const Decrement({super.key});

  @override
  Widget build(BuildContext context) {

    final cObj = Provider.of<CounterController>(context, listen: false);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: () => cObj.decrement(),
          child: const Icon(
            Icons.minimize,
            color: Colors.white,
          )),
      appBar: AppBar(
        title: const Text("Decrement"),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<CounterController>(
                builder: (context, value, child) => Text(
                      value.counter.toString(),
                      style: const TextStyle(fontSize: 40),
                    )),
            Consumer<UploadImages>(
                builder: (context, value, child) => value.selectedImage == null
                    ? const Text("no image found")
                    : Image(
                  height: 400,
                    image: FileImage(value.selectedImage!)))
          ],
        ),
      ),
    );
  }
}
