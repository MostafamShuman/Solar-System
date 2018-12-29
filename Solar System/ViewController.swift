//
//  ViewController.swift
//  Solar System
//
//  Created by Mostafa Mohamed on 12/29/18.
//  Copyright © 2018 Mostafa Mohamed. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    var sunNode: SCNNode!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        let solarSystem = SCNScene()
        sunNode = getSun()
        solarSystem.rootNode.addChildNode(sunNode)
        planetsAssmpler()
        sceneView.scene = solarSystem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Pause the view's session
        sceneView.session.pause()
    }
    
    
    // MARK:- Planets Factory
    func planetsAssmpler() {
        getMercury()
        getVenus()
        getEarth()
        getMercury()
        getJupiter()
        getSaturn()
        getUranus()
        getNeptune()
        getPluto()
        
    }
    // MARK:- Planets
    func getSun() -> SCNNode {
        var sunNode = SCNNode()
        sunNode = SCNNode(geometry: SCNSphere(radius: 0.25))
        sunNode.position = SCNVector3Make(0, 0.1, -3)
        sunNode.geometry?.firstMaterial!.diffuse.contents = UIImage(named: "sun")
        rotate(node: sunNode)
        return sunNode
    }
    func getMercury() {
        var mercury: SCNNode = SCNNode()
        mercury = SCNNode(geometry: SCNSphere(radius: 0.02))
        mercury.position = SCNVector3Make(0.4, 0, 0)
        mercury.geometry?.firstMaterial!.diffuse.contents = UIImage(named: "mercury")
        rotate(node: mercury)
        sunNode.addChildNode(mercury)
    }
    func getVenus() {
        var venus: SCNNode = SCNNode()
        venus = SCNNode(geometry: SCNSphere(radius: 0.04))
        venus.position = SCNVector3Make(0.6, 0, 0)
        venus.geometry?.firstMaterial!.diffuse.contents = UIImage(named: "venus")
        rotate(node: venus)
        sunNode.addChildNode(venus)
    }
    func getEarth() {
        var earth: SCNNode = SCNNode()
        earth = SCNNode(geometry: SCNSphere(radius: 0.03))
        earth.position = SCNVector3Make(0.8, 0, 0)
        earth.geometry?.firstMaterial!.diffuse.contents = UIImage(named: "earth")
        rotate(node: earth)
        sunNode.addChildNode(earth)
    }
    func getMars() {
        var mars: SCNNode = SCNNode()
        mars = SCNNode(geometry: SCNSphere(radius: 0.05))
        mars.position = SCNVector3Make(1, 0, 0)
        mars.geometry?.firstMaterial!.diffuse.contents = UIImage(named: "mars")
        rotate(node: mars)
        sunNode.addChildNode(mars)
    }
    func getJupiter() {
        var jupiter: SCNNode = SCNNode()
        jupiter = SCNNode(geometry: SCNSphere(radius: 0.15))
        jupiter.position = SCNVector3Make(1.4, 0, 0)
        jupiter.geometry?.firstMaterial!.diffuse.contents = UIImage(named: "jupiter")
        rotate(node: jupiter)
        sunNode.addChildNode(jupiter)
    }
    func getSaturn() {
        var saturn: SCNNode = SCNNode()
        saturn = SCNNode(geometry: SCNSphere(radius: 0.12))
        saturn.position = SCNVector3Make(1.68, 0, 0)
        saturn.geometry?.firstMaterial!.diffuse.contents = UIImage(named: "saturn")
        rotate(node: saturn)
        sunNode.addChildNode(saturn)
    }
    func getUranus() {
        var uranus: SCNNode = SCNNode()
        uranus = SCNNode(geometry: SCNSphere(radius: 0.09))
        uranus.position = SCNVector3Make(1.95, 0, 0)
        uranus.geometry?.firstMaterial!.diffuse.contents = UIImage(named: "uranus")
        rotate(node: uranus)
        sunNode.addChildNode(uranus)
        
    }
    func getNeptune() {
        var neptune: SCNNode = SCNNode()
        neptune = SCNNode(geometry: SCNSphere(radius: 0.08))
        neptune.position = SCNVector3Make(2.14, 0, 0)
        neptune.geometry?.firstMaterial!.diffuse.contents = UIImage(named: "neptune")
        rotate(node: neptune)
        sunNode.addChildNode(neptune)
    }
    func getPluto() {
        var pluto: SCNNode = SCNNode()
        pluto = SCNNode(geometry: SCNSphere(radius: 0.04))
        pluto.position = SCNVector3Make(2.319, 0, 0)
        pluto.geometry?.firstMaterial!.diffuse.contents = UIImage(named: "pluto")
        rotate(node: pluto)
        sunNode.addChildNode(pluto)
    }
    
    
    // MARK:- Scene Actions
    func rotate(node: SCNNode) {
        let rotation = SCNAction.rotateBy(x: 0, y: CGFloat(Float.pi), z: 0, duration: 10)
        node.runAction(SCNAction.repeatForever(rotation))
    }
}
