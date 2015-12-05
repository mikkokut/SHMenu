//
//  SHMenuSection.swift
//  SHMenu
//
//  Created by Mikko Kutilainen on 5.12.2015.
//  Copyright © 2015 Shingle Oy. All rights reserved.
//

import Foundation

public class SHMenuViewSection {
    var rows: [SHMenuViewRow]
    var header: String?
    var footer: String?
    var footerTextAlignment: NSTextAlignment?
    
    public init(rows: [SHMenuViewRow]) {
        self.rows = rows
    }
    
    public convenience init(header: String?, rows: [SHMenuViewRow]) {
        self.init(rows: rows)
        self.header = header
    }
    public convenience init(header: String?, footer: String?, rows: [SHMenuViewRow]) {
        self.init(rows: rows)
        self.header = header
        self.footer = footer
    }
}