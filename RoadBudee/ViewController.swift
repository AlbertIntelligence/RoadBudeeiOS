//
//  ViewController.swift
//  RoadBudee
//
//  Created by CodeKL Lenz Petion on 2017-07-28.
//  Copyright © 2017 CodeKL. All rights reserved.
//

import UIKit
import SwiftVideoBackground



class ViewController: UIViewController {

    
    @IBOutlet weak var backgroundVideo : BackgroundVideo!
    //Url To buy RoadBudee
    let url = URL(string:Constants.WEBSITE_URL)!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backGroundVideoSetup()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func backGroundVideoSetup(){
        backgroundVideo.createBackgroundVideo(name: Constants.BACKGROUND_VIDEO, type: Constants.BACKGROUND_VIDEO_TYPE)
    }

    
    
    @IBAction func dontHaveOneButton(_ sender: Any) {
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }

    
    
}

