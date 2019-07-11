//
//  UIKit.swift
//  twitter-mood
//
//  Created by Dennis Merli on 7/6/19.
//  Copyright © 2019 Dennis Merli. All rights reserved.
//

import UIKit

struct UIKit {
    
    // MARK: Colors
    
    ///#323232
    static var grey323232: UIColor { return UIColor.fromHex(0x323232) }
    ///#1B1B1B
    static var grey1B1B1B: UIColor { return UIColor.fromHex(0x1B1B1B) }

    // MARK: Fonts Styles
    static var smallText1: UIFont {
        return UIFont.systemFont(ofSize: 11, weight: .regular)
    }
    
    static var smallText2: UIFont {
        return UIFont.systemFont(ofSize: 13, weight: .bold)
    }
    
    static var smallText3: UIFont {
        return UIFont.systemFont(ofSize: 14, weight: .regular)
    }
    
    static var regularText1: UIFont {
        return UIFont.systemFont(ofSize: 17, weight: .bold)
    }
    
    static var largeText1: UIFont {
        return UIFont.systemFont(ofSize: 22, weight: .regular)
    }
    
    static var largeText2: UIFont {
        return UIFont.systemFont(ofSize: 22, weight: .bold)
    }
}

