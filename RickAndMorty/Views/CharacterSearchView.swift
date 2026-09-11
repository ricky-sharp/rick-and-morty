//
//  CharacterSearchView.swift
//  RickAndMorty
//
//  Created by Ricky Sharp on 9/11/2026.
//

import SwiftUI

struct CharacterSearchView: View {
 	@State var viewModel = PostsViewModel(networkManager: NetworkManager())
	@SceneStorage("searchPhrase") var searchPhrase: String = ""

	var body: some View {
		NavigationStack {
			VStack {
				switch viewModel.state {
					case .noResults:
						NoResultsView()
					case .loading:
						LoadingView()
					case .results(let characters):
						List {
							ForEach(characters) { character in
								NavigationLink(destination: CharacterDetailView(character: character)) {
									CharacterListItemView(character: character)
								}
							}
						}
					case .error(let message):
						ErrorView(message: message)
				}
			}
			.searchable(text: $searchPhrase, placement: .navigationBarDrawer)
			.onChange(of: searchPhrase, { _, newValue in
				viewModel.fetchCharacters(searchPhrase: searchPhrase)
			})
			.navigationTitle("Characters")
		}
    }
}

#Preview {
    CharacterSearchView()
}
