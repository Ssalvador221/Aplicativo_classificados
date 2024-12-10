import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_application/blocs/create_post_bloc/create_post_bloc.dart';
import 'package:flutter_bloc_application/blocs/get_post_bloc/get_post_bloc.dart';
import 'package:flutter_bloc_application/blocs/my_user_bloc/my_user_bloc.dart';
import 'package:flutter_bloc_application/screens/post/create_post_screen.dart';
import 'package:intl/intl.dart';
import 'package:post_repository/post_repository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Text(
            "Fyndsy",
            style: TextStyle(
              fontSize: 25,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        actions: [
          BlocBuilder<MyUserBloc, MyUserState>(
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: ClipOval(
                      child: Image.network(
                        'https://images.pexels.com/photos/14653174/pexels-photo-14653174.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
      floatingActionButton: BlocBuilder<MyUserBloc, MyUserState>(
        builder: (context, state) {
          if (state.status == MyUserStatus.success) {
            return FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            BlocProvider<CreatePostBloc>(
                              create: (context) => CreatePostBloc(
                                  postRepository: FirebasePostRepository()),
                              child: CreatePostScreen(state.user!),
                            )));
              },
              child: const Icon(Icons.add, color: Colors.white),
            );
          } else {
            return const FloatingActionButton(
              onPressed: null,
              child: Icon(Icons.clear),
            );
          }
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Seção de boas-vindas
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: BlocBuilder<MyUserBloc, MyUserState>(
                builder: (context, state) {
                  if (state.status == MyUserStatus.loading) {
                    return const Text(
                      "Carregando...",
                      style: TextStyle(fontSize: 18),
                    );
                  } else if (state.status == MyUserStatus.success) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Olá, ${state.user!.name}",
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          "Seja bem-vindo novamente!",
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).colorScheme.outline,
                          ),
                        ),
                      ],
                    );
                  } else {
                    return const Text(
                      "Nome não encontrado!",
                      style: TextStyle(fontSize: 18),
                    );
                  }
                },
              ),
            ),
            // Barra de pesquisa
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: SearchAnchor(
                  builder: (context, controller) {
                    return SearchBar(
                      hintText: "Digite o que deseja procurar",
                      hintStyle: WidgetStatePropertyAll<TextStyle>(
                        TextStyle(
                          color: Theme.of(context).colorScheme.outline,
                        ),
                      ),
                      controller: controller,
                      leading: const Icon(Icons.search),
                      padding: const WidgetStatePropertyAll<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: 12.0),
                      ),
                    );
                  },
                  suggestionsBuilder: (context, controller) => [],
                ),
              ),
            ),
            const SizedBox(height: 20),

            SizedBox(
              height: 30,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: CardInfo.values.length,
                itemBuilder: (context, index) {
                  final info = CardInfo.values[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: info.backgroundColor,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      width: 100,
                      child: Center(
                        child: Text(
                          info.label,
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: BlocBuilder<GetPostBloc, GetPostState>(
                builder: (context, state) {
                  if (state is GetPostSuccess) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.posts.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.only(bottom: 16),
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                leading: const CircleAvatar(
                                  maxRadius: 15,
                                  backgroundImage: NetworkImage(
                                    "data:image/jpeg;base64,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",
                                  ),
                                ),
                                title: Text(state.posts[index].myUser.name),
                              ),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 8),
                                      child: Container(
                                        width: double.infinity,
                                        height: 450,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(8),
                                              topRight: Radius.circular(8),
                                              bottomLeft: Radius.circular(8),
                                              bottomRight: Radius.circular(8)),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              "${state.posts[index].post}",
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    )
                                  ]),
                              Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.posts[index].title,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      state.posts[index].description,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          NumberFormat.simpleCurrency(
                                                  locale: 'pt_BR')
                                              .format(state.posts[index].price),
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green,
                                          ),
                                        ),
                                        const Row(
                                          children: [
                                            Icon(
                                              Icons.pin_drop,
                                              size: 18,
                                              color: Color.fromARGB(
                                                  255, 117, 117, 117),
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Text(
                                              'Jurerê, Florianópolis',
                                              style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    255, 117, 117, 117),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  } else if (state is GetPostLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return Text("N tem nada");
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

enum CardInfo {
  todos('Todos', Color(0xff2354C7), Color(0xffECEFFD)),
  lighting('Eletrônicos', Color(0xff806C2A), Color(0xffFAEEDF)),
  climate('Veículos', Color(0xffA44D2A), Color(0xffFAEDE7)),
  wifi('Casa', Color(0xff417345), Color(0xffE5F4E0)),
  media('Media', Color(0xff2556C8), Color(0xffECEFFD)),
  security('Segurança', Color(0xff794C01), Color(0xffFAEEDF)),
  safety('Lazer', Color(0xff2251C5), Color(0xffECEFFD));

  const CardInfo(this.label, this.color, this.backgroundColor);
  final String label;
  final Color color;
  final Color backgroundColor;
}
