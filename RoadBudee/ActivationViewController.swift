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

    @IBOutlet weak var orderRoadBudeeMessage: UIButton!
    @IBOutlet weak var passwordStackView: UIStackView!
    var passwordContainerView: PasswordContainerView!
    let viewControllerObject = ViewController()
    let kPasswordDigit = 8
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pinCodeViewSetup()
        bottomButtonSetup()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func pinCodeViewSetup(){
        passwordContainerView = PasswordContainerView.create(in: passwordStackView, digit: kPasswordDigit)
        passwordContainerView.delegate = self
        passwordContainerView.highlightedColor =  UIColor(red: 0xFF, green: 0x95, blue: 0x00)
    }
    
    func bottomButtonSetup(){
        orderRoadBudeeMessage.isHidden = true
        orderRoadBudeeMessage.titleLabel?.textAlignment = NSTextAlignment.center
        orderRoadBudeeMessage?.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping;
    }
    
    @IBAction func orderRoadBudeeMessage(_ sender: Any) {
        UIApplication.shared.open(viewControllerObject.url, options: [:], completionHandler: nil)
    }
    
}

extension ActivationViewController: PasswordInputCompleteProtocol {
    func passwordInputComplete(_ passwordContainerView: PasswordContainerView, input: String) {
        if validation(input) {
            validationSuccess()
        } else {
            validationSuccess()
        }
    }
    
    func touchAuthenticationComplete(_ passwordContainerView: PasswordContainerView, success: Bool, error: Error?) {
        if success {
            self.validationSuccess()
        } else {
            passwordContainerView.clearInput()
        }
    }
}

private extension ActivationViewController {
    func validation(_ input: String) -> Bool {
        return input == "12345678"
    }
    
    func validationSuccess() {
        orderRoadBudeeMessage.isHidden = false
    }
    
    func validationFail() {
        passwordContainerView.wrongPassword()
    }
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}


