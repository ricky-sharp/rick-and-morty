//
//  Character.swift
//  RickAndMorty
//
//  Created by Ricky Sharp on 9/11/2026.
//

import Foundation

struct Character: Decodable, Identifiable, Sendable {
	let id: Int
	let name: String
	let status: String
	let species: String
	let type: String?
	
	enum CodingKeys: String, CodingKey {
		case id
		case name
		case status
		case species
		case type
	}
	
	init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.id = try container.decode(Int.self, forKey: .id)
		self.name = try container.decode(String.self, forKey: .name).normalized
		self.status = try container.decode(String.self, forKey: .status).normalized
		self.species = try container.decode(String.self, forKey: .species).normalized
		
		let type = try container.decode(String.self, forKey: .type).normalized
		
		self.type = type.isEmpty ? nil : type
	}
}
