//
//  IILocalizationUtilities.swift
//  RickAndMorty
//
//  Created by Ricky Sharp on 9/11/2026.
//

import Foundation

enum IILocalizationUtilities {

	nonisolated static let defaultDateFormatStyle = Date.FormatStyle(date: .abbreviated, time: .none)

	static func dateFormatStyle(locale aLocale: Locale?) -> Date.FormatStyle {
		if let theLocale = aLocale {
			defaultDateFormatStyle.locale(theLocale)
		} else {
			defaultDateFormatStyle
		}
	}
}

enum FormatDateOption {
	case standard
}

extension Date {
	func formatted(as option: FormatDateOption, locale: Locale? = nil) -> String {
		switch option {
			case .standard:
				formatted(IILocalizationUtilities.dateFormatStyle(locale: locale))
		}
	}
}

