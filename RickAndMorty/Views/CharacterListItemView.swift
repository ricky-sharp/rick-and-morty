//
//  CharacterListItemView.swift
//  RickAndMorty
//
//  Created by Ricky Sharp on 9/11/2026.
//

import SwiftUI

struct CharacterListItemView: View {
	let character: RickAndMortyCharacter

    var body: some View {
		HStack {
			Rectangle()
				.frame(width: 100, height: 100)
				.foregroundStyle(.gray)
			VStack(alignment: .leading) {
				Text(character.name)
					.font(.headline)
				Text(character.species)
					.font(.callout)
			}
        }
        .accessibilityElement(children: .combine)
    }
}

#Preview {
    CharacterListItemView(character: RickAndMortyCharacter(id: 1, name: "Rick", status: "Alive", species: "Human", type: nil, originName: "Earth"))
}
