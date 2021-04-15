// Flutter imports:
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key key,
    @required this.searchController,
  }) : super(key: key);

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: TextField(
        decoration: const InputDecoration(
          hintText: "Search something",
          icon: Icon(Icons.search),
        ),
        controller: searchController,
      ),
    );
  }
}
