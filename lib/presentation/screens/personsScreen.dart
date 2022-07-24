import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:squadio_PPL/domain/models/person.dart';
import 'package:squadio_PPL/presentation/widgets/personCard.dart';
import '../../domain/repositories/personRemoteDB.dart';

class PersonsScreen extends StatefulWidget {
  
  @override
  _PersonsScreenState createState() => _PersonsScreenState();
}

class _PersonsScreenState extends State<PersonsScreen> {
  late bool _isLastPage;
  late int _pageNumber;
  late bool _error;
  late bool _loading;
  final int _numberOfPostsPerRequest = 10;
  late List<Person> _persons;
  final int _nextPageTrigger = 3;
  @override
  void initState() {
    super.initState();
    _pageNumber = 0;
    _persons = [];
    _isLastPage = false;
    _loading = true;
    _error = false;
  final s = PersonRemoteDataSource();

    // fetchData();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Squadio People"),
        centerTitle: true,
      ),
      body: buildPostsView(),
    );
  }

  Widget buildPostsView() {
    if (_persons.isEmpty) {
      if (_loading) {
        return const Center(
            child: Padding(
          padding: EdgeInsets.all(8),
          child: CircularProgressIndicator(),
        ));
      } else if (_error) {
        return Center(child: errorDialog(size: 20));
      }
    }
    return ListView.builder(
        itemCount: _persons.length + (_isLastPage ? 0 : 1),
        itemBuilder: (context, index) {
          // if (index == _posts.length - _nextPageTrigger) {
          //   // fetchData();
          // }
          if (index == _persons.length) {
            if (_error) {
              return Center(child: errorDialog(size: 15));
            } else {
              return const Center(
                  child: Padding(
                padding: EdgeInsets.all(8),
                child: CircularProgressIndicator(),
              ));
            }
          }
          // final PersonCard card = _persons[index];
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: PersonCard('Mo', 12.4),
          );
        });
  }

  Widget errorDialog({required double size}) {
    return SizedBox(
      height: 180,
      width: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'An error occurred when fetching the posts.',
            style: TextStyle(
                fontSize: size,
                fontWeight: FontWeight.w500,
                color: Colors.black),
          ),
          const SizedBox(
            height: 10,
          ),
          FlatButton(
              onPressed: () {
                setState(() {
                  _loading = true;
                  _error = false;
                  // fetchData();
                });
              },
              child: const Text(
                "Retry",
                style: TextStyle(fontSize: 20, color: Colors.purpleAccent),
              )),
        ],
      ),
    );
  }
}
