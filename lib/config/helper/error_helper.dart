Future<T> execute<T>(Future<T> Function() action) async {
  try {
    return await action();
  } catch (e) {
    print('Error: $e');
    throw "Error ocurrido $e";
  }
}
