import 'package:flutter/material.dart';
import 'package:note_app/helper/enums.dart';

import '../helper/const.dart';

class SingleChoiceShipButtons extends StatefulWidget {
  final Function(SearchType searchtype) onSelected;
  const SingleChoiceShipButtons({
    super.key,
    required this.onSelected,
  });

  @override
  State<SingleChoiceShipButtons> createState() =>
      _SingleChoiceShipButtonsState();
}

class _SingleChoiceShipButtonsState extends State<SingleChoiceShipButtons> {
  SearchType searchType = SearchType.notes;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: SearchType.values.map((choice) {
          return Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: ChoiceChip(
              label: Text(choice.name),
              selected: searchType == choice,
              onSelected: (bool selected) {
                setState(() {
                  if (selected) {
                    searchType = choice;
                    // Perform action based on the selected choice
                    //_performSearchBasedOnChoice(selectedChoice);
                  }
                  widget.onSelected(searchType);
                });
              },
              selectedShadowColor: kPrimaryColor.withOpacity(0.5),
              elevation: 5,
              selectedColor: kPrimaryColor,
              backgroundColor: Colors.grey[200],
              labelStyle: TextStyle(
                color: searchType == choice ? Colors.white : Colors.black,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
