import 'package:chat_application/presentation/widgets/user_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchController = TextEditingController();
  List searchResult = [];
  List foundUsers = [];

  @override
  Widget build(BuildContext context) {
    final CollectionReference usersCollection =
        FirebaseFirestore.instance.collection('users');

    Future<void> searchUser(String searchTerm) async {
      searchResult = [];
      QuerySnapshot querySnapshot =
          await usersCollection.where('name', isEqualTo: searchTerm).get();

      for (var document in querySnapshot.docs) {
        searchResult.add(document.data());
      }

      setState(() {
        foundUsers = searchResult;
      });
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Search')),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              TextFormField(
                controller: searchController,
                onEditingComplete: () async =>
                    await searchUser(searchController.text),
                autofocus: false,
                decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 202, 201, 216),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Color.fromARGB(255, 127, 124, 124),
                    ),
                    hintText: 'Search',
                    border: OutlineInputBorder()),
                onSaved: (String? value) {},
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter password';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: foundUsers.length,
                itemBuilder: (context, index) {
                  return UserTile(
                    userImageUrl: foundUsers[index]['avatarUrl'],
                    userName: foundUsers[index]['name'],
                    userEmail: foundUsers[index]['email'],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
