//
//  Day03.swift
//  AdventOfCode
//
//  Created by Jonathon Klobucar on 12/2/24.
//

import Algorithms

struct Day03: AdventDay {
  // Save your data in a corresponding text file in the `Data` directory.
  var data: String

  // Only used in part 1... meh
  var entities: [(Int?, Int?)] {
    data
    .matches(of:  /mul\((\d+),(\d+)\)/)
    .map {match in
      return (Int(match.1), Int(match.2))
    }
  }
  // Replace this with your solution for the first part of the day's challenge.
  func part1() -> Any {
    entities.reduce(0) { (total, tuple) in
      let (t1, t2) = tuple
      return total + ((t1 ?? 0) * (t2 ?? 0))
    }

  }

  // Replace this with your solution for the second part of the day's challenge.
  func part2() -> Any {
    // I really wanted to do this without side effects. Learned way too much about reduce
    // but it is cool.
      data
      .matches(of: /mul\((\d+),(\d+)\)|do\(\)|don't\(\)/)
      .reduce((sum: 0, enabled: true)) { (root, match) in
        switch match.output.0 {
          case "do()":
              return (sum: root.sum, enabled: true)
          case "don't()":
              return (sum: root.sum, enabled: false)
          default:
              if root.enabled {
                  let firstNum = Int(match.output.1 ?? "0") ?? 0
                  let secondNum = Int(match.output.2 ?? "0") ?? 0
                  return (sum: root.sum + (firstNum * secondNum), enabled: root.enabled)
              } else {
                  return root
              }
          }
      }.sum
  }
  }

