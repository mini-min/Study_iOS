//
//  UIAlertController+Extension.swift
//  Study_iOS
//
//  Created by 민 on 2021/10/01.
//

import Foundation
import UIKit

extension UIAlertController {

    // Set title font and title color
    func setTitlet(font: UIFont?, color: UIColor?) {
        guard let title = self.title else { return }
        let attributeString = NSMutableAttributedString(string: title)// 1
        if let titleFont = font {
            attributeString.addAttributes([NSAttributedString.Key.font: titleFont], // 2
                                          range: NSRange(location: 0, length: title.count))
        }

        if let titleColor = color {
            attributeString.addAttributes([NSAttributedString.Key.foregroundColor: titleColor], // 3
                                          range: NSRange(location: 0, length: title.count))
        }
        self.setValue(attributeString, forKey: "attributedTitle")// 4
    }

    // Set message font and message color
    func setMessage(font: UIFont?, color: UIColor?) {
        guard let message = self.message else { return }
        let attributeString = NSMutableAttributedString(string: message)
        if let messageFont = font {
            attributeString.addAttributes([NSAttributedString.Key.font: messageFont],
                                          range: NSRange(location: 0, length: message.count))
        }

        if let messageColorColor = color {
            attributeString.addAttributes([NSAttributedString.Key.foregroundColor: messageColorColor],
                                          range: NSRange(location: 0, length: message.count))
        }
        self.setValue(attributeString, forKey: "attributedMessage")
    }

    // Set tint color of UIAlertController
    func setTint(color: UIColor) {
        self.view.tintColor = color
    }
}