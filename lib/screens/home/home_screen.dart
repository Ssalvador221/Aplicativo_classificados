import 'package:flutter/material.dart';
import 'package:flutter_bloc_application/screens/post/create_post_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> cards = [1, 2, 3];

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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CreatePostScreen(),
              ),
            );
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
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
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 50),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: CarouselView(
                          itemExtent: 100,
                          children: CardInfo.values.map((CardInfo info) {
                            return ColoredBox(
                              color: info.backgroundColor,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(info.label,
                                            style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                            overflow: TextOverflow.clip,
                                            softWrap: false),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }).toList()),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 500,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    itemCount: cards.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Center(
                            child: Card(
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const ListTile(
                                    leading: CircleAvatar(
                                      maxRadius: 15,
                                      backgroundImage: NetworkImage(
                                          "https://img.freepik.com/free-photo/color-year-illustrated_23-2151106277.jpg?t=st=1733622754~exp=1733626354~hmac=02b882c3517e781783f8dcee935390f270cd3d47a4b5e0be32a9c5c8b5d08bd4&w=740"),
                                    ),
                                    title: Text("João Salvador"),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12),
                                    child: SizedBox(
                                      height: 300,
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      child: Image.asset(
                                        'images/cellphone.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Título do Produto',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          'Uma breve descrição do produto que está sendo vendido.',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        const Text(
                                          'R\$ 199,99',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            )
          ],
        ));
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
