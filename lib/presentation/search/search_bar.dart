import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'search_provider.dart';

class SearchBar extends ConsumerWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.8,
        margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.03,
            vertical: MediaQuery.of(context).size.height * 0.01),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          border: Border.all(
            color: Colors.white,
          ),
          color: Colors.white,
        ),
        height: (40.00),
        child: TextField(
          onChanged: (textEntered) => {
            ref.read(searchProvider.notifier).state = textEntered,
          },
          maxLines: 1,
          decoration: const InputDecoration(
              hintText: "Search",
              contentPadding: EdgeInsets.symmetric(horizontal: 3, vertical: 5),
              prefixIcon: Icon(Icons.search),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.zero, borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide: BorderSide.none,
              )),
        ));
  }
}
