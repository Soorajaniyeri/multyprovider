import 'package:flutter/material.dart';
import 'package:multiprovider/controllers/countercontroller.dart';
import 'package:multiprovider/controllers/imageupload.dart';
import 'package:multiprovider/views/decrementscreen.dart';
import 'package:provider/provider.dart';

class Increment extends StatelessWidget {
  const Increment({super.key});

  @override
  Widget build(BuildContext context) {

    final cObj = Provider.of<CounterController>(context, listen: false);
    final iObj = Provider.of<UploadImages>(context, listen: false);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () => cObj.increment()),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Increment"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<CounterController>(
              builder: (context, value, child) {
                return Text(
                  value.counter.toString(),
                  style: const TextStyle(fontSize: 40),
                );
              },
            ),
            OutlinedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Decrement()));
                },
                child: const Text("Next page")),
            IconButton(
                onPressed: () => iObj.upload(), icon: const Icon(Icons.cloud_upload)),
            Consumer<UploadImages>(
                builder: (context, value, child) => value.selectedImage == null
                    ? const Text("Please upload image")
                    : Image(
                        height: 350, image: FileImage(value.selectedImage!))),
          ],
        ),
      ),
    );
  }
}
