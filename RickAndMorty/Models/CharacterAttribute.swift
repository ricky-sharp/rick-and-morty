//
//  CharacterAttribute.swift
//  RickAndMorty
//
//  Created by Ricky Sharp on 9/11/2026.
//

import SwiftUI

enum CharacterAttributeKind: Int, CaseIterable {
	case species
	case status
	case origin
	case type
	
	var localizedPrompt: String {
		switch self {
			case .species:
				"Species"
			case .status:
				"Status"
			case .origin:
				"Origin"
			case .type:
				"Type"
		}
	}
}

struct CharacterAttribute {
	let kind: CharacterAttributeKind
	let value: String
	
	var localizedPrompt: String {
		kind.localizedPrompt
	}
}

extension CharacterAttribute: Identifiable {
	var id: Int {
		kind.rawValue
	}
}
