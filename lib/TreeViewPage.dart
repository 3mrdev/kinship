import 'package:flutter/material.dart';
import 'package:graphview/GraphView.dart';

class TreeViewPage extends StatefulWidget {
  @override
  _TreeViewPageState createState() => _TreeViewPageState();
}

class _TreeViewPageState extends State<TreeViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.black,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: InteractiveViewer(
                constrained: false,
                boundaryMargin: EdgeInsets.all(150),
                minScale: 0.01,
                maxScale: 15.6,
                child: GraphView(
                  graph: graph,
                  algorithm: BuchheimWalkerAlgorithm(
                      builder, TreeEdgeRenderer(builder)),
                  paint: Paint()
                    ..color = Colors.green
                    ..strokeWidth = 5
                    ..style = PaintingStyle.fill,
                )),
          ),
        ],
      ),
    ));
  }

  Widget getNode(String name) {
    return InkWell(
      onTap: () {
        print('clicked');
      },
      child: Container(
          child: Column(
        children: [
          Image.asset(
            "assets/img/3mrdev.png",
            width: 100,
            height: 100,
          ),
          Text(
            name,
            style: TextStyle(color: Colors.white),
          )
        ],
      )),
    );
  }

  final Graph graph = Graph()..isTree = true;
  BuchheimWalkerConfiguration builder = BuchheimWalkerConfiguration();

  @override
  void initState() {
    final Node hassan = Node(getNode("Hassan Alawad"));
    final Node mrdia = Node(getNode("Mardia Yahia"));
    final Node abdalkrim = Node(getNode("Abd-Alkrim Hassan Alawad"));
    final Node saif = Node(getNode("Saif Aldeen Hassan Alawad"));
    final Node emad = Node(getNode("Emad Aldeen Hassan Alawad"));
    final Node abdalrhman = Node(getNode("Abd-Alrhman Hassan Alawad"));
    final Node abobker = Node(getNode("Abobaker Hassan Alawad"));

    final Node amr = Node(getNode("Amr Abd-Alkrim Hassan"));
    final Node osman = Node(getNode("Osman Abd-Alkrim Hassan"));
    final Node emad2 = Node(getNode("Emad Abd-Alkrim Hassan"));

    graph.addEdge(hassan, abdalkrim);
    graph.addEdge(hassan, saif);
    graph.addEdge(hassan, emad);
    graph.addEdge(hassan, abdalrhman);
    graph.addEdge(hassan, abobker);
    graph.addEdge(mrdia, abdalkrim);
    graph.addEdge(mrdia, saif);
    graph.addEdge(mrdia, emad);
    graph.addEdge(mrdia, abdalrhman);
    graph.addEdge(mrdia, abobker);
    graph.addEdge(abdalkrim, amr);
    graph.addEdge(abdalkrim, osman);
    graph.addEdge(abdalkrim, emad2);

    builder
      ..siblingSeparation = (100)
      ..levelSeparation = (150)
      ..subtreeSeparation = (150)
      ..orientation = (BuchheimWalkerConfiguration.ORIENTATION_TOP_BOTTOM);
  }
}
