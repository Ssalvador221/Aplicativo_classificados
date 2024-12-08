import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Text(
              "Fyndsy",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary, fontSize: 25),
            ),
          ),
          actions: const [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://img.freepik.com/free-photo/color-year-illustrated_23-2151106277.jpg?t=st=1733622754~exp=1733626354~hmac=02b882c3517e781783f8dcee935390f270cd3d47a4b5e0be32a9c5c8b5d08bd4&w=740"),
                    )),
              ],
            )
          ],
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              textDirection: TextDirection.rtl,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  child: SizedBox(
                    height: 60,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Olá, João Salvador",
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          "Seja bem vindo novamente!",
                          style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).colorScheme.outline),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Wrap(
                  direction: Axis.horizontal,
                  children: [
                    SearchAnchor(
                      builder: (context, controller) {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: SearchBar(
                            hintText: "Digite o que deseja procurar",
                            hintStyle: WidgetStatePropertyAll<TextStyle>(
                                TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.outline)),
                            controller: controller,
                            leading: const Icon(Icons.search),
                            padding: const WidgetStatePropertyAll<EdgeInsets>(
                              EdgeInsets.symmetric(horizontal: 12.0),
                            ),
                          ),
                        );
                      },
                      suggestionsBuilder: (context, controller) => [],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 300,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    height: 30,
                    color: Colors.blue,
                  ),
                  Container(
                    height: 30,
                    color: Colors.blue,
                  ),
                  Container(
                    height: 30,
                    color: Colors.blue,
                  )
                ],
              ),
            )
          ],
        ));
  }
}
