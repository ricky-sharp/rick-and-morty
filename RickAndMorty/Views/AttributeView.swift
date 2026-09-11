//
//  AttributeView.swift
//  RickAndMorty
//
//  Created by Ricky Sharp on 9/11/2026.
//

import SwiftUI

struct CharacterAttributeView: View {
	let attribute: CharacterAttribute

    var body: some View {
		HStack {
			Text(attribute.localizedPrompt)
				.font(.headline)
			Spacer()
			Text(attribute.value)
				.font(.callout)
		}
		.padding(.vertical, 8)
    }
}

#Preview {
    CharacterAttributeView(attribute: CharacterAttribute(kind: .species, value: "Human"))
}
