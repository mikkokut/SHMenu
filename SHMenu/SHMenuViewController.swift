//
//  SHMenuViewController.h
//  SHMenuViewController
//
//  Created by Mikko Kutilainen on 5.12.2015.
//  Copyright © 2015 Shingle Oy. All rights reserved.
//


import Foundation
import UIKit





class SHMenuViewController: UITableViewController {
    
    var data = [SHMenuViewSection]()

    
    /**
    Override in order to respond to refresh event.
    Call self.endRefresh() after refreshing is finished.
    Please make sure you populate and reload your table view yourself.
    */
    func shouldRefresh() {
        self.endRefresh()
    }
    
    
    /**
    Call after refreshing is finished
    */
    func endRefresh() {
        self.refreshControl?.endRefreshing()
    }
    
    
    
    
    
    
    
    
    
    
    func analyzeCells() -> Bool {
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
    
    
    func prepareData( doneCb: ( (ok: Bool, error: NSError?) -> () ) ) {
        doneCb(ok: true, error: nil)
    }
    
    func populate() {
        self.data = [SHMenuViewSection]()
    }
    

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.populate()
    }
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.data.count
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].rows.count
    }
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.data[section].header
    }
    override func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return self.data[section].footer
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let row = data[indexPath.section].rows[indexPath.row]
        return row.cell(self.tableView)
        
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        let row = data[indexPath.section].rows[indexPath.row]
        if let action = row.action {
            action(indexPath)
            
            if row.automaticallyDeselectSelectedRow {
                tableView.deselectRowAtIndexPath(indexPath, animated: true)
            }
        }
        
    }
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let row = data[indexPath.section].rows[indexPath.row]
        return row.preferredHeight
    }
    override func tableView(tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        
        if let view = view as? UITableViewHeaderFooterView {
            let section = self.data[section]
            view.textLabel?.textAlignment = section.footerTextAlignment ?? .Left
        }
        
    }
    
    
}