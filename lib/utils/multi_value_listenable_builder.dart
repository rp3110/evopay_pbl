import 'package:flutter/foundation.dart' show Key, ValueListenable;
import 'package:flutter/material.dart'
    show
        StatelessWidget,
        Widget,
        BuildContext,
        Container,
        ValueListenableBuilder;

/// This widget listens to multiple [ValueListenable]s and
/// calls given builder function if any one of them changes.
class MultiValueListenableBuilder extends StatelessWidget {
  /// List of [ValueListenable]s to listen to.
  final List<ValueListenable> valueListenable;

  /// The builder function to be called when value of any of the [ValueListenable] changes.
  /// The order of values list will be same as [valueListenable] list.
  final Widget Function(
      BuildContext context, List<dynamic> values, Widget? child) builder;

  /// An optional child widget which will be available as child parameter in [builder].
  final Widget? child;

  // The const constructor.
  const MultiValueListenableBuilder({
    Key? key,
    required this.valueListenable,
    required this.builder,
    this.child,
  })  : assert(valueListenable.length != 0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final list = List<dynamic>.filled(valueListenable.length, dynamic);
    return Container(
      child: _buildValueListenableBuilders(0, list),
    );
  }

  ValueListenableBuilder _buildValueListenableBuilders(
    int index,
    List<dynamic> list,
  ) {
    if (index < valueListenable.length - 1) {
      return ValueListenableBuilder(
        valueListenable: valueListenable.elementAt(index),
        builder: (context, value, child) {
          list[index] = value;
          return _buildValueListenableBuilders(index + 1, list);
        },
        child: child,
      );
    } else {
      return ValueListenableBuilder(
        valueListenable: valueListenable.elementAt(index),
        builder: (context, value, child) {
          list[index] = value;
          return builder.call(context, List<dynamic>.unmodifiable(list), child);
        },
        child: child,
      );
    }
  }
}
