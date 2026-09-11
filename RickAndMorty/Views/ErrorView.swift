//
//  ErrorView.swift
//  RickAndMorty
//
//  Created by Ricky Sharp on 9/11/2026.
//

import SwiftUI

struct ErrorView: View {
	let message: String

    var body: some View {
		VStack {
		Text("The following error occurred:")
			.font(.headline)
        Text(message)
			.font(.body)
		Text("Please try again.")
			.font(.body)
		}
    }
}

#Preview {
    ErrorView(message: "Server Error")
}
