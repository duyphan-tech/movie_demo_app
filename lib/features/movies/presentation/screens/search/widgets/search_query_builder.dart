import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SearchQueryBuilder extends HookWidget {
  final TextEditingController controller;
  final Widget Function(BuildContext context, String query) builder;

  const SearchQueryBuilder({
    super.key,
    required this.controller,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    final query = useListenableSelector(
      controller,
      () => controller.text,
    );

    return builder(context, query);
  }
}
