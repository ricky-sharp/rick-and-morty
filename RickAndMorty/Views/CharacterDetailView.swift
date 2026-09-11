//
//  CharacterDetailView.swift
//  RickAndMorty
//
//  Created by Ricky Sharp on 9/11/2026.
//

import SwiftUI

struct CharacterDetailView: View {
	
	let character: RickAndMortyCharacter
	
	var attributes: [CharacterAttribute] {
		character.attributes
	}

    var body: some View {
        VStack {
			Rectangle()
				.frame(maxWidth: .infinity, maxHeight: 300)
				.foregroundStyle(.gray)
			VStack {
				ForEach(attributes) { attribute in
					CharacterAttributeView(attribute: attribute)
				}
			}
			.padding()
			Spacer()
        }
        .navigationTitle(character.name)
		.navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    CharacterDetailView(character: RickAndMortyCharacter(id: 2, name: "Morty", status: "Alive", species: "Human", type: nil, originName: "Earth"))
}
