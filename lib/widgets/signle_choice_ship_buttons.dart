import 'package:flutter/material.dart';
import 'package:note_app/helper/enums.dart';

class SingleChoice extends StatefulWidget {
  final Function(SearchType searchtype) onSelected;
  const SingleChoice({super.key, required this.onSelected});

  @override
  State<SingleChoice> createState() => _SingleChoiceState();
}

class _SingleChoiceState extends State<SingleChoice> {
  SearchType searchType = SearchType.notes;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<SearchType>(
      segments: const <ButtonSegment<SearchType>>[
        ButtonSegment<SearchType>(
            value: SearchType.notes,
            label: Text('Notes'),
            icon: Icon(Icons.note)),
        ButtonSegment<SearchType>(
            value: SearchType.voices,
            label: Text('Voices'),
            icon: Icon(Icons.image)),
        ButtonSegment<SearchType>(
            value: SearchType.images,
            label: Text('Images'),
            icon: Icon(Icons.mic)),
      ],
      selected: <SearchType>{searchType},
      onSelectionChanged: (Set<SearchType> newSelection) {
        setState(() {
          searchType = newSelection.first;
          widget.onSelected(searchType);
        });
      },
    );
  }
}
