//
//  CharacterRequest.swift
//  RickAndMorty
//
//  Created by Ricky Sharp on 9/11/2026.
//

import Foundation

nonisolated struct CharacterParameters: APIParameters {
	let searchPhrase: String
	
	var queryItems: [URLQueryItem]? {
		[URLQueryItem(name: "name", value: searchPhrase)]
	}
}

nonisolated struct CharacterRequest: APIRequest, Sendable {
	typealias Response = CharacterResponse
	typealias Parameters = CharacterParameters
	
	let httpMethod: HTTPMethod = .get
	let endpoint: Endpoint = .character
}
