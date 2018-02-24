//
//  SHMenuRow.swift
//  SHMenu
//
//  Created by Mikko Kutilainen on 5.12.2015.
//  Copyright © 2015 Shingle Oy. All rights reserved.
//

import Foundation
import UIKit

open class SHMenuRow {
    var cell: ((UITableView) -> (UITableViewCell))
    var action: ((IndexPath) -> ())?
    var analyze: ((UITableViewCell?) -> Bool)?
    var accessoryAction: ((IndexPath) -> ())?
    
    open var preferredHeight: CGFloat = 44
    open var automaticallyDeselectSelectedRow = true
    
    public init(cell: @escaping ((UITableView) -> (UITableViewCell))) {
        self.cell = cell
    }
    
    public convenience init(cell: @escaping ((UITableView) -> (UITableViewCell)), action: ((IndexPath) -> ())?, analyze: ((UITableViewCell?) -> Bool)?) {
        self.init(cell: cell)
        self.action = action
        self.analyze = analyze
    }
    
    public convenience init(cell: @escaping ((UITableView) -> (UITableViewCell)), action: ((IndexPath) -> ())?, accessoryAction: ((IndexPath) -> ())?, analyze: ((UITableViewCell?) -> Bool)?) {
        self.init(cell: cell)
        self.action = action
        self.accessoryAction = accessoryAction
        self.analyze = analyze
    }
    
    public convenience init(cell: @escaping ((UITableView) -> (UITableViewCell)), action: ((IndexPath) -> ())?) {
        self.init(cell: cell)
        self.action = action
    }
    
    public convenience init(cell: @escaping ((UITableView) -> (UITableViewCell)), analyze: ((UITableViewCell?) -> Bool)?) {
        self.init(cell: cell)
        self.analyze = analyze
    }
    
    
}
