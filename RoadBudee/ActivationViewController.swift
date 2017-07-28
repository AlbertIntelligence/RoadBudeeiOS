//
//  ViewController.swift
//  RoadBudee
//
//  Created by CodeKL Lenz Petion on 2017-07-28.
//  Copyright © 2017 CodeKL. All rights reserved.
//

import UIKit
import SmileLock




class ActivationViewController: UIViewController {
    
    
    
    @IBOutlet weak var passwordStackView: UIStackView!
    
    
    //MARK: Property
    var passwordContainerView: PasswordContainerView!
    let kPasswordDigit = 6
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        //create PasswordContainerView
        passwordContainerView = PasswordContainerView.create(in: passwordStackView, digit: kPasswordDigit)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
   
    
}

