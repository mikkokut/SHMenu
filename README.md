# SHMenu
Implement dynamic table view controllers easily.


## Installation
Available via CocoaPods. Add to your Podfile and run <code>pod install</code>.
```
pod 'SHMenu'
```

## Usage

### Extend SHMenuViewController
Create new subclass of <code>SHMenuViewController</code>. At minumum implement <code>func populate()</code>

```swift

import SHMenu
func MyDynamicTableViewController: SHMenuViewController {

  override func populate() {
    super.populate() //Don't forget to call super.populate()!

    var rows = [SHMenuViewRow]()

    rows.append(SHMenuViewRow(cell: { (tableView) -> (UITableViewCell) in

      var cell = tableView.dequeueReusableCellWithIdentifier("Cell")
      if cell == nil {
          cell = UITableViewCell(style: .Default, reuseIdentifier: "Cell")
      }
      cell!.textLabel!.text = "It works!"
      return cell!

    }))

    let section = SHMenuViewSection(rows: rows)
    self.data.append(section)
  }

}

```


## Contact
- Twitter: [@mikkokut](https://twitter.com/mikkokut)
- Email: [mikko93@gmail.com](mailto:mikko93@gmail.com)

## License
MIT
