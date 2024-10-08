import 'package:flutter/material.dart';
import 'package:locapp/screens/home/components/containers/circular_container.dart';
import 'package:locapp/screens/home/components/curvedEdges/curved_edges_widget.dart';

class PrimaryHeaderContainer extends StatelessWidget {
  const PrimaryHeaderContainer({
    super.key, required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CurvedEdgeWidget(
      child: Container(
        color: Theme.of(context).colorScheme.primary.withOpacity(.4),
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 230, 
          child: Stack(
            children: [
              Positioned(
                top: -150,
                right: -250,
                child: CircularContainer(
                  backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                ),
              ),
              Positioned(
                top: 100,
                right: -300,
                child: CircularContainer(
                  backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(.1),
                ),
              ),
              child, 
            ],
          ),
        ),
      ),
    );
  }
}
