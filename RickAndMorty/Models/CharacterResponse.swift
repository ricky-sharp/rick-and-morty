//
//  CharacterResponse.swift
//  RickAndMorty
//
//  Created by Ricky Sharp on 9/11/2026.
//

import Foundation

nonisolated struct CharacterInfo: Decodable, Sendable {
	let count: Int
	let pages: Int
	let next: String?
	let prev: String?
}

nonisolated struct CharacterResponse: APIResponse, Sendable {
	let info: CharacterInfo
	let results: [RickAndMorty.Character]
}
