//
//  ViewController.swift
//  RoadBudee
//
//  Created by OfficeMobile on 2017-07-28.
//  Copyright © 2017 CodeKL. All rights reserved.
//

import UIKit
import SwiftVideoBackground


class ViewController: UIViewController {

    
    @IBOutlet weak var backgroundVideo : BackgroundVideo!
    //Url To buy RoadBudee
    let url = URL(string:"https://roadbudee.com/en/shop/appareil-roadbudee/")!
    var video = "montreal" //name of the video later on will fetch from server
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backGroundVideoSetup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func backGroundVideoSetup(){
        backgroundVideo.createBackgroundVideo(name: video, type: "mp4")
    }

    
    
    @IBAction func dontHaveOneButton(_ sender: Any) {
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }

}

