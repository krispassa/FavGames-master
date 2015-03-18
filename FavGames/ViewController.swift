//
//  ViewController.swift
//  FavGames
//
//  Created by krsna on 3/8/15.
//  Copyright (c) 2015 krsna. All rights reserved.
//

import UIKit
import Foundation
class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate{

    @IBOutlet var tableView: UITableView!
    var data: NSArray = []
    var refreshControl = UIRefreshControl()
    override func viewDidLoad() {
        super.viewDidLoad()
        data = dataOfJson("http://passa.byethost7.com/g.php")
        self.refreshControl.addTarget(self, action: "Refresh", forControlEvents:UIControlEvents.ValueChanged)
        self.tableView.addSubview(refreshControl)
        
    }
    func Refresh()
    {
        self.viewDidLoad()
        self.tableView.reloadData()
        self.refreshControl.endRefreshing()
        
    }
   
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    func dataOfJson(url: String) -> NSArray {
        var data = NSData(contentsOfURL: NSURL(string: url)!)
        return (NSJSONSerialization.JSONObjectWithData(data!, options: nil, error: nil) as NSArray)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: AdditionalCell = self.tableView.dequeueReusableCellWithIdentifier("customCell") as AdditionalCell
        var maindata = (data[indexPath.row] as NSDictionary)
        cell.gameName!.text = (maindata["Game"] as String)
        cell.gamePlat!.text = (maindata["Platform"]as String)
        
        return cell
    }
    

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    
        let d = (data[indexPath.row] as NSDictionary)
        var detailviewcontroller :DetailViewController = self.storyboard?.instantiateViewControllerWithIdentifier("DetailViewController")as DetailViewController
            detailviewcontroller.Detail = (d["detailView"]as String)
        
        
        self.presentViewController(detailviewcontroller, animated: true, completion: nil)
        
    }


}

