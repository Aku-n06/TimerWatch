//
//  InterfaceController.swift
//  TimerWatch WatchKit Extension
//
//  Created by Alberto Scampini on 14/03/15.
//  Copyright (c) 2015 Alberto Scampini. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var watchTimer: WKInterfaceTimer!
    @IBOutlet weak var startButton: WKInterfaceButton!

    //timer used to count
    var doneTimer: NSTimer?
    //starting number of seconds of the timer
    var duration: NSTimeInterval = 60.0 * 20.0 + 1
    //flag show the status of the timer
    var isTimerRunning : Bool = false
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        
        //setup the watch timer
        watchTimer.setDate(NSDate(timeIntervalSinceNow: duration))
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    
    @IBAction func startButtonPressed() {
        if (isTimerRunning == false) {
            println("start")
            
            //update status and interface
            isTimerRunning = true;
            startButton.setTitle("stop")
            
        
            //start the countdown
            watchTimer.start()
        
            //start the timer
            doneTimer = NSTimer.scheduledTimerWithTimeInterval(duration, target: self, selector:"timerFinished:", userInfo: nil, repeats: false)
        }
        else{
            println("stop")
            
            //update status and interface
            isTimerRunning = false;
            startButton.setTitle("start")
            
            //setup the watch timer
            watchTimer.setDate(NSDate(timeIntervalSinceNow: duration))
            
            //stop timers
            watchTimer.stop()
            doneTimer?.invalidate()
            
        }
        
        
    }
    
    func timerFinished(timer: NSTimer){
        println("done");
    }
    
}