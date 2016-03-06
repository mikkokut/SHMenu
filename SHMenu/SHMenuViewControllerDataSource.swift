//
//  SHMenuViewControllerDataSource.swift
//  SHMenu
//
//  Created by Mikko Kutilainen on 12.1.2016.
//  Copyright © 2016 Shingle Oy. All rights reserved.
//

import Foundation
import UIKit

public class SHMenuViewControllerDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    let tableView: UITableView
    var sections: [SHMenuSection]
    
    public init(sections: [SHMenuSection], tableView: UITableView) {
        self.tableView = tableView
        self.sections = sections
        super.init()
    }
    
    
    public func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.sections.count
    }
    public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sections[section].rows.count
    }
    public func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sections[section].header
    }
    public func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return self.sections[section].footer
    }
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let row = self.sections[indexPath.section].rows[indexPath.row]
        return row.cell(self.tableView)
        
    }
    public func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let row = self.sections[indexPath.section].rows[indexPath.row]
        if let action = row.action {
            action(indexPath)
            
            if row.automaticallyDeselectSelectedRow {
                tableView.deselectRowAtIndexPath(indexPath, animated: true)
            }
        }
        
    }
    public func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let row = self.sections[indexPath.section].rows[indexPath.row]
        return row.preferredHeight
    }
    public func tableView(tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        
        if let view = view as? UITableViewHeaderFooterView {
            let section = self.sections[section]
            view.textLabel?.textAlignment = section.footerTextAlignment ?? .Left
        }
        
    }
}
