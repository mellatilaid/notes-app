import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/search_cubit/search_cubit.dart';
import 'package:note_app/cubits/search_cubit/search_state.dart';
import 'package:note_app/helper/enums.dart';
import 'package:note_app/widgets/empty_widget.dart';
import 'package:note_app/widgets/rounded_text_field.dart';
import 'package:note_app/widgets/search_resaults_list_view.dart';

import 'signle_choice_ship_buttons.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  SearchType searchType = SearchType.notes;
  String query = '';

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
                query = data;
                _search(searchType);
              },
            ),
            SingleChoiceShipButtons(onSelected: _search),
            const SizedBox(
              height: 32,
            ),
            Expanded(
              child: BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  if (state is SearchInitialState) {
                    return const EmptyWidget(
                      title: 'Search Your Notes',
                      message: '',
                      imagePath: 'assets/search.png',
                    );
                  } else if (state is SearchSecussState) {
                    return SearchResaultsListview(
                      searchType: searchType,
                      searchResault: state.resualt,
                    );
                  } else if (state is SearchEmptyState) {
                    return const EmptyWidget(
                      title: 'Search Your Notes',
                      message: '',
                      imagePath: 'assets/search.png',
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

  _search(SearchType searchType) {
    this.searchType = searchType;
    if (query.isEmpty) {
      BlocProvider.of<SearchCubit>(context).emitEmptyState();
    } else {
      BlocProvider.of<SearchCubit>(context).search(query, searchType);
    }
  }
}
