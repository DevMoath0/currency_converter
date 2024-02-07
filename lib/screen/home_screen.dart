import 'package:currency_converter/widgets/card_text_field.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../model/currency_api.dart';
import '../widgets/button.dart';
import '../widgets/top_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final sarController = TextEditingController();
  final usdController = TextEditingController();

  @override
  void dispose() {
    sarController.dispose();
    usdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double appBarHeight = MediaQuery.of(context).size.height / 15;
    CurrencyApi currencyApi = CurrencyApi(sarController, usdController);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(appBarHeight),
        child: const TopAppBar(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 80, right: 15, left: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CardTextField(
                inputController: sarController,
                country: 'SA',
                placeHolder: 'SAR',
              ),
              const SizedBox(height: 20),
              CardTextField(
                inputController: usdController,
                country: 'US',
                placeHolder: 'USD',
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Button(
                    onPress: () {
                      sarController.clear();
                      usdController.clear();
                    },
                    text: 'Clear',
                    color: Colors.redAccent,
                  ),
                  Button(
                    onPress: () {
                      //Determine direction of conversion based on which field is not empty
                      if (sarController.text.isNotEmpty) {
                        currencyApi.convertCurrency(fromSAR: true);
                      } else if (usdController.text.isNotEmpty) {
                        currencyApi.convertCurrency(fromSAR: false);
                      }
                    },
                    text: 'Convert',
                    color: kBabyBlue,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
