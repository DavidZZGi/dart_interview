//Exercise num 1, the change that should be made is
//int small = numbers[0];

//Exercise num 2
Map<String, List<String>> groupByOwners(Map<String, String> files) {
  Map<String, List<String>> result = {};
  files.forEach((file, owner) {
    if (!result.containsKey(owner)) {
      result[owner] = [];
    }
    result[owner]!.add(file);
  });

  return result;
}
