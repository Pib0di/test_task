import 'package:flutter/material.dart';
import 'package:test_task/share/image_picker.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_back_ios_sharp),
              ),
              title: const Center(child: Text('Мой аккаунт')),
              backgroundColor: Colors.white,
              floating: true,
              pinned: true,
            ),
          ];
        },
        body: Material(
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0, right: 16, left: 16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  IntrinsicWidth(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        const CircleAvatar(
                          minRadius: 60,
                          backgroundImage: NetworkImage(
                            'https://rem-parts.ru/templates/yootheme/cache/lizing-8ec42366.png',
                          ),
                        ),
                        Positioned(
                          right: -5,
                          bottom: 0,
                          child: IconButton(
                            onPressed: () {
                              showImageSourceDialog(context);
                            },
                            iconSize: 28,
                            style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll<Color>(Colors.white),
                            ),
                            icon: const Icon(
                              Icons.more_horiz,
                              color: Colors.blue,
                              size: 35,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      hintText: 'Имя',
                      labelText: 'Ваше имя',
                    ),
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      hintText: 'Профессия',
                      labelText: 'Ваша профессия',
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    ;
  }
}
