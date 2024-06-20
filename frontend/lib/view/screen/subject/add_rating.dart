import 'package:flutter/material.dart';

class RatingType extends StatelessWidget {
  const RatingType({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Rating'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  ///
                },
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  color: Colors.blue,
                  child: const Center(
                    child: Text(
                      'تقييم درس',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  ///
                },
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  color: Colors.green,
                  child: const Center(
                    child: Text(
                      'إضافة تقييم الطالب للمادة',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
