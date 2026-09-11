//
//  Character.swift
//  RickAndMorty
//
//  Created by Ricky Sharp on 9/11/2026.
//

import Foundation

struct Origin: Decodable, Hashable, Sendable {
	let name: String
	let url: String
}

struct RickAndMortyCharacter: Decodable, Hashable, Identifiable, Sendable {
	let id: Int
	let name: String
	let status: String
	let species: String
	let image: String
	let origin: Origin
	let type: String?
	let created: Date?
	
	enum CodingKeys: String, CodingKey {
		case id
		case name
		case status
		case species
		case image
		case origin
		case type
		case created
	}
	
	init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.id = try container.decode(Int.self, forKey: .id)
		self.name = try container.decode(String.self, forKey: .name).normalized
		self.status = try container.decode(String.self, forKey: .status).normalized
		self.species = try container.decode(String.self, forKey: .species).normalized
		self.origin = try container.decode(Origin.self, forKey: .origin)
		self.image = try container.decode(String.self, forKey: .image)
		
		let type = try container.decode(String.self, forKey: .type).normalized
		
		self.type = type.isEmpty ? nil : type
		
		let createdISO8601 = try container.decode(String.self, forKey: .created)
		let created = try? Date(createdISO8601, strategy: .iso8601)
		
		self.created = created
	}
}

extension RickAndMortyCharacter {
	init(id: Int, name: String, status: String, species: String, type: String?, originName: String) {
		self.id = id
		self.name = name
		self.status = status
		self.species = species
		self.origin = Origin(name: originName, url: "")
		self.type = type
		self.created = .now
		self.image = ""
	}
}

extension RickAndMortyCharacter {
	var attributes: [CharacterAttribute] {
		CharacterAttributeKind.allCases.compactMap { kind in
			switch kind {
				case .species:
					.init(kind: .species, value: species)
				case .status:
					.init(kind: .status, value: status)
				case .origin:
					.init(kind: .origin, value: origin.name)
				case .type:
					if let type {
						.init(kind: .type, value: type)
					} else {
						nil
					}
				case .created:
					if let created {
						.init(kind: .created, value: created.formatted(as: .standard))
					} else {
						nil
					}
			}
		}
	}
}
