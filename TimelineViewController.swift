//
//  TimelineViewController.swift
//  Week2Carousel
//
//  Created by Justin Peng on 2/8/16.
//  Copyright © 2016 Justin Peng. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var timelineScrollView: UIScrollView!
    @IBOutlet weak var timelineImageView: UIImageView!
    @IBOutlet weak var tutorialBanner: UIImageView!
    @IBOutlet weak var tutorialButton: UIButton!
    @IBOutlet weak var tutorialBannerButton: UIButton!
    @IBOutlet weak var scrubberScrollView: UIScrollView!
    @IBOutlet weak var scrubberImageView: UIImageView!

    var full_screen_viewed:Bool!
    var time_wheel_used:Bool!
    var photo_shared:Bool!
    var tutorial_dismissed:Bool!
    
    var defaults = NSUserDefaults.standardUserDefaults()
    
    @IBAction func hideTutorial(sender: AnyObject) {
        defaults.setBool(true, forKey: "tutorial_dismiss")
        defaults.synchronize()
        UIView.animateWithDuration(0.4, animations: {
            self.hideTutorial()
        })
    }
    
    @IBAction func openTutorial(sender: AnyObject) {
        performSegueWithIdentifier("tutorialSegue", sender: self)
    }
    
    func hideTutorial() {
        timelineScrollView.frame.origin.y = 65
        timelineScrollView.frame.size.height = 467
        tutorialBanner.alpha = 0
        tutorialButton.alpha = 0
        tutorialBannerButton.alpha = 0
        tutorialButton.enabled = false
        tutorialBannerButton.enabled = false
    }
    
    func showTutorial() {
        timelineScrollView.frame.origin.y = 109
        timelineScrollView.frame.size.height = 459
        tutorialBanner.alpha = 1
        tutorialButton.alpha = 1
        tutorialBannerButton.alpha = 1
        tutorialButton.enabled = true
        tutorialBannerButton.enabled = true
    }
    
    func tutorialIsShown() {
        //Pulls the latest key stores for whether tutorial should be shown and decides whether to show it or not
        var full_screen_viewed = defaults.boolForKey("full_screen")
        var time_wheel_used = defaults.boolForKey("time_wheel")
        var photo_shared = defaults.boolForKey("photo_share")
        var tutorial_dismissed = defaults.boolForKey("tutorial_dismiss")
        if tutorial_dismissed == true  {
            hideTutorial()
        } else if full_screen_viewed == true && time_wheel_used == true && photo_shared == true {
            hideTutorial()
        }
        else {
            showTutorial()
        }
    }
    
    func scrollViewDidScroll(scrubberScrollView: UIScrollView) {
        defaults.setBool(true, forKey: "time_wheel")
        defaults.synchronize()
    }
    
    
    override func viewWillAppear(animated:Bool) {
        //check for state of tutorial actions after view is shown
        tutorialIsShown()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timelineScrollView.contentSize = timelineImageView.image!.size
        scrubberScrollView.contentSize = scrubberImageView.image!.size
        scrubberScrollView.delegate = self
        //set defaults for all tutorial related keys to false to show tutorial
        defaults.setBool(false, forKey: "tutorial_dismiss")
        defaults.setBool(false, forKey: "full_screen")
        defaults.setBool(false, forKey: "time_wheel")
        defaults.setBool(false, forKey: "photo_share")
        defaults.synchronize()
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
