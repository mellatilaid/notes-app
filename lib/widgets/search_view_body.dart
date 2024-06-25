import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/search_cubit/search_cubit.dart';
import 'package:note_app/cubits/search_cubit/search_state.dart';
import 'package:note_app/helper/enums.dart';
import 'package:note_app/widgets/rounded_text_field.dart';
import 'package:note_app/widgets/search_resaults_list_view.dart';

import '../helper/const.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  SearchType searchType = SearchType.notes;
  String selectedChoice = "Notes";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            RoundedTextField(
              hintText: 'Search Notes',
              onChanged: (data) {
                BlocProvider.of<SearchCubit>(context).search(data, searchType);
              },
            ),
            SizedBox(
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
                        });
                      },
                      selectedColor: kPrimaryColor,
                      backgroundColor: Colors.grey[200],
                      labelStyle: TextStyle(
                        color:
                            searchType == choice ? Colors.white : Colors.black,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Expanded(
              child: BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  if (state is SearchInitialState) {
                    return const Center(
                      child: Text('Search Your Notes'),
                    );
                  } else if (state is SearchSecussState) {
                    return SearchResaultsListview(
                      searchType: searchType,
                      searchResault: state.resualt,
                    );
                  } else if (state is SearchFailedState) {
                    return Center(
                      child: Text(state.errMessage),
                    );
                  } else {
                    return const Center(
                      child: Text('oops there was a problem'),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
