//
//  SHMenuViewControllerDataSource.swift
//  SHMenu
//
//  Created by Mikko Kutilainen on 12.1.2016.
//  Copyright © 2016 Shingle Oy. All rights reserved.
//

import Foundation
import UIKit

open class SHMenuViewControllerDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    let tableView: UITableView
    var sections: [SHMenuSection]
    
    public init(sections: [SHMenuSection], tableView: UITableView) {
        self.tableView = tableView
        self.sections = sections
        super.init()
    }
    
    
    open func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }
    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sections[section].rows.count
    }
    open func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sections[section].header
    }
    open func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return self.sections[section].footer
    }
    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = self.sections[(indexPath as NSIndexPath).section].rows[(indexPath as NSIndexPath).row]
        return row.cell(self.tableView)
        
    }
    open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let row = self.sections[(indexPath as NSIndexPath).section].rows[(indexPath as NSIndexPath).row]
        if let action = row.action {
            action(indexPath)
            
            if row.automaticallyDeselectSelectedRow {
                tableView.deselectRow(at: indexPath, animated: true)
            }
        }
        
    }
    open func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let row = self.sections[(indexPath as NSIndexPath).section].rows[(indexPath as NSIndexPath).row]
        return row.preferredHeight
    }
    open func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        
        if let view = view as? UITableViewHeaderFooterView {
            let section = self.sections[section]
            view.textLabel?.textAlignment = section.footerTextAlignment ?? .left
        }
        
    }
}
