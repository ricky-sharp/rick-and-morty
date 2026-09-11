//
//  CharacterImageView.swift
//  RickAndMorty
//
//  Created by Ricky Sharp on 9/11/2026.
//

import SwiftUI

struct CharacterImageView: View {
	let imageURL: String?

    var body: some View {
		if let imageURL {
			AsyncImage(url: URL(string: imageURL)) { image in
				image.resizable()
			} placeholder: {
				Rectangle()
					.foregroundStyle(.gray)
			}
		} else {
			Rectangle()
				.foregroundStyle(.gray)
		}
    }
}

#Preview {
    CharacterImageView(imageURL: nil)
		.frame(width: 100, height: 100)
}
