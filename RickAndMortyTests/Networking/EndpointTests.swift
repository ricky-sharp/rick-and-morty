//
//  EndpointTests.swift
//  RickAndMortyTests
//
//  Created by Ricky Sharp on 9/11/2026.
//

import Testing

@Suite struct EndpointTests {

	@Test("All endpoints vend proper paths")
	func paths() {
		for endpoint in Endpoint.allCases {
			let expectedPath = switch endpoint {
				case .character:
					"/api/character/"
			}
		
			#expect(endpoint.path == expectedPath, "path for \(endpoint)")
		}
	}
}
