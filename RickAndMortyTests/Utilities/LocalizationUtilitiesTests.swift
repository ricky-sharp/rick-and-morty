//
//  LocalizationUtilitiesTests.swift
//  RickAndMorty
//
//  Created by Ricky Sharp on 9/11/2026.
//

import Foundation
import Testing

@Suite struct LocalizationUtilitiesTests {
	
	@Test("Standard date format include a medium date sans time")
	func standardDateFormat() {
		let date = Date(timeIntervalSinceReferenceDate: 825_000_000)
		
		#expect(date.formatted(as: .standard, locale: Locale(identifier: "en_US")) == "Feb 22, 2027")
		#expect(date.formatted(as: .standard, locale: Locale(identifier: "fr_FR")) == "22 févr. 2027")
	}
}
