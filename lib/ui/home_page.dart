import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_anna/bloc/home_bloc.dart';
import 'package:test_anna/bloc/home_event.dart';
import 'package:test_anna/bloc/home_state.dart';
import 'package:test_anna/widgets/list_item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _item = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: _bodyWidget(),
    );
  }

  Widget _bodyWidget() {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      if (state is AddItemHomeState) {
        _item = state.items;
      }
      return Center(
        child: ListView(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          children: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(20.0),
              child: Image.asset(
                'assets/images/logo.png',
              ),
            ),
            GridView.builder(
              itemBuilder: (BuildContext context, int index) {
                return ListItemWidget(itemName: _item[index]);
              },
              itemCount: _item.length,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 2.0,
                mainAxisSpacing: 2.0,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 4),
              ),
            ),
            Row(
              children: [
                _buttonWidget(
                    () => context.read<HomeBloc>().add(
                          AddItemHomeEvent(),
                        ),
                    "add item",
                    Theme.of(context).colorScheme.secondary),
                _buttonWidget(
                    () => context.read<HomeBloc>().add(
                          RemoveItemHomeEvent(),
                        ),
                    "remove item",
                    Theme.of(context).colorScheme.error),
              ],
            ),
          ],
        ),
      );
    });
  }

  Widget _buttonWidget(Function click, String purpose, Color objective) {
    return InkWell(
      onTap: () {
        click();
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        height: 50,
        width: 230,
        decoration: BoxDecoration(
          color: objective,
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
        ),
        child: Center(
          child: Text(purpose),
        ),
      ),
    );
  }
}
