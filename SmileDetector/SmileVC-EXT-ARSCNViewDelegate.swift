//
//  SmileVC-EXT-ARSCNViewDelegate.swift
//  SmileDetector
//
//  Created by Saul Alberto Cortez Garcia on 1/31/19.
//  Copyright © 2019 SaulCortez. All rights reserved.
//

import UIKit
import ARKit

extension SmileVC: ARSCNViewDelegate {
    
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
    
        guard let faceAnchor = anchor as? ARFaceAnchor else { return }
        
        let leftSmileValue  = faceAnchor.blendShapes[.mouthSmileLeft] as! CGFloat
        let rightSmileValue = faceAnchor.blendShapes[.mouthSmileRight] as! CGFloat
        let finalSmileValue = (leftSmileValue + rightSmileValue) / 2
        
        self.setSmile(finalSmileValue)
    }
}
