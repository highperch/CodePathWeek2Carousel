//
//  TimelineViewController.swift
//  Week2Carousel
//
//  Created by Justin Peng on 2/8/16.
//  Copyright © 2016 Justin Peng. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController {

    @IBOutlet weak var timelineScrollView: UIScrollView!
    @IBOutlet weak var timelineImageView: UIImageView!
    @IBOutlet weak var tutorialBanner: UIImageView!
    @IBOutlet weak var tutorialButton: UIButton!
    @IBOutlet weak var tutorialBannerButton: UIButton!

    var full_screen_viewed:Bool!
    var time_wheel_used:Bool!
    var photo_shared:Bool!
    var tutorial_dismissed:Bool!
    
    var defaults = NSUserDefaults.standardUserDefaults()
    
    @IBAction func hideTutorial(sender: AnyObject) {
        defaults.setBool(true, forKey: "tutorial_dismiss")
        tutorial_dismissed = true
        print("tutorial hidden")
        timelineScrollView.frame.origin.y = 65
        timelineScrollView.frame.size.height = 467
    }
    
    @IBAction func openTutorial(sender: AnyObject) {
        performSegueWithIdentifier("tutorialSegue", sender: self)
    }
    
    func tutorialIsShown() {
        if full_screen_viewed == true && time_wheel_used == true && photo_shared == true || tutorial_dismissed == true {
            timelineScrollView.frame.origin.y = 65
            timelineScrollView.frame.size.height = 467
            tutorialBanner.hidden = true
            tutorialButton.hidden = true
            tutorialBannerButton.hidden = true
        }
        else {
            timelineScrollView.frame.origin.y = 130
            timelineScrollView.frame.size.height = 402
            tutorialBanner.hidden = false
            tutorialButton.hidden = false
            tutorialBannerButton.hidden = false
        }
    }
    
    override func viewWillAppear(animated:Bool) {
        var full_screen_viewed = defaults.boolForKey("full_screen")
        var time_wheel_used = defaults.boolForKey("time_wheel")
        var photo_shared = defaults.boolForKey("photo_share")
        var tutorial_dismissed = defaults.boolForKey("tutorial_dismiss")
//        tutorialIsShown()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timelineScrollView.contentSize = timelineImageView.image!.size
//        tutorialIsShown()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
