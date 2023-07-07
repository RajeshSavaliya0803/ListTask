import 'package:flutter/material.dart';

class ListWidget extends StatelessWidget {
  const ListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var list = <Widget>[];
    for (var i = 0; i < 100; i++) {
      list.add(const ListItemWidget());
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Counter Scroll"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 2),
        child: SingleChildScrollView(
          child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: list.length,
              itemBuilder: (context, index) {
                return list[index];
              }),
        ),
      ),
    );
  }
}

class ListItemWidget extends StatefulWidget {
  const ListItemWidget({super.key});
  @override
  State<ListItemWidget> createState() => _ListItemWidgetState();
}

class _ListItemWidgetState extends State<ListItemWidget> {
  var count = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(4),
        child: Row(
          children: [
            Text(count.toString()),
            MaterialButton(
              onPressed: () {
                setState(() {
                  count++;
                });
              },
              child: const Text(
                "+",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )
          ],
        ));
  }
}
