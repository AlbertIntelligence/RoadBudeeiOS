//
//  BudeesHandler.swift
//  RoadBudee
//
//  Created by CodeKL on 2017-08-18.
//  Copyright © 2017 CodeKL. All rights reserved.
//

import Foundation
import Firebase


protocol BudeesController: class{
   // func updateBudeesLocation(lat:Double,long Double);

}

class BudeesHandler{
    
   
    
    private static let _instance = BudeesHandler();
    
    static var Instance: BudeesHandler {
        return _instance;
    }
    
    
    func observeOtherBudeesLocation(){
        
    }


}
