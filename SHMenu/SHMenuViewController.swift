//
//  SHMenuViewController.h
//  SHMenuViewController
//
//  Created by Mikko Kutilainen on 5.12.2015.
//  Copyright © 2015 Shingle Oy. All rights reserved.
//


import Foundation
import UIKit





public class SHMenuViewController: UITableViewController {
    
    public var data = [SHMenuViewSection]()

    
    /**
    Override in order to respond to refresh event.
    Call self.endRefresh() after refreshing is finished.
    Please make sure you populate and reload your table view yourself.
    */
    public func shouldRefresh() {
        self.endRefresh()
    }
    
    
    /**
    Call after refreshing is finished
    */
    public func endRefresh() {
        self.refreshControl?.endRefreshing()
    }
    
    
    
    
    
    
    
    
    
    
    public func analyzeCells() -> Bool {
        for (sectionIndex, section) in self.data.enumerate() {
            for (rowIndex, row) in section.rows.enumerate() {
                if let analyze = row.analyze {
                    let cell = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: rowIndex, inSection: sectionIndex))
                    if analyze(cell) == false {
                        return false
                    }
                }
            }
        }
        return true
    }
    
    
    public func populate() {
        self.data = [SHMenuViewSection]()
    }
    
    func prepareData( doneCb: ( (ok: Bool, error: NSError?) -> () ) ) {
        doneCb(ok: true, error: nil)
    }
    

    override public func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.populate()
    }
    override public func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.data.count
    }
    override public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].rows.count
    }
    override public func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.data[section].header
    }
    override public func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return self.data[section].footer
    }
    override public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let row = data[indexPath.section].rows[indexPath.row]
        return row.cell(self.tableView)
        
    }
    override public func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        let row = data[indexPath.section].rows[indexPath.row]
        if let action = row.action {
            action(indexPath)
            
            if row.automaticallyDeselectSelectedRow {
                tableView.deselectRowAtIndexPath(indexPath, animated: true)
            }
        }
        
    }
    override public func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let row = data[indexPath.section].rows[indexPath.row]
        return row.preferredHeight
    }
    override public func tableView(tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        
        if let view = view as? UITableViewHeaderFooterView {
            let section = self.data[section]
            view.textLabel?.textAlignment = section.footerTextAlignment ?? .Left
        }
        
    }
    
    
}