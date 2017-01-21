//
//  ViewController.swift
//  Swift300_Day2_5_GesturesRecognizer
//
//  Created by Swift on 21/01/17.
//  Copyright © 2017 Swift. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var littleView: UIView!
    
    // MARK: - Propriedades
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Tap
        
        /*
        let gestoTap = UITapGestureRecognizer(target: self, action: #selector(disparouTap(_:)))
        
        gestoTap.numberOfTapsRequired = 2
        
        self.littleView.addGestureRecognizer(gestoTap)
        */
        
        // Swipe
        
        /*
        let gestoSwipe = UISwipeGestureRecognizer(target: self, action: #selector(disparouSwipe(_:)))
        
        gestoSwipe.direction = .left
        
        self.littleView.addGestureRecognizer(gestoSwipe)
        
        */
        
        // Pan
        
        /*
        
        let gestoPan = UIPanGestureRecognizer(target: self, action: #selector(disparouPan(_:)))
        
        self.littleView.addGestureRecognizer(gestoPan)
        
        */
        
        // Long Press
        
        /*
        
        let gestoLongPress = UILongPressGestureRecognizer(target: self, action: #selector(disparouLongPress(_:)))
        
        gestoLongPress.minimumPressDuration = 3.0
        
        self.littleView.addGestureRecognizer(gestoLongPress)
        
        */
        
        // Rotation
        
        /*
        
        let gestoRotate = UIRotationGestureRecognizer(target: self, action: #selector(disparouRotate(_:)))
        
        self.littleView.addGestureRecognizer(gestoRotate)
        
        */
        
        // Pinch
        
        let gestoPinch = UIPinchGestureRecognizer(target: self, action: #selector(disparouPinch(_:)))
        
        self.littleView.addGestureRecognizer(gestoPinch)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Métodos
    
    // Método que será disparado pelo Tap
    
    func disparouTap(_ gestoTap: UITapGestureRecognizer) {
        
        print("The user tapped!")
        
    }
    
    func disparouSwipe(_ gestoSwipe : UISwipeGestureRecognizer){
        
        print("The user swiped!")
        
    }
    
    func disparouPan(_ gestoPan : UIPanGestureRecognizer) {
        
        let posicaoToque = gestoPan.location(in: self.view)
        
        print("\(posicaoToque)")
        
    }
    
    func disparouLongPress(_ gestoLongPress : UILongPressGestureRecognizer) {
        
        switch gestoLongPress.state {
            
        case .began:
            print("The user long pressed!")
            
        case.ended:
            print("The user release the press!")
            
        default:
            break
        }
        
    }
    
    func disparouRotate(_ gestoRotate : UIRotationGestureRecognizer) {
        
        gestoRotate.view?.transform = gestoRotate.view!.transform.rotated(by: gestoRotate.rotation)
        
        gestoRotate.rotation = 0
    
    }
    
    func disparouPinch(_ gestoPinch : UIPinchGestureRecognizer) {
        
        gestoPinch.view?.transform = gestoPinch.view!.transform.scaledBy(x: gestoPinch.scale, y: gestoPinch.scale)
        
        gestoPinch.scale = 1
        
    }
    
    // MARK: - Actions


}

