//
//  SizeScreen.swift
//  TMNT Quiz Code
//
//  Created by Андрей on 29.11.2021.
//

import UIKit

struct SizeScreen {
    static let size = UIScreen.main.bounds
    static func giveFactor() -> CGFloat {
        let factor = min(size.height, size.width)
        return factor
    }
    
    static func sizeWidthHeight(_ invertSize: CGFloat) -> CGFloat {
        if size.width < size.height {
            switch invertSize {
            case size.width: return size.width
            default: return size.height
            }
        } else {
            switch invertSize {
            case size.width: return size.height
            default: return size.width
            }
        }
    }
}
