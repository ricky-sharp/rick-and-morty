//
//  URLSession+RickAndMorty.swift
//  RickAndMorty
//
//  Created by Ricky Sharp on 9/11/2026.
//

import Foundation

protocol URLSessionProtocol {
	func data(for request: URLRequest) async throws -> (Data, URLResponse)
}

extension URLSession: URLSessionProtocol { }
