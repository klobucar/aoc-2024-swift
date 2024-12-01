import Algorithms

struct Day01: AdventDay {
  // Save your data in a corresponding text file in the `Data` directory.
  var data: String

  // Splits input data into its component parts and convert from string.
  var entities: ([Int], [Int]) {
    let lines = data.split(separator: "\n")
    var left: [Int] = []
    var right: [Int] = []
    
    for line in lines {
      let components = line.split(separator: " ").compactMap { Int($0) }
      if components.count == 2 {
        left.append(components[0])
        right.append(components[1])
      }
    }
    return (left, right)
  }

  func part1() -> Any {
    // Calculate the sum of the first set of input data
    var (left, right) = entities
    
    left.sort()
    right.sort()
    
   var total: Int = 0
    for pair in zip(left, right) {
      total += abs(pair.0 - pair.1)
    }
    return total
  }

  
  func part2() -> Any {
    let (left, right) = entities
    
    var total: Int = 0
    
    for ent in left {
      total += (right.filter {$0 == ent}.count * ent)
    }
    return total
  }
}
