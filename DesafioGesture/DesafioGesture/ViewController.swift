//
//  ViewController.swift
//  DesafioGesture
//
//  Created by Swift on 28/01/17.
//  Copyright © 2017 Swift. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var littleView: UIView!
    
    // MARK: - Properties
    
    var originX:CGFloat = 0
    
    var originY:CGFloat = 0
    
    var variation:CGFloat = 10
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        originX = self.view.center.x
        
        originY = self.view.center.y
        
        print(originX, originY)
        
        let tripleTap = UITapGestureRecognizer(target: self, action: #selector(tripleTapped(_:)))
        
        tripleTap.numberOfTapsRequired = 3
        
        self.littleView.addGestureRecognizer(tripleTap)
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(leftSwipe(_:)))
        
        leftSwipe.direction = .left
        
        self.littleView.addGestureRecognizer(leftSwipe)
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(rightSwipe(_:)))
        
        rightSwipe.direction = .right
        
        self.littleView.addGestureRecognizer(rightSwipe)
        
        let upSwipe = UISwipeGestureRecognizer(target: self, action: #selector(upSwipe(_:)))
        
        upSwipe.direction = .up
        
        self.littleView.addGestureRecognizer(upSwipe)
        
        let downSwipe = UISwipeGestureRecognizer(target: self, action: #selector(downSwipe(_:)))
        
        downSwipe.direction = .down
        
        self.littleView.addGestureRecognizer(downSwipe)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Métodos
    
    func tripleTapped (_ trippleTap:UITapGestureRecognizer){
        
        UIView.animate(withDuration: 0.5, animations: {
            
            self.littleView.backgroundColor = UIColor(red: (CGFloat(arc4random()%256)/255), green: (CGFloat(
            (arc4random()%256))/255), blue: (CGFloat((arc4random()%256))/255), alpha: 1.0)
        
        })
        
    }
    
    func leftSwipe (_ leftSwipe: UISwipeGestureRecognizer){
        
        self.originX -= variation
        moveWithAnimation()
        
    }
    
    func rightSwipe (_ rightSwipe: UISwipeGestureRecognizer){
        
        self.originX += variation
        moveWithAnimation()
        
    }
    
    func upSwipe (_ upSwipe: UISwipeGestureRecognizer){
        
        self.originY -= variation
        moveWithAnimation()
        
    }
    
    func downSwipe (_ downSwipe: UISwipeGestureRecognizer){
        
        self.originY += variation
        moveWithAnimation()
        
    }
    
    func moveWithAnimation(){
        UIView.animate(withDuration: 0.5, animations: {
            
            self.littleView.center = CGPoint(x: self.originX, y: self.originY)
            
        })
    }
    
    // MARK: - Actions

}

