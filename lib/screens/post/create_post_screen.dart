import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_application/blocs/create_post_bloc/create_post_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:post_repository/post_repository.dart';
import 'package:user_repository/user_repository.dart';

class CreatePostScreen extends StatefulWidget {
  final MyUser myUser;
  const CreatePostScreen(this.myUser, {super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  late Post post;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController title = TextEditingController();
  final TextEditingController postPicture = TextEditingController();
  String categorys = '';
  final TextEditingController description = TextEditingController();
  final TextEditingController price = TextEditingController();
  final TextEditingController cep = TextEditingController();

  @override
  void initState() {
    post = Post.empty;
    post.myUser = widget.myUser;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreatePostBloc, CreatePostState>(
      listener: (context, state) {
        if (state is CreatePostSuccess) {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Novo Anúncio"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: postPicture,
                      maxLines: 10,
                      maxLength: 500,
                      decoration: InputDecoration(
                        hintText: "Insira a url da imagem...",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.primary)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: title,
                    decoration: const InputDecoration(
                      labelText: "Título do anúncio",
                      hintText: "Ex.: iPhone 13",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    value: categorys.isEmpty ? null : categorys,
                    decoration: const InputDecoration(
                      labelText: "Categoria",
                      border: OutlineInputBorder(),
                    ),
                    items: const [
                      DropdownMenuItem(
                          value: "Eletrônicos", child: Text("Eletrônicos")),
                      DropdownMenuItem(value: "Roupas", child: Text("Roupas")),
                      DropdownMenuItem(value: "Móveis", child: Text("Móveis")),
                    ],
                    onChanged: (value) {
                      setState(() {
                        categorys = value ?? '';
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: description,
                    maxLines: 3,
                    decoration: const InputDecoration(
                      labelText: "Descrição",
                      hintText:
                          "Descreva o produto com detalhes (marca, modelo, estado de conservação, etc.)",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: price,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Preço",
                      hintText: "R\$ 0,00",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: cep,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            labelText: "CEP",
                            hintText: "00000-00",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Dicas para um bom anúncio",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "• Adicione fotos reais e de boa qualidade\n"
                    "• Seja detalhista na sua descrição\n"
                    "• Informe o estado de conservação\n"
                    "• Preço justo aumenta as chances de venda",
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                        ),
                        child: const Text("Cancelar",
                            style: TextStyle(color: Colors.white)),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Post postData = Post(
                                postId: '',
                                title: title.text,
                                categorys: categorys,
                                description: description.text,
                                price: double.tryParse(price.text) ?? 0.0,
                                post: postPicture.text,
                                cep: cep.text,
                                myUser: post.myUser,
                                createAt: DateTime.now());

                            context
                                .read<CreatePostBloc>()
                                .add(CreatePost(postData));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                        ),
                        child: const Text(
                          "Criar",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
