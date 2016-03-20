//
//  NumberLabel.swift
//  Calculator
//
//  Created by Xhriman on 2016/3/15.
//  Copyright © 2016年 Exwd. All rights reserved.
//

import UIKit
import Foundation

class NumberLabel: UILabel {

	let formatter = NSNumberFormatter()

	// MARK: - Value

	var value: Double {
		get {
			if let text = self.text {
				return Double(text.stringByReplacingOccurrencesOfString(",", withString: ""))!
			} else {
				return 0.0
			}
		}

		set {
			if newValue % 1 == 0 {
				formatter.numberStyle = .DecimalStyle
				formatter.maximumFractionDigits = 0
				self.text = formatter.stringFromNumber(Int(newValue))
			} else if (newValue < 1000) {
				self.text = "\(Double(newValue))"
			} else {
				formatter.numberStyle = .DecimalStyle
				formatter.maximumFractionDigits = 8
				self.text = formatter.stringFromNumber(Double(newValue))
			}
		}
	}

	func append(digit: Int) {
		if let text = self.text where text != "0" {
			if text.containsString(".") {
				self.text = "\(text)\(digit)"
			} else {
				self.value = Double("\(text)\(digit)".stringByReplacingOccurrencesOfString(
					",", withString: ""))!
			}
		} else {
			self.text = "\(digit)"
		}
	}

	func appendFloatPoint() {
		if let text = self.text where !text.containsString(".") {
			self.text = "\(text)."
		}
	}

	var isInt: Bool {
		return value % 1 == 0
	}

	var isNegative: Bool {
		if let text = self.text {
			return text.hasPrefix("-")
		} else {
			return false
		}
	}

	func clear() {
		self.value = 0.0
	}

	func changeSign() {
		guard let text = self.text else {
			return
		}

		self.text = self.isNegative
			? text.substringFromIndex(text.startIndex.advancedBy(1))
			: "-\(text)"
	}

	func toPercentage() {
		if let text = self.text where text != "0" {
			self.value = value / 100
		}
	}
}
