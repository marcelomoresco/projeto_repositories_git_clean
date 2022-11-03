import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/user_entity.dart';
import '../blocs/user_repositories_bloc/repositories_bloc.dart';

class ProfileDetailsPage extends StatelessWidget {
  final UserEntity user;
  const ProfileDetailsPage({super.key, required this.user});
  final imageRadius = 60.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      //backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 350,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(color: Colors.black),
            ),
          ),
          Positioned(
            top: 60,
            left: 25,
            child: Container(
              width: MediaQuery.of(context).size.width - 40,
              height: 500,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.white, width: 1.5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.68),
                    spreadRadius: 5,
                    blurRadius: 15,
                  )
                ],
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(19),
                      child: CachedNetworkImage(
                        imageUrl: user.avatar_url,
                        height: 2 * imageRadius,
                        width: 2 * imageRadius,
                        placeholder: (_, __) =>
                            const Center(child: CircularProgressIndicator()),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 20,
                      width: MediaQuery.of(context).size.width / 2,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          user.name!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.computer),
                        Text(user.bio == null ? "Sem Bio" : user.bio!),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.location_on_rounded,
                          color: Colors.black,
                        ),
                        Text(
                            user.location == null ? "Sem Bio" : user.location!),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Divider(
                      thickness: 2,
                      height: 2,
                      color: Colors.black,
                    ),
                    BlocBuilder<RepositoriesBloc, RepositoriesState>(
                      builder: (context, state) {
                        if (state is RepositoriesLoadedState) {
                          return ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: state.userGitRepositoriesEntity.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(
                                    state.userGitRepositoriesEntity[index].name,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                                subtitle: state.userGitRepositoriesEntity[index]
                                            .description ==
                                        null
                                    ? const Text("Sem Descrição")
                                    : Text(state
                                        .userGitRepositoriesEntity[index]
                                        .description),
                              );
                            },
                          );
                        } else if (state is RepositoriesLoadingState) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is RepositoriesErrorState) {
                          return Scaffold(
                            appBar: AppBar(title: Text("Erro na Consulta")),
                            body: Center(
                              child: Text(state.errorMessage),
                            ),
                          );
                        } else {
                          return const Center(
                            child: Text("Algo deu muito errado.....!"),
                          );
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
