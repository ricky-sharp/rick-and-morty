//
//  String+RickAndMorty.swift
//  RickAndMorty
//
//  Created by Ricky Sharp on 9/11/2026.
//

import Foundation

extension String {
	var normalized: String {
		trimmingCharacters(in: .whitespacesAndNewlines)
	}
}
