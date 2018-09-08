//
//  UIColor+rgb.swift
//  Quiz_Football
//
//  Created by Витя on 19.09.17.
//  Copyright © 2017 Blan. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(rgb r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ a: CGFloat = 1.0) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
    }
}
