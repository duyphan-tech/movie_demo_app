import 'package:flutter_hooks/flutter_hooks.dart';

typedef AsyncLockResult = ({bool isLoading, Future<void> Function() execute});

AsyncLockResult useAsyncLock(Future<void> Function() action) {
  final isLoading = useState(false);
  // ignore: deprecated_member_use
  final isMounted = useIsMounted();

  final execute = useCallback(() async {
    if (isLoading.value) return;

    isLoading.value = true;

    try {
      await action();
    } finally {
      if (isMounted()) {
        isLoading.value = false;
      }
    }
  }, [action]);

  return (isLoading: isLoading.value, execute: execute);
}
