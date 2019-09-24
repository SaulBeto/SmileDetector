//
//  SmileVC.swift
//  SmileDetector
//
//  Created by Saul Alberto Cortez Garcia on 1/31/19.
//  Copyright © 2019 SaulCortez. All rights reserved.
//


import UIKit
import ARKit

class SmileVC: UIViewController {
    
    //MARK: - VARIABLES
    let ARView = ARSCNView()
    
    // MARK: IBOUTLETS
    @IBOutlet weak var imSmile: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard ARFaceTrackingConfiguration.isSupported else {
            fatalError("ARKit is not supported on this device")
        }
        
        AVCaptureDevice.requestAccess(for: AVMediaType.video) { granted in
            
            if granted {
                self.setupARFace()
            } else {
                fatalError("Not permission to camera access")
            }
        }
    }
    
    // MARK: - FUNCTIONS
    
    func setupARFace() {

        let configuration = ARFaceTrackingConfiguration()
        configuration.isLightEstimationEnabled = true
        
        ARView.session.run(configuration)
        ARView.delegate = self
        
        DispatchQueue.main.async {
            self.imSmile.image = UIImage(named: "meh")
            self.view.addSubview(self.ARView)
        }
    }
    
    
    func setSmile(_ smileResult: CGFloat) {
         DispatchQueue.main.async {
            self.imSmile.image = smileResult > 0.7 ?  UIImage(named: "happy") : (smileResult > 0.2 ?  UIImage(named: "happiness") :  UIImage(named: "meh"))
        }
    }
    
}



