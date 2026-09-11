//
//  LoadingView.swift
//  RickAndMorty
//
//  Created by Ricky Sharp on 9/11/2026.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
		ProgressView()
			.controlSize(.large)
    }
}

#Preview {
    LoadingView()
}
