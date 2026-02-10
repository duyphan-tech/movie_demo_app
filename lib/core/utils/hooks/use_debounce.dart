import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void Function() useDebounce(
  VoidCallback action, {
  Duration duration = const Duration(milliseconds: 500),
}) {
  final timer = useRef<Timer?>(null);

  useEffect(() {
    return () => timer.value?.cancel();
  }, []);

  return useCallback(() {
    timer.value?.cancel();
    timer.value = Timer(duration, action);
  }, [action, duration]);
}
