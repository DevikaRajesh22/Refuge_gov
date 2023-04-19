import 'package:flutter/material.dart';

import 'custom_card.dart';

class CustomSearch extends StatefulWidget {
  final Function(String?) onSearch;
  const CustomSearch({
    super.key,
    required this.onSearch,
  });

  @override
  State<CustomSearch> createState() => _CustomSearchState();
}

class _CustomSearchState extends State<CustomSearch> {
  final TextEditingController _searchController = TextEditingController();
  String _lastValue = '';

  @override
  void initState() {
    _searchController.addListener(() {
      setState(() {});
      // if (_searchController.text.trim().isEmpty && _lastValue.isNotEmpty) {
      //   widget.onSearch(null);
      //   _lastValue = '';
      // }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: _searchController,
              obscureText: false,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                border: InputBorder.none,
                hintText: 'Search',
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          _searchController.text.trim().isNotEmpty
              ? IconButton(
                  hoverColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    _lastValue = _searchController.text.trim();
                    widget.onSearch(_lastValue);
                    setState(() {});
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Colors.blue,
                  ),
                )
              : const SizedBox(),
          const SizedBox(
            width: 15,
          ),
          _lastValue.isNotEmpty
              ? IconButton(
                  hoverColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    _lastValue = '';
                    _searchController.clear();
                    widget.onSearch(null);
                    setState(() {});
                  },
                  icon: const Icon(
                    Icons.clear,
                    color: Colors.grey,
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
