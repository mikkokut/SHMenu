//
//  SHMenuSection.swift
//  SHMenu
//
//  Created by Mikko Kutilainen on 5.12.2015.
//  Copyright © 2015 Shingle Oy. All rights reserved.
//

import Foundation
import UIKit

open class SHMenuSection {
    var rows: [SHMenuRow]
    var header: String?
    var footer: String?
    var footerTextAlignment: NSTextAlignment?
    
    public init(rows: [SHMenuRow]) {
        self.rows = rows
    }
    
    public convenience init(header: String?, rows: [SHMenuRow]) {
        self.init(rows: rows)
        self.header = header
    }
    public convenience init(header: String?, footer: String?, rows: [SHMenuRow]) {
        self.init(rows: rows)
        self.header = header
        self.footer = footer
    }
}
