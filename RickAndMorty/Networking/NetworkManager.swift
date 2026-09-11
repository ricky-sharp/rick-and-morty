//
//  NetworkManager.swift
//  RickAndMorty
//
//  Created by Ricky Sharp on 9/11/2026.
//

import Foundation

protocol NetworkManagerProtocol {
	func performRequest<R: APIRequest>(_ request: R, with parameters: R.Parameters) async throws -> R.Response
}

final class NetworkManager: NetworkManagerProtocol, Sendable {
	static let scheme = "https"
	static let defaultHost = "rickandmortyapi.com"
	
	let host: String
	let port: Int?
	let session: URLSessionProtocol
	
	init(host: String = NetworkManager.defaultHost, port: Int? = nil, session: URLSessionProtocol = URLSession.shared) {
		self.host = host
		self.port = port
		self.session = session
	}

	func performRequest<R: APIRequest>(_ request: R, with parameters: R.Parameters) async throws -> R.Response {
		let url = try url(for: request.endpoint, queryItems: parameters.queryItems)
		let request = URLRequest(url: url)
		
		let (data, response) = try await session.data(for: request)
		
		guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
			throw APIError.invalidResponse
		}
		
		return try JSONDecoder().decode(R.Response.self, from: data)
	}
	
	func url(for endpoint: Endpoint, queryItems: [URLQueryItem]?) throws -> URL {
		var components = URLComponents()
		
		components.scheme = NetworkManager.scheme
		components.host = host
		components.port = port
		components.path = endpoint.path
		components.queryItems = queryItems
	
		guard let url = components.url else {
			throw APIError.invalidURL(components.string ?? "Malformed URL")
		}
		return url
	}
}
