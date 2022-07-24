import 'package:flutter/material.dart';

class PersonCard extends StatelessWidget {
  final String name;
  final double popularity;

  PersonCard(this.name, this.popularity);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: 200,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Colors.amber),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              name,
              style: const TextStyle(
                  color: Colors.purple,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              popularity.toString(),
              style: const TextStyle(fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}
