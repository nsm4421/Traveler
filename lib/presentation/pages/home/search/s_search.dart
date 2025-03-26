import 'package:flutter/material.dart';
import 'package:module/shared/shared.export.dart';

part 'f_header.dart';

part 'search_option.enum.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const HeaderFragment(),
          12.height,
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 1000,
                itemBuilder: (context, index) {
                  return Text(
                    "$index",
                    style: context.textTheme.displayLarge,
                  );
                }),
          )
        ],
      ),
    );
  }
}
