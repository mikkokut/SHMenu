//
//  SHMenuViewController.h
//  SHMenuViewController
//
//  Created by Mikko Kutilainen on 5.12.2015.
//  Copyright © 2015 Shingle Oy. All rights reserved.
//


import Foundation
import UIKit





open class SHMenuViewController: UITableViewController {
    
    open var sections = [SHMenuSection]()

    
    /**
    Override in order to respond to refresh event.
    Call self.endRefresh() after refreshing is finished.
    Please make sure you populate and reload your table view yourself.
    */
    open func shouldRefresh() {
        self.endRefresh()
    }
    
    
    /**
    Call after refreshing is finished
    */
    open func endRefresh() {
        self.refreshControl?.endRefreshing()
    }
    
    
    
    
    
    
    
    
    
    
    open func analyzeCells() -> Bool {
        for (sectionIndex, section) in self.sections.enumerated() {
            for (rowIndex, row) in section.rows.enumerated() {
                if let analyze = row.analyze {
                    let cell = tableView.cellForRow(at: IndexPath(row: rowIndex, section: sectionIndex))
                    if analyze(cell) == false {
                        return false
                    }
                }
            }
        }
        return true
    }
    
    
    open func populate() {
        self.sections = [SHMenuSection]()
    }
    
    func prepareData( _ doneCb: ( (_ ok: Bool, _ error: NSError?) -> () ) ) {
        doneCb(true, nil)
    }
    

    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.populate()
    }
    override open func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }
    override open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sections[section].rows.count
    }
    override open func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sections[section].header
    }
    override open func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return self.sections[section].footer
    }
    override open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let row = self.sections[(indexPath as NSIndexPath).section].rows[(indexPath as NSIndexPath).row]
        return row.cell(self.tableView)
        
    }
    override open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let row = self.sections[(indexPath as NSIndexPath).section].rows[(indexPath as NSIndexPath).row]
        if let action = row.action {
            action(indexPath)
            
            if row.automaticallyDeselectSelectedRow {
                tableView.deselectRow(at: indexPath, animated: true)
            }
        }
        
    }
    override open func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let row = self.sections[(indexPath as NSIndexPath).section].rows[(indexPath as NSIndexPath).row]
        if let action = row.accessoryAction {
            action(indexPath)
        }
    }
    override open func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let row = self.sections[(indexPath as NSIndexPath).section].rows[(indexPath as NSIndexPath).row]
        return row.preferredHeight
    }
    override open func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        
        if let view = view as? UITableViewHeaderFooterView {
            let section = self.sections[section]
            view.textLabel?.textAlignment = section.footerTextAlignment ?? .left
        }
        
    }
    
    
}
