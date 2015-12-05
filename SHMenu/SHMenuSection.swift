//
//  SHMenuSection.swift
//  SHMenu
//
//  Created by Mikko Kutilainen on 5.12.2015.
//  Copyright © 2015 Shingle Oy. All rights reserved.
//

import Foundation

class SHMenuViewSection {
    var rows: [SHMenuViewRow]
    var header: String?
    var footer: String?
    var footerTextAlignment: NSTextAlignment?
    
    init(rows: [SHMenuViewRow]) {
        self.rows = rows
    }
    
    convenience init(header: String?, rows: [SHMenuViewRow]) {
        self.init(rows: rows)
        self.header = header
    }
    convenience init(header: String?, footer: String?, rows: [SHMenuViewRow]) {
        self.init(rows: rows)
        self.header = header
        self.footer = footer
    }
}