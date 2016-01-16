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
  @IBOutlet weak var currentMonth: UILabel!
  @IBOutlet weak var imageView: UIImageView!
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  @IBAction func sliderUpdated(sender: AnyObject) {
    let slider = sender as! UISlider
    currentMonth.text = "\(Int(slider.value))"
  }
  
  @IBAction func close(segue:UIStoryboardSegue) {
    
  }
    
    @IBAction func goTapped(sender:AnyObject) {
      performSegueWithIdentifier("GoToWallpaper", sender: sender)
    }
  
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
      if segue.identifier == "GoToWallpaper" {
        let paperViewController = segue.destinationViewController as! PaperViewController
        paperViewController.monthToShow = Int(currentMonth.text!)!
      }
    }

}

