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
    
    
    // MARK: - View Life Cycle Methods
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        // Hiding Navigation Bar
        
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        
        // Setting View Background
        
        
        let aBackgroundImageView = UIImageView(frame: UIScreen.mainScreen().bounds)
        aBackgroundImageView.image = UIImage(named: "HomeScreenBG")
        
        self.view.insertSubview(aBackgroundImageView, atIndex: 0)
        
        
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
        
        let aSurvey = CCSurvey(iUsername: _USERNAME, iPassword: _PASSWORD)
        self.navigationController?.pushViewController(aSurvey, animated: false)
        
    }

}

