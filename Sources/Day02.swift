import Algorithms

struct Day02: AdventDay {
  // Save your data in a corresponding text file in the `Data` directory.
  var data: String

  // Splits input data into its component parts and convert from string.
  // Data is ints seperated by sapce per line
  var entities: [[Int]] {
    data.split(separator: "\n").map {
      $0.split(separator: " ").compactMap { Int($0) }
    }
  }

  func isOK(_ row: [Int]) -> Bool {
    let maxVal: Int = 3
    let diff = zip(row, row.dropFirst()).map{$1 - $0}
    if diff.contains(where: {abs($0)  > maxVal}) {
      return false
    }
    return diff.allSatisfy({$0 > 0}) || diff.allSatisfy({$0 < 0})
  }

  func part1() -> Any {
    return entities.count(where: isOK)
  }

  // Replace this with your solution for the second part of the day's challenge.
  func part2() -> Any {
    var result: Int = 0
    for entry in entities {
      if isOK(entry) {
        result += 1
        continue
      }
      // Test with each element missing
      if entry.indices.contains(where: { i in
        var tmp = entry
        tmp.remove(at: i)
        return isOK(tmp)
      }) {
        result += 1
      }
    }
    return result
  }
}
