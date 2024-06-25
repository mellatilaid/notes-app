import 'package:flutter/material.dart';
import 'package:note_app/helper/enums.dart';
import 'package:note_app/widgets/search_resault_item.dart';

class SearchResaultsListview extends StatefulWidget {
  final SearchType searchType;
  final List<dynamic> searchResault;

  const SearchResaultsListview({
    super.key,
    required this.searchResault,
    required this.searchType,
  });

  @override
  State<SearchResaultsListview> createState() => _SearchResaultsListviewState();
}

class _SearchResaultsListviewState extends State<SearchResaultsListview> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      key: UniqueKey(),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      itemCount: widget.searchResault.length,
      itemBuilder: (context, index) {
        return SearchResaultItem(
          resault: widget.searchResault[index],
          searchType: widget.searchType,
        );
      },
    );
  }
}
