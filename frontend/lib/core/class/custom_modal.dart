import 'package:flutter/material.dart';

class CustomModal extends StatelessWidget {
  const CustomModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showModal(context);
          },
          child: const Text('Show Modal'),
        ),
      ),
    );
  }

  void showModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: const Text('List Tile 1'),
                onTap: () {
                  // Handle list tile 1 tap
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('List Tile 2'),
                onTap: () {
                  // Handle list tile 2 tap
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
