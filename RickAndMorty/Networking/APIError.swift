//
//  APIError.swift
//  RickAndMorty
//
//  Created by Ricky Sharp on 9/11/2026.
//

import Foundation

enum APIError: LocalizedError {
	case invalidURL(String)
	case invalidResponse
	
	var localizedDescription: String {
		switch self {
			case .invalidURL(let urlString):
				"Invalid URL: \(urlString)"
			case .invalidResponse:
				"Invalid response"
		}
	}
}
