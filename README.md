# SHMenu
Implement dynamic table view controllers easily.


## Installation
<b>Coming...</b>

Available via CocoaPods. Add to your Podfile and run <code>pod install</code>. 
```
pod 'SHMenu'
```

## Usage

### SHMenuViewController
Create a new subclass of <code>SHMenuViewController</code>. At minimum implement <code>func populate()</code>

```swift

import SHMenu
func MyDynamicTableViewController: SHMenuViewController {

  override func populate() {
    super.populate() //Don't forget to call super.populate()!

    let helper = SHMenuCellHelper(tableView: self.tableView)

    var rows = [SHMenuRow]()

    rows.append(SHMenuRow(cell: { (tableView) -> (UITableViewCell) in

      return helper.defaultCellWithTitle("It works!")

    }))

    let section = SHMenuSection(rows: rows)
    self.sections.append(section)
  }

}

```


## Contact
- Twitter: [@mikkokut](https://twitter.com/mikkokut)
- Email: [mikko93@gmail.com](mailto:mikko93@gmail.com)

## License
MIT
