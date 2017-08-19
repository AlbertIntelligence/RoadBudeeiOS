//
//  RoadBudeeMapViewController.swift
//  RoadBudee
//
//  Created by CodeKL on 2017-08-18.
//  Copyright © 2017 CodeKL. All rights reserved.
//

import UIKit
import MapKit
import JTMaterialTransition

class RoadBudeeMapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var roadBudeeMap: MKMapView!
    private  var locationManager = CLLocationManager();
    private  var userLocation: CLLocationCoordinate2D?;
    private  var otherBudeeLocation: CLLocationCoordinate2D?;
    
    var transition: JTMaterialTransition?
    
    
    @IBOutlet weak var contactButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initilizeLocationManager();
        
        createPresentControllerButton()
        self.transition = JTMaterialTransition(animatedView: self.contactButton!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func initilizeLocationManager(){
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        locationManager.requestWhenInUseAuthorization();
        locationManager.startUpdatingLocation();
    
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locationManager.location?.coordinate {
        
            userLocation = CLLocationCoordinate2DMake(location.latitude, location.longitude);
            let region = MKCoordinateRegionMake(userLocation!, MKCoordinateSpanMake(0.01, 0.01))
            
            roadBudeeMap.setRegion(region, animated: true);
            
            roadBudeeMap.removeAnnotations(roadBudeeMap.annotations);
            
            if otherBudeeLocation != nil{
                let otherBudeeAnnotation = MKPointAnnotation();
                otherBudeeAnnotation.coordinate = otherBudeeLocation!;
                otherBudeeAnnotation.title = "Other Budee";
                roadBudeeMap.addAnnotation(otherBudeeAnnotation);
            }
            
            let annotation = MKPointAnnotation();
            annotation.coordinate =  userLocation!;
            annotation.title = "OtherBudeee";
            roadBudeeMap.addAnnotation(annotation);
            
        }
    }
    
    func createPresentControllerButton () {
        
        let y: CGFloat = 600
        let width: CGFloat = 50
        let height: CGFloat = width
        let x: CGFloat = (self.view.frame.width - width) / 2.0
        
        let presentControllerButton = UIButton(frame: CGRect(x: x, y: y, width: width, height: height))
        presentControllerButton.layer.cornerRadius = width / 2.0
        presentControllerButton.backgroundColor = UIColor(red: 0xFF, green: 0x95, blue: 0x00)
        
        presentControllerButton.setImage(UIImage(named: "plus"), for: .normal)
        presentControllerButton.addTarget(self, action: #selector(didPresentControllerButtonTouch), for: .touchUpInside)
        
        
        self.view.addSubview(presentControllerButton)
        self.contactButton = presentControllerButton
    }
    
    func didPresentControllerButtonTouch () {
        let controller = ContactViewController()
        
        controller.modalPresentationStyle = .custom
        controller.transitioningDelegate = self.transition
        
        self.present(controller, animated: true, completion: nil)
    }
    
  
    
    


}
