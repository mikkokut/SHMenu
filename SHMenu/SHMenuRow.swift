//
//  SHMenuRow.swift
//  SHMenu
//
//  Created by Mikko Kutilainen on 5.12.2015.
//  Copyright © 2015 Shingle Oy. All rights reserved.
//

import Foundation

class SHMenuViewRow {
    var cell: ((UITableView) -> (UITableViewCell))
    var action: ((NSIndexPath) -> ())?
    var analyze: ((UITableViewCell?) -> Bool)?
    var preferredHeight: CGFloat = 44
    var automaticallyDeselectSelectedRow = true
    
    init(cell: ((UITableView) -> (UITableViewCell))) {
        self.cell = cell
    }
    
    convenience init(cell: ((UITableView) -> (UITableViewCell)), action: ((NSIndexPath) -> ())?, analyze: ((UITableViewCell?) -> Bool)?) {
        self.init(cell: cell)
        self.action = action
        self.analyze = analyze
    }
    
    convenience init(cell: ((UITableView) -> (UITableViewCell)), action: ((NSIndexPath) -> ())?) {
        self.init(cell: cell)
        self.action = action
    }
    
    convenience init(cell: ((UITableView) -> (UITableViewCell)), analyze: ((UITableViewCell?) -> Bool)?) {
        self.init(cell: cell)
        self.analyze = analyze
    }
    
    
}