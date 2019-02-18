//
//  ViewController.swift
//  SwiftAnimations2
//
//  Created by Naattudurai Eswaramurthy on 18/02/19.
//  Copyright © 2019 Naattudurai Eswaramurthy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var messageLabel : UILabel = {
        let displayLabel = UILabel()
        displayLabel.textAlignment = .center
        displayLabel.font = UIFont.boldSystemFont(ofSize: 18)
        displayLabel.text = "1234"
        displayLabel.textColor = .red
        return displayLabel
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.addSubview(messageLabel)
        messageLabel.frame = view.frame
        
        let displayLink = CADisplayLink(target: self, selector: #selector(handleDisplay))
        displayLink.add(to: .main, forMode: .defaultRunLoopMode)
    }
    
    //variable
    var startValue: Double  = 0
    var endValue : Double = 1000
    let animationDuration = 1.5
    let animationStartDate =  Date()
    
    @objc func handleDisplay()
    {
        let now = Date()
        let elapsedTime = now.timeIntervalSince(animationStartDate)
        
        
        if elapsedTime  > animationDuration
        {
            self.messageLabel.text = "\(endValue)"
        }
        else
        {
            let percentage = elapsedTime / animationDuration;
            let value =  abs(Int32(startValue + percentage * (endValue - startValue)))
            self.messageLabel.text = "\(value)"
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

