//
//  NetworkManagerTests.swift
//  RickAndMorty
//
//  Created by Ricky Sharp on 9/11/2026.
//

import Foundation
import Testing

struct MockURLSession: URLSessionProtocol {
	let stubbedData: Data?
	let stubbedStatusCode: Int?
	let errorToThrow: Error?

	func data(for request: URLRequest) async throws -> (Data, URLResponse) {
		guard let url = request.url else {
			throw URLError(.badURL)
		}
	
		if let errorToThrow {
			throw errorToThrow
		}
		
		let response: URLResponse? = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)
		
		return (stubbedData ?? Data(), response ?? URLResponse())
	}
}

nonisolated struct SampleResponse: APIResponse {
	let id: Int
}

nonisolated struct SampleRequest: APIRequest {
	typealias Response = SampleResponse
	typealias Parameters = NoParameters
	
	let httpMethod: HTTPMethod = .get
	let endpoint: Endpoint = .character
}

@Suite struct NetworkManagerTests {
	
	@Test("When the underlying URL session succeeds, a model type is returned")
	func success() async throws {
		let json = """
		{ "id": 123 }
		"""
		let data = try #require(json.data(using: .utf8))
		let statusCode = 200
	
		let mockURLSession = MockURLSession(stubbedData: data, stubbedStatusCode: statusCode, errorToThrow: nil)
		let networkManager = NetworkManager(session: mockURLSession)
		
		let response = try await networkManager.performRequest(SampleRequest(), with: NoParameters())
		
		#expect(response.id == 123)
	}
	
	@Test("Whenthe underlying URL session fails, an error is thrown")
	func failure() async throws {
		let json = """
		{ "id": 456 }
		"""
		let data = try #require(json.data(using: .utf8))
		let statusCode = 200

		let mockURLSession = MockURLSession(stubbedData: data, stubbedStatusCode: statusCode, errorToThrow: URLError(.badURL))
		let networkManager = NetworkManager(session: mockURLSession)
		
		do {
			_ = try await networkManager.performRequest(SampleRequest(), with: NoParameters())
			Issue.record("Should have thrown an error")
		} catch {
			// Should be here
		}
	}
}
