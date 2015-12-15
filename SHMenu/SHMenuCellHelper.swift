//
//  SHMenuRowHelper.swift
//  Pods
//
//  Created by Mikko Kutilainen on 15.12.2015.
//
//

import UIKit



public enum SHMenuCellStyle: String {
    case Default = "SHMenu:Default"
    case Value1 = "SHMenu:Valu1"
    case Subtitle = "SHMenu:Subtitle"
    case Action = "SHMenu:Action"
    case DestructiveAction = "SHMenu:DestructiveAction"
}


public class SHMenuCellHelper {
    
    let tableView: UITableView
    
    public init(tableView: UITableView) {
        self.tableView = tableView
    }
    
    
    public func defaultCellWithTitle(title: String?) -> UITableViewCell {
        let cell = self.cellForStyle(.Default)
        cell.textLabel?.text = title
        return cell
    }
    public func actionCellWithTitle(title: String?) -> UITableViewCell {
        let cell = self.cellForStyle(.Action)
        cell.textLabel?.text = title
        return cell
    }
    public func destructiveActionCellWithTitle(title: String?) -> UITableViewCell {
        let cell = self.cellForStyle(.DestructiveAction)
        cell.textLabel?.text = title
        return cell
    }
    public func value1CellWithTitle(title: String?, value: String?) -> UITableViewCell {
        let cell = self.cellForStyle(.Value1)
        
        cell.textLabel?.text = title
        cell.detailTextLabel?.text = value
        
        return cell
    }
    public func subtitleCellWithTitle(title: String?, value: String?) -> UITableViewCell {
        let cell = self.cellForStyle(.Subtitle)
        cell.textLabel?.text = title
        cell.detailTextLabel?.text = value
        return cell
    }
    
    public func cellForStyle(style: SHMenuCellStyle) -> UITableViewCell {
        
        var cell = self.tableView.dequeueReusableCellWithIdentifier(style.rawValue)
        if cell == nil {
            
            switch style {
            case .Default:
                cell = UITableViewCell(style: .Default, reuseIdentifier: style.rawValue)
            case .Subtitle:
                cell = UITableViewCell(style: .Subtitle, reuseIdentifier: style.rawValue)
            case .Value1:
                cell = UITableViewCell(style: .Value1, reuseIdentifier: style.rawValue)
            case .Action:
                cell = UITableViewCell(style: .Default, reuseIdentifier: style.rawValue)
            case .DestructiveAction:
                cell = UITableViewCell(style: .Default, reuseIdentifier: style.rawValue)
            }
        }
        
        switch style {
        case .Default:
            break
        case .Value1:
            break
        case .Subtitle:
            break
        case .Action:
            cell?.textLabel?.textAlignment = .Center
        case .DestructiveAction:
            cell?.textLabel?.textAlignment = .Center
            cell?.textLabel?.textColor = UIColor.redColor()
        }
        
        return cell!
    }
    
}