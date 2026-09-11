//
//  APIRequest.swift
//  RickAndMorty
//
//  Created by Ricky Sharp on 9/11/2026.
//

import Foundation

protocol APIRequest {
	associatedtype Response: APIResponse
	associatedtype Parameters: APIParameters
	
	var httpMethod: HTTPMethod { get }
	var endpoint: Endpoint { get }
}

struct NoParameters: APIParameters {
	var queryItems: [URLQueryItem]? {
		nil
	}
}
