//
//  Endpoint.swift
//  RickAndMorty
//
//  Created by Ricky Sharp on 9/11/2026.
//

import Foundation

enum Endpoint: CaseIterable {
	case character
	
	var path: String {
		switch self {
			case .character:
				"/api/character/"
		}
	}
}
