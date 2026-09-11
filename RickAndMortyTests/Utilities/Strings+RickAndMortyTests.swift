//
//  Strings+RickAndMortyTests.swift
//  RickAndMortyTests
//
//  Created by Ricky Sharp on 9/11/2026.
//

import Testing

@Suite struct StringsRickAndMortyExtensionTests {

	@Test("Strings are normalized by removing leading and trailing whitespace and newlines")
	func normalize() {
		let scenarios: [(input: String, expectedOutput: String)] = [
			(input: "", expectedOutput: ""),
			(input: "\u{4E03}xy", expectedOutput: "\u{4E03}xy"),
			(input: "A \t\r\n   B", expectedOutput: "A \t\r\n   B"),
			(input: " \t \n \r Hello\t\t\r \n", expectedOutput: "Hello")
		]
		
		for (index, scenario) in scenarios.enumerated() {
			let input = scenario.input
		
			#expect(input.normalized == scenario.expectedOutput, "scenario index: \(index)")
		}
	}
}
