import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_tutorial/lib/Application/bloc/homebloc_bloc.dart';
import 'package:weather_app_tutorial/lib/core/const.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width - 30,
              child: TextField(
                controller: Search_text_controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Search for a location!',
                ),
              ),
            ),
            Align(
              alignment: const Alignment(0.9, 1.1),
              child: ElevatedButton.icon(
                  onPressed: () {
                    if (Search_text_controller.text.isNotEmpty) {
                      final text = Search_text_controller.text;

                      BlocProvider.of<HomeblocBloc>(context)
                          .add(SearchWether(data: text));
                      Navigator.of(context).pop();
                    }
                  },
                  icon: const Icon(Icons.search_outlined),
                  label: RichText(
                    text: const TextSpan(
                        style: TextStyle(color: Colors.blue), text: "Search"),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
