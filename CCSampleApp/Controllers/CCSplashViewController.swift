//
//  CCSplashViewController.swift
//  CCSampleApp
//
//  Created by Vishal Chandran on 22/09/16.
//  Copyright © 2016 Vishal Chandran. All rights reserved.
//

// ******************************************** //
//                                              //
//       Name: CCSplashViewController           //
//                                              //
//    Purpose: Home Page when user opens app    //
//             User can start Survey            //
//                                              //
// ******************************************** //

// Enter your CloudCherry Username and Password

var _USERNAME = "rohith"
var _PASSWORD = "Test@123"

import UIKit


class CCSplashViewController: UIViewController {
    
    
    // MARK: - Variables
    
    
    var isDynamic = true
    
    
    // MARK: - Outlets
    
    
    var statusLabel = UILabel()
    var tappedButton = UIButton()
    
    
    // MARK: - View Life Cycle Methods
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        // Hiding Navigation Bar
        
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        
        // Setting View Background
        
        
        let aBackgroundImageView = UIImageView(frame: UIScreen.mainScreen().bounds)
        aBackgroundImageView.image = UIImage(named: "HomeScreenBG")
        
        self.view.insertSubview(aBackgroundImageView, atIndex: 0)
        
        
        // Adding Top White Line
        
        
        let aWhiteLine = UIView(frame: CGRect(x: 50, y: 50, width: self.view.frame.width - 100, height: 1))
        aWhiteLine.backgroundColor = UIColor.whiteColor()
        
        self.view.addSubview(aWhiteLine)
        
        
//        // Adding Option Buttons for Static/Dynamic Initalizaiton
//        
//        
//        let aStaticButton = UIButton(type: .Custom)
//        aStaticButton.frame = CGRect(x: 10, y: CGRectGetMaxY(aWhiteLine.frame) + 20, width: 100, height: 50)
//        aStaticButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
//        aStaticButton.setTitle("STATIC", forState: .Normal)
//        aStaticButton.tag = 1
//        aStaticButton.layer.borderColor = UIColor.whiteColor().CGColor
//        aStaticButton.layer.borderWidth = 1.0
//        aStaticButton.addTarget(self, action: #selector(CCSplashViewController.statusButtonToggle(_:)), forControlEvents: .TouchUpInside)
//        
//        self.view.addSubview(aStaticButton)
//        
//        
//        let aDynamicButton = UIButton(type: .Custom)
//        aDynamicButton.frame = CGRect(x: self.view.frame.width - 105, y: CGRectGetMaxY(aWhiteLine.frame) + 20, width: 100, height: 50)
//        aDynamicButton.setTitleColor(UIColor.redColor(), forState: .Normal)
//        aDynamicButton.backgroundColor = UIColor.whiteColor()
//        aDynamicButton.setTitle("DYNAMIC", forState: .Normal)
//        aDynamicButton.tag = 2
//        aDynamicButton.layer.borderColor = UIColor.whiteColor().CGColor
//        aDynamicButton.layer.borderWidth = 1.0
//        aDynamicButton.addTarget(self, action: #selector(CCSplashViewController.statusButtonToggle(_:)), forControlEvents: .TouchUpInside)
//        
//        tappedButton = aDynamicButton
//        
//        self.view.addSubview(aDynamicButton)
//        
//        
//        // Setting Token Status Label
//        
//        
//        statusLabel = UILabel(frame: CGRect(x: 0, y: CGRectGetMaxY(aDynamicButton.frame) + 20, width: self.view.frame.width, height: 20))
//        statusLabel.textColor = UIColor.whiteColor()
//        statusLabel.text = "Using Dynamic Token"
//        statusLabel.textAlignment = .Center
//        
//        self.view.addSubview(statusLabel)
        
        
        // Adding Button To View To Start Survey
        
        
        let aSurveyButtonXAlign: CGFloat = (self.view.frame.size.width - 200) / 2
        let aSurveyButtonYAlign: CGFloat = (self.view.frame.size.height - 50) / 2
        
        let aSurveyStartButton = UIButton(type: .Custom)
        aSurveyStartButton.frame = CGRect(x: aSurveyButtonXAlign, y: aSurveyButtonYAlign, width: 200, height: 50)
        aSurveyStartButton.layer.borderColor = UIColor.whiteColor().CGColor
        aSurveyStartButton.layer.borderWidth = 1.0
        aSurveyStartButton.layer.cornerRadius = 25
        aSurveyStartButton.setTitle("START SURVEY", forState: .Normal)
        aSurveyStartButton.addTarget(self, action: #selector(CCSplashViewController.surveyStartButtonTapped), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(aSurveyStartButton)
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK:- Private Methods
    
    
    func surveyStartButtonTapped() {
        
        if (isDynamic) {
            
            let aSurvey = CCSurvey(iUsername: _USERNAME, iPassword: _PASSWORD)
            aSurvey.setPrefill("vishalchandran@gmail.com", iMobileNumber: "8095890684")
            aSurvey.setConfig(-1, iLocation: "mobile")
            self.navigationController?.pushViewController(aSurvey, animated: false)
            
        } else {
            
            let aSurvey = CCSurvey(iStaticToken: "ROHITH-50000")
            aSurvey.setPrefill("vishalchandran@gmail.com", iMobileNumber: "8095890684")
            aSurvey.setConfig(-1, iLocation: "mobile")
            self.navigationController?.pushViewController(aSurvey, animated: false)
            
        }
        
    }
    
    
    func statusButtonToggle(iButton: UIButton) {
        
        if let aTappedButton = self.view.viewWithTag(iButton.tag) as? UIButton {
            
            tappedButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            tappedButton.backgroundColor = UIColor.clearColor()
            tappedButton.layer.borderColor = UIColor.whiteColor().CGColor
            
            tappedButton = iButton
            
            aTappedButton.setTitleColor(UIColor.redColor(), forState: .Normal)
            aTappedButton.backgroundColor = UIColor.whiteColor()
            aTappedButton.layer.borderColor = UIColor.redColor().CGColor
            
            if (iButton.tag == 1) {
                
                statusLabel.text = "Using Static Token"
                
                isDynamic = false
                
            } else {
                
                statusLabel.text = "Using Dynamic Token"
                
                isDynamic = true
                
            }
            
        }
        
    }

}

