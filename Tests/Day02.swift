//
//  Day02.swift
//  AdventOfCode
//
//  Created by Jonathon Klobucar on 12/2/24.
//

import Testing

@testable import AdventOfCode

// Make a copy of this file for every day to ensure the provided smoke tests
// pass.
struct Day02Tests {

  let testData = """
    7 6 4 2 1
    1 2 7 8 9
    9 7 6 2 1
    1 3 2 4 5
    8 6 4 4 1
    1 3 6 7 9
    """

@Test func testPart1() async throws {
  let challenge = Day02(data: testData)
  #expect((challenge.part1() as? Int) == 2)
}

@Test func testPart2() async throws {
  let challenge = Day02(data: testData)
  #expect((challenge.part2()) as? Int == 4)
}
}

