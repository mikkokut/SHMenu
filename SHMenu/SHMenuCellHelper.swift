//
//  SHMenuRowHelper.swift
//  Pods
//
//  Created by Mikko Kutilainen on 15.12.2015.
//
//

import UIKit



public enum SHMenuCellStyle: String {
    case defaultStyle = "SHMenu:Default"
    case value1 = "SHMenu:Value1"
    case value2 = "SHMenu:Value2"
    case subtitle = "SHMenu:Subtitle"
    case action = "SHMenu:Action"
    case destructiveAction = "SHMenu:DestructiveAction"
}


public class SHMenuCellHelper {
    
    let tableView: UITableView
    
    public init(tableView: UITableView) {
        self.tableView = tableView
    }
    
    
    public func defaultCellWithTitle(title: String?) -> UITableViewCell {
        let cell = self.cellForStyle(style: .defaultStyle)
        cell.textLabel?.text = title
        return cell
    }
    public func actionCellWithTitle(title: String?) -> UITableViewCell {
        let cell = self.cellForStyle(style: .action)
        cell.textLabel?.text = title
        return cell
    }
    public func destructiveActionCellWithTitle(title: String?) -> UITableViewCell {
        let cell = self.cellForStyle(style: .destructiveAction)
        cell.textLabel?.text = title
        return cell
    }
    public func value1CellWithTitle(title: String?, value: String?) -> UITableViewCell {
        let cell = self.cellForStyle(style: .value1)
        
        cell.textLabel?.text = title
        cell.detailTextLabel?.text = value
        
        return cell
    }
    public func value2CellWithTitle(title: String?, value: String?) -> UITableViewCell {
        let cell = self.cellForStyle(style: .value2)
        
        cell.textLabel?.text = title
        cell.detailTextLabel?.text = value
        
        return cell
    }
    public func subtitleCellWithTitle(title: String?, value: String?) -> UITableViewCell {
        let cell = self.cellForStyle(style: .subtitle)
        cell.textLabel?.text = title
        cell.detailTextLabel?.text = value
        return cell
    }
    
    public func cellForStyle(style: SHMenuCellStyle) -> UITableViewCell {
        
        var cell = self.tableView.dequeueReusableCell(withIdentifier: style.rawValue)
        if cell == nil {
            
            switch style {
            case .defaultStyle:
                cell = UITableViewCell(style: .default, reuseIdentifier: style.rawValue)
            case .subtitle:
                cell = UITableViewCell(style: .subtitle, reuseIdentifier: style.rawValue)
            case .value1:
                cell = UITableViewCell(style: .value1, reuseIdentifier: style.rawValue)
            case .value2:
                cell = UITableViewCell(style: .value2, reuseIdentifier: style.rawValue)
            case .action:
                cell = UITableViewCell(style: .default, reuseIdentifier: style.rawValue)
            case .destructiveAction:
                cell = UITableViewCell(style: .default, reuseIdentifier: style.rawValue)
            }
        }
        
        switch style {
        case .defaultStyle:
            break
        case .value1:
            break
        case .value2:
            break
        case .subtitle:
            break
        case .action:
            cell?.textLabel?.textAlignment = .center
        case .destructiveAction:
            cell?.textLabel?.textAlignment = .center
            cell?.textLabel?.textColor = UIColor.red
        }
        
        return cell!
    }
    
}
