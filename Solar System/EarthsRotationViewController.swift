//
//  EarthsRotationViewController.swift
//  Solar System
//
//  Created by Mostafa Mohamed on 12/29/18.
//  Copyright © 2018 Mostafa Mohamed. All rights reserved.
//

import UIKit
import ARKit
import SceneKit

class EarthsRotationViewController: UIViewController {

    @IBOutlet weak var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView.automaticallyUpdatesLighting = true
        sceneView.showsStatistics = true
        let scene = SCNScene()
        
        // Earth Node
        let earthNode = SCNNode(geometry: SCNSphere(radius: 0.25))
        earthNode.geometry?.firstMaterial!.diffuse.contents = UIImage(named: "earth")
        earthNode.position = SCNVector3Make(0, -0.1, -1)
       rotate(with: earthNode)
        // Text Node
        let txtNode = SCNNode(geometry: SCNText(string: "Earth", extrusionDepth: 1))
        txtNode.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "wood")
        txtNode.position = SCNVector3Make(-0.03, 0, -1)
        
        scene.rootNode.addChildNode(txtNode)
        scene.rootNode.addChildNode(earthNode)
        self.sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let config = ARWorldTrackingConfiguration()
        sceneView.session.run(config)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneView.session.pause()
    }
    
    
    func rotate(with node: SCNNode) {
        let rotation = SCNAction.rotateBy(x: 0, y: CGFloat(Float.pi), z: 0, duration: 10)
        node.runAction(SCNAction.repeatForever(rotation))
    }

}

extension EarthsRotationViewController: ARSCNViewDelegate {
    
}
