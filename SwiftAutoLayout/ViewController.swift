//
//  ViewController.swift
//  SwiftAutoLayout
//
//  Created by thanawat.s on 10/28/2557 BE.
//  Copyright (c) 2557 thanawat.s. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let button1 = UIButton.buttonWithType(UIButtonType.System) as UIButton
    let label1 = UILabel() as UILabel
    let atRest = "Doesn't do much"
    let atWork = "Secret Agent"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 1, alpha: 1.0)
        makeLayout()
        
    }
    
    override func supportedInterfaceOrientations() -> Int {
        return Int(UIInterfaceOrientationMask.All.rawValue)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func makeLayout(){
        
        //Make a view
        let view1 = UIView()
        view1.setTranslatesAutoresizingMaskIntoConstraints(false)
        view1.backgroundColor = UIColor.redColor()
        
        //Make a second view
        let view2 = UIView()
        view2.setTranslatesAutoresizingMaskIntoConstraints(false)
        view2.backgroundColor = UIColor(red: 0.75, green: 0.75, blue: 0.1, alpha: 1.0)
        
        view.addSubview(view1)
        view.addSubview(view2)
        
        
        //make dictionary for views
        let viewsDictionary = ["view1":view1,"view2":view2]
        
        let metricsDictionary = ["view1Height": 50.0,"view2Height":40.0,"viewWidth":100.0 ]

        
        //sizing constraints
        //view1
        let view1_constraint_H:Array = NSLayoutConstraint.constraintsWithVisualFormat("H:[view1(viewWidth)]", options: NSLayoutFormatOptions(0), metrics: metricsDictionary, views: viewsDictionary)
        let view1_constraint_V:Array = NSLayoutConstraint.constraintsWithVisualFormat("V:[view1(view1Height)]", options: NSLayoutFormatOptions(0), metrics: metricsDictionary, views: viewsDictionary)
        
        view1.addConstraints(view1_constraint_H)
        view1.addConstraints(view1_constraint_V)
        
        //view2
        let view2_constraint_H:NSArray = NSLayoutConstraint.constraintsWithVisualFormat("H:[view2(viewWidth)]", options: NSLayoutFormatOptions(0), metrics: metricsDictionary, views: viewsDictionary)
        let view2_constraint_V:NSArray = NSLayoutConstraint.constraintsWithVisualFormat("V:[view2(>=view2Height)]", options: NSLayoutFormatOptions(0), metrics: metricsDictionary, views: viewsDictionary)
        
        view2.addConstraints(view2_constraint_H)
        view2.addConstraints(view2_constraint_V)
        
        //views
        let view_constraint_H:NSArray = NSLayoutConstraint.constraintsWithVisualFormat("H:|-[view2]", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
        let view_constraint_V:NSArray = NSLayoutConstraint.constraintsWithVisualFormat("V:|-36-[view1]-[view2]-8-|", options: NSLayoutFormatOptions.AlignAllLeading, metrics: nil, views: viewsDictionary)
        
        view.addConstraints(view_constraint_H)
        view.addConstraints(view_constraint_V)

        
    }

}

