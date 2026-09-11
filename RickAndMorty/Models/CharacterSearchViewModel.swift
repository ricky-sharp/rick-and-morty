//
//  CharacterSearchViewModel.swift
//  RickAndMorty
//
//  Created by Ricky Sharp on 9/11/2026.
//

import SwiftUI

@Observable final class PostsViewModel {
	enum State {
		case noResults
		case loading
		case results([RickAndMortyCharacter])
		case error(String)
	}

	private let networkManager: NetworkManagerProtocol

	private(set) var state: State = .noResults
	
	init(networkManager: NetworkManagerProtocol) {
		self.networkManager = networkManager
	}

	@discardableResult
	func fetchCharacters(searchPhrase: String) -> Task<Void, Never> {
		Task {
			state = .loading
			
			do {
				let response = try await networkManager.performRequest(CharacterRequest(), with: CharacterParameters(searchPhrase: searchPhrase))
				state = .results(response.results)
			} catch {
				state = .error(error.localizedDescription)
			}
		}
	}
}
