//
//  IntroViewController.swift
//  Week2Carousel
//
//  Created by Justin Peng on 2/7/16.
//  Copyright © 2016 Justin Peng. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var introScrollView: UIScrollView!
    @IBOutlet weak var introImageView: UIImageView!
    @IBOutlet weak var introTile1: UIImageView!
    @IBOutlet weak var introTile2: UIImageView!
    @IBOutlet weak var introTile3: UIImageView!
    @IBOutlet weak var introTile4: UIImageView!
    @IBOutlet weak var introTile5: UIImageView!
    @IBOutlet weak var introTile6: UIImageView!
    
    let introScrollMin = CGFloat(-20)
    let introScrollMax = CGFloat(562)
    
    func tileTransform(tile_id:UIView, x:Float, y:Float, scale:Float, rotate:Double) {
        tile_id.transform = CGAffineTransformTranslate(tile_id.transform, CGFloat(x), CGFloat(y))
        tile_id.transform = CGAffineTransformScale(tile_id.transform, CGFloat(scale), CGFloat(scale))
        tile_id.transform = CGAffineTransformRotate(tile_id.transform, CGFloat(rotate * M_PI / 180))

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        introScrollView.contentSize = introImageView.image!.size
        introScrollView.delegate = self
        
        tileTransform(introTile1, x: -40, y: -290, scale: 1.1, rotate: -20)
        tileTransform(introTile2, x: 55, y: -260, scale: 1.7, rotate: -18)
        tileTransform(introTile3, x: 36, y: -445, scale: 1.6, rotate: 18)
        tileTransform(introTile4, x: 95, y: -428, scale: 1.8, rotate: 16)
        tileTransform(introTile5, x: -120, y: -530, scale: 1.9, rotate: -15)
        tileTransform(introTile6, x: -65, y: -530, scale: 1.7, rotate: 15)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func scrollViewDidScroll(introScrollView: UIScrollView) {
        let introScrollViewPosition = CGFloat(introScrollView.contentOffset.y)
        func scrollTileTransform(tile_id: UIView, start_x: CGFloat, end_x: CGFloat, start_y: CGFloat, end_y: CGFloat, start_scale: CGFloat, end_scale: CGFloat, start_rotation: CGFloat, end_rotation: CGFloat) {
            var tile_scroll_x = convertValue(introScrollViewPosition, r1Min: introScrollMin, r1Max: introScrollMax, r2Min: start_x, r2Max: end_x)
            var tile_scroll_y = convertValue(introScrollViewPosition, r1Min: introScrollMin, r1Max: introScrollMax, r2Min: start_y, r2Max: end_y)
            var tile_scroll_scale = convertValue(introScrollViewPosition, r1Min: introScrollMin, r1Max: introScrollMax, r2Min: start_scale, r2Max: end_scale)
            var tile_rotation_scale = convertValue(introScrollViewPosition, r1Min: introScrollMin, r1Max: introScrollMax, r2Min: start_rotation, r2Max: end_rotation)
            tile_id.transform = CGAffineTransformMakeTranslation(CGFloat(tile_scroll_x), CGFloat(tile_scroll_y))
            tile_id.transform = CGAffineTransformScale(tile_id.transform, CGFloat(tile_scroll_scale), CGFloat(tile_scroll_scale))
            tile_id.transform = CGAffineTransformRotate(tile_id.transform, CGFloat(Double(tile_rotation_scale) * M_PI / 180))
        }
        if introScrollViewPosition >= 568 {
            introTile1.transform = CGAffineTransformIdentity
            introTile2.transform = CGAffineTransformIdentity
            introTile3.transform = CGAffineTransformIdentity
            introTile4.transform = CGAffineTransformIdentity
            introTile5.transform = CGAffineTransformIdentity
            introTile6.transform = CGAffineTransformIdentity
        } else {
        scrollTileTransform(introTile1, start_x: -40, end_x: 0, start_y: -290, end_y: 0, start_scale: 1.1, end_scale: 1, start_rotation: -20, end_rotation: 0)
        scrollTileTransform(introTile2, start_x: 55, end_x: 0, start_y: -260, end_y: 0, start_scale: 1.7, end_scale: 1, start_rotation: -18, end_rotation: 0)
        scrollTileTransform(introTile3, start_x: 36, end_x: 0, start_y: -445, end_y: 0, start_scale: 1.6, end_scale: 1, start_rotation: 15, end_rotation: 0)
        scrollTileTransform(introTile4, start_x: 95, end_x: 0, start_y: -428, end_y: 0, start_scale: 1.8, end_scale: 1, start_rotation: 16, end_rotation: 0)
        scrollTileTransform(introTile5, start_x: -120, end_x: 0, start_y: -530, end_y: 0, start_scale: 1.9, end_scale: 1, start_rotation: 15, end_rotation: 0)
        scrollTileTransform(introTile6, start_x: -65, end_x: 0, start_y: -530, end_y: 0, start_scale: 1.7, end_scale: 1, start_rotation: -15, end_rotation: 0)

        }
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
