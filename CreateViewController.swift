//
//  CreateViewController.swift
//  Week2Carousel
//
//  Created by Justin Peng on 2/9/16.
//  Copyright © 2016 Justin Peng. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController {

    @IBOutlet weak var createButtonParentView: UIView!
    @IBOutlet weak var createFieldParentView: UIView!
    
    var initialY: CGFloat!
    var offset: CGFloat!
    
    @IBAction func didPressBack(sender: AnyObject) {
        navigationController?.popToRootViewControllerAnimated(true)
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        createFieldParentView.frame.origin.y = initialY + offset

    }
    
    func keyboardWillHide(notification: NSNotification!) {
        createFieldParentView.frame.origin.y = initialY

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        initialY = createFieldParentView.frame.origin.y
        offset = -50

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
