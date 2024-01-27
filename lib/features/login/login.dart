import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_task/features/login/bloc/login_bloc.dart';
import 'package:test_task/features/login/widgets/phone_field.dart';
import 'package:test_task/features/login/widgets/progress.dart';
import 'package:test_task/features/login/widgets/text_pin.dart';
import 'package:test_task/features/profile/profile.dart';
import 'package:test_task/theme.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: MaterialApp(
        theme: lightTheme,
        home: const LoginScreen(),
      ),
    );
  }
}

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  late final phoneController = TextEditingController();
  bool isTextPin = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Profile(),
                  ),
                );
              },
              icon: const Icon(Icons.manage_accounts)),
        ],
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          const Row(),
          SizedBox(
            width: 220,
            child: BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                return Progress(
                  currentNum: state.progress,
                );
              },
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Text('Регистрация', style: Theme.of(context).textTheme.displayLarge),
          const SizedBox(height: 24),
          isTextPin
              ? Text(
                  'Введите код, который мы отправили\n в SMS на ${phoneController.text}',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayMedium!.copyWith())
              : Text('Введите номер телефона\nдля регистрации',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayMedium!.copyWith()),
          const SizedBox(height: 32),
          if (!isTextPin)
            PhoneField(
              enabled: true,
              controller: phoneController,
            ),
          if (isTextPin) const TextPin(),
          const Spacer(),
          if (!isTextPin)
            Column(
              children: [
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: state.isFill
                          ? () {
                              BlocProvider.of<LoginBloc>(context)
                                  .add(Update(false, 1));
                              setState(() {
                                isTextPin = true;
                              });
                            }
                          : null,
                      style: lightTheme.elevatedButtonTheme.style!.copyWith(
                          backgroundColor: MaterialStatePropertyAll<Color>(
                        state.isFill ? LightColors.yellow : LightColors.grey,
                      )),
                      child: Text(
                        'Оправить смс-код',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(),
                      ),
                    );
                  },
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: lightTheme.textTheme.labelMedium,
                    children: const <TextSpan>[
                      TextSpan(
                          text:
                              'Нажимая на данную кнопку, вы даете\n согласие на обработку '),
                      TextSpan(
                          text: 'персональных данных',
                          style: TextStyle(color: LightColors.yellow)),
                    ],
                  ),
                ),
              ],
            ),
          const Spacer(),
        ],
      ),
    );
  }
}
