//
//  HTTPMethodTests.swift
//  RickAndMortyTests
//
//  Created by Ricky Sharp on 9/11/2026.
//

import Testing

@Suite struct HTTPMethodTests {

	@Test("All methods vend proper raw values")
	func rawValues() {
		for method in HTTPMethod.allCases {
			let expectedRawValue = switch method {
				case .get:
					"GET"
			}
		
			#expect(method.rawValue == expectedRawValue, "raw value for \(method)")
		}
	}
}
