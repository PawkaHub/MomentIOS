//
//  Moments.swift
//  
//
//  Created by Pieter Parker on 2015-02-07.
//
//

import UIKit

class Moments:UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let cellIdentifier = "cellIdentifier"
    var tableData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("MOMENTS VIEW LOADED")
        self.view.backgroundColor = UIColor.blueColor()
        
        //Create the momentsTable
        let momentsTable:UITableView = UITableView(frame: CGRectMake(0, 0, self.view.frame.width, self.view.frame.height))
        
        //momentsTable Customization
        momentsTable.autoresizingMask = UIViewAutoresizing.FlexibleTopMargin | UIViewAutoresizing.FlexibleBottomMargin | UIViewAutoresizing.FlexibleRightMargin | UIViewAutoresizing.FlexibleLeftMargin
        momentsTable.pagingEnabled = true
        momentsTable.dataSource = self
        momentsTable.delegate = self
        momentsTable.backgroundColor = UIColor.greenColor()
        
        //Register the UITableViewCell class with the tableView
        momentsTable.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        
        //Add the table
        self.view.addSubview(momentsTable)
        
        
        //Setup table data
        for index in 0...100 {
            tableData.append("Item \(index)")
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        println("Moments Controller received memory warning!")
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    // UITableView Datasource Functions
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //let cell = UITableViewCell()
        //let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        //label.text = "Hello There"
        //cell.addSubview(label)
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as UITableViewCell
        cell.textLabel?.text = tableData[indexPath.row]
        
        //Add a player
        
        
        return cell
    }
    
    // UITableViewDelegate Functions
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return self.view.frame.height
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let alert = UIAlertController(title: "Item Selected", message: "You selected item \(indexPath.row)", preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: {
            (alert: UIAlertAction!) in println("An alert of type \(alert.style.hashValue) was tapped!")
        }))
        
        self.presentViewController(alert, animated: true, completion: nil)
    }

}
