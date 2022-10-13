import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/search_bloc/search_bloc.dart';
import '../../blocs/user_repositories_bloc/repositories_bloc.dart';
import '../details/details_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final textController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Pesquise um Perfil'),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Form(
                key: formKey,
                child: TextFormField(
                  controller: textController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person_add_alt_1_rounded,
                        color: Colors.black26),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black12),
                        borderRadius: BorderRadius.circular(30.0)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(30.0)),
                    contentPadding:
                        const EdgeInsets.only(left: 10.0, right: 10.0),
                    labelText: "Usuário",
                    hintStyle: const TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500),
                    labelStyle: const TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500),
                  ),
                  validator: (value) {
                    if (value == null) {
                      return "Campo Obrigatório";
                    } else if (value.isEmpty) {
                      return "Campo Obrigatório";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    context.read<SearchBloc>().add(GetUserInfoEvent(
                          username: textController.text.trim(),
                        ));

                    context.read<RepositoriesBloc>().add(
                          GetUserRepositoriesEvent(
                            username: textController.text.trim(),
                          ),
                        );
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => const DetailsPage(),
                    ));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Campo Inválido",
                          style: TextStyle(color: Colors.white)),
                      backgroundColor: Colors.red,
                    ));
                  }
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                child: const Text("Consultar"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
