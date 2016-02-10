//
//  CreateViewController.swift
//  Week2Carousel
//
//  Created by Justin Peng on 2/9/16.
//  Copyright © 2016 Justin Peng. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var createButtonParentView: UIView!
    @IBOutlet weak var createFieldParentView: UIView!
    @IBOutlet weak var agreeButton: UIButton!
    @IBOutlet weak var createScrollView: UIScrollView!
    
    var create_field_initialY: CGFloat!
    var create_field_offset: CGFloat!
    var create_button_initialY: CGFloat!
    var create_button_offset: CGFloat!
    
    @IBAction func didPressBack(sender: AnyObject) {
        navigationController?.popToRootViewControllerAnimated(true)
    }
    
    @IBAction func didPressAgree(sender: AnyObject) {
        if agreeButton.selected == false {
            agreeButton.selected = true
        }
        else {
            agreeButton.selected = false
        }
    }
    
    @IBAction func didPressCreate(sender: AnyObject) {
        if agreeButton.selected == false {
            let termsAlertController = UIAlertController(title: "Terms of Service", message: "Please agree to the terms of service before continuing", preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "OK", style: .Cancel) { (action) in
            }
            self.presentViewController(termsAlertController, animated: true) {
            }
            termsAlertController.addAction(okAction)
        }
        else {
            self.performSegueWithIdentifier("createSegue", sender: self)
        }
    }

    func scrollViewDidScroll(scrollView: UIScrollView) {
        if scrollView.contentOffset.y <= -50 {
            view.endEditing(true)
        }
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        createFieldParentView.frame.origin.y = create_field_initialY + create_field_offset
        createButtonParentView.frame.origin.y = create_button_initialY + create_button_offset
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        createFieldParentView.frame.origin.y = create_field_initialY
        createButtonParentView.frame.origin.y = create_button_initialY
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createScrollView.delegate = self
        createScrollView.contentSize = createScrollView.frame.size
        createScrollView.contentInset.bottom = 100
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        create_field_initialY = createFieldParentView.frame.origin.y
        create_field_offset = -63
        create_button_initialY = createButtonParentView.frame.origin.y
        create_button_offset = -221

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
