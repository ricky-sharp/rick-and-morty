//
//  NoResultsView.swift
//  RickAndMorty
//
//  Created by Ricky Sharp on 9/11/2026.
//

import SwiftUI

struct NoResultsView: View {
    var body: some View {
		VStack {
			Text("No Results")
				.font(.title)
			Text("Please modify your search and try again.")
				.font(.callout)
		}
    }
}

#Preview {
    NoResultsView()
}
