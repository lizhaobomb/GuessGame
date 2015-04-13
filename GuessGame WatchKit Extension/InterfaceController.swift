//
//  InterfaceController.swift
//  GuessGame WatchKit Extension
//
//  Created by lizhao on 15/4/13.
//  Copyright (c) 2015年 lizhao. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var guessImge: WKInterfaceImage!
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
                dispatch_get_main_queue(), closure)
    }
    
    @IBAction func changeGuessImg() {
        self.guessImge.setImageNamed("action");
        self.guessImge.startAnimatingWithImagesInRange(NSRange(location: 0, length: 3), duration: 0.6, repeatCount: 3)
        
        delay(0.9, closure: { () -> () in
            var randomGuess = arc4random_uniform(3)
            var imageName = "action\(randomGuess)"
            self.guessImge.setImageNamed(imageName)
        })
        
    }
    

}
