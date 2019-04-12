//
//  UILabelExtension.swift
//  todoApp
//
//  Created by 이준형 on 4/12/19.
//  Copyright © 2019 com.leejunhyung. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
	func setStrikethrough(text: String) -> Void {
		let strokeEffect: [NSAttributedString.Key : Any] = [
			NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue,
			NSAttributedString.Key.strikethroughColor: UIColor.black,
		]
		let strokeString = NSAttributedString(string: text, attributes: strokeEffect)
		self.attributedText = strokeString
	}
	
	func unsetStrikethrough(text: String) -> Void {
		let attributedText = NSMutableAttributedString(string: text)
		attributedText.removeAttribute(NSAttributedString.Key.strikethroughStyle, range: NSMakeRange(0, 1))
		self.attributedText = attributedText
	}
}
