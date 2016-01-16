//
//  ViewController.swift
//  WallpaperDemo
//
//  Created by Brian Moakley on 11/20/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func close(segue:UIStoryboardSegue) {
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "GoToWallpaper" {
            let paperViewController = segue.destinationViewController as! PaperViewController
            if let indexPath = tableView.indexPathForSelectedRow {
                paperViewController.monthToShow = indexPath.row + 1
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return months.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("WallpaperCell", forIndexPath: indexPath)
        cell.textLabel?.text = months[indexPath.row]
        cell.imageView?.image = UIImage(named: String(format: "%02d.jpg", arguments: [indexPath.row + 1]))
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("GoToWallpaper", sender: nil)
    }
}