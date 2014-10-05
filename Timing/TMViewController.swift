//
//  TMViewController.swift
//  Timing
//
//  Created by Rflpz on 05/10/14.
//  Copyright (c) 2014 Rflpz. All rights reserved.
//

import UIKit

class TMViewController: UIViewController,UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    var tableViewData = ["ActOne","ActTwo","ActThree"]
    override func viewDidLoad() {
        super.viewDidLoad()
        println("View was load")
    }
    func tableView(tableView: UITableView!, numberOfRowsInSection section:    Int) -> Int {
        return tableViewData.count
    }
    
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")!
        cell.textLabel?.text = tableViewData[indexPath.row]
        cell.detailTextLabel?.text = String(indexPath.row)
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        return cell
    }
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        println("Cell " + String(indexPath.row) + " touched")
    }
}
