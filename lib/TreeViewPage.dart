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
                boundaryMargin: EdgeInsets.all(100),
                minScale: 0.01,
                maxScale: 15.6,
                child: GraphView(
                  graph: graph,
                  algorithm: BuchheimWalkerAlgorithm(
                      builder, TreeEdgeRenderer(builder)),
                  paint: Paint()
                    ..color = Colors.green
                    ..strokeWidth = 2
                    ..style = PaintingStyle.fill,
                )),
          ),
        ],
      ),
    ));
  }

  Widget getNode() {
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
            "Amr Abd-Alkrim",
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
    final Node node1 = Node(getNode());
    final Node node2 = Node(getNode());
    final Node node3 = Node(getNode());
    final Node node4 = Node(getNode());
    final Node node5 = Node(getNode());
    final Node node6 = Node(getNode());
    final Node node8 = Node(getNode());
    final Node node7 = Node(getNode());
    final Node node9 = Node(getNode());
    final Node node10 = Node(getNode());
    final Node node11 = Node(getNode());
    final Node node12 = Node(getNode());

    final Node amr = Node(getNode());

    graph.addEdge(node1, node2);
    graph.addEdge(node1, node3);
    graph.addEdge(node1, node4);
    graph.addEdge(node1, amr);
    graph.addEdge(node2, node5);
    graph.addEdge(node2, node6);
    graph.addEdge(node6, node7);
    graph.addEdge(node6, node8);
    graph.addEdge(node4, node9);
    graph.addEdge(node4, node10);
    graph.addEdge(node4, node11);
    graph.addEdge(node11, node12);

    builder
      ..siblingSeparation = (100)
      ..levelSeparation = (150)
      ..subtreeSeparation = (150)
      ..orientation = (BuchheimWalkerConfiguration.ORIENTATION_TOP_BOTTOM);
  }
}
