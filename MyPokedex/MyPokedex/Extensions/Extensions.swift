//
//  Extensions.swift
//  MyPokedex
//
//  Created by Gabo Cuadros Cardenas on 4/25/20.
//  Copyright © 2020 Gabo-TheCreator. All rights reserved.
//

import UIKit

extension UIView {
    
    func roundSelectedCorners(clipToBounds: Bool, cornerRadius: CGFloat, _ selectedCorners: CACornerMask) {
        self.clipsToBounds = clipToBounds
        self.layer.cornerRadius = cornerRadius
        self.layer.maskedCorners = selectedCorners
    }
    
}
