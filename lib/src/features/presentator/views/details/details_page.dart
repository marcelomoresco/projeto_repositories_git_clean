// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/search_bloc/search_bloc.dart';
import '../../widgets/profile_details_page.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          if (state is SearchLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SearchLoadedState) {
            return ProfileDetailsPage(
              user: state.user!,
            );
          } else if (state is SearchErrorState) {
            return Center(
              child: Text(state.errorMessage),
            );
          }
          return const Center(
            child: Text("Algo de errado deu muito errado!"),
          );
        },
      ),
    );
  }
}
