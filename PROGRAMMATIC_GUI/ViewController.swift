//
//  ViewController.swift
//  PROGRAMMATIC_GUI
//
//  Created by GOD on 2/28/20.
//  Copyright © 2020 ALL ONE SUN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //Class vars here
    let label=UILabel()
    let button=UIButton()
    let slider=UISlider()
    //This is making a reference to the label's constraint so that it can be animated. Otherwise a new unnamed constraint would be added to the label if a new constraint of the same type was made with a new val in that button's clicked method
    var labelLeadingAnchor: NSLayoutConstraint!
    //Class methods here
    //Button clicked method to animate the constraints of the label's labelLeadingAnchor
    @objc func clicked(sender:UIButton){
        print("CLICKED")
        //These set the new constraints, but those won't update until layoutIfNeeded() is called
        if labelLeadingAnchor.constant==view.bounds.width/2{
            labelLeadingAnchor.constant=view.bounds.width-view.bounds.width
            UIView.animate(withDuration: 0.5) {
                
                self.label.transform = self.label.transform.rotated(by: (-1 * CGFloat(M_PI/2)))
                self.view.layoutIfNeeded()
                self.label.transform = self.label.transform.rotated(by: (-1 * CGFloat(M_PI/2)))
                self.view.layoutIfNeeded()
            }
        }else{
            labelLeadingAnchor.constant=view.bounds.width/2
            UIView.animate(withDuration: 0.5) {
                self.label.transform = self.label.transform.rotated(by: CGFloat(M_PI))
                self.view.layoutIfNeeded()
            
                
            }
        }
        
        
        //This animates any change that was made to the constraints
//        UIView.animate(withDuration: 0.5) {
//
//            self.label.transform = self.label.transform.rotated(by: CGFloat(M_PI))
//            self.label.transform = self.label.transform.rotated(by: CGFloat(M_PI))

            
//            self.label.transform = self.label.transform.? CGAffineTransform(rotationAngle:CGFloat.pi):self.label.transform.inverted()
//            self.label.transform =  CGAffineTransform(rotationAngle: CGFloat.pi)
            //This method specifically animates any change that was made to the constraints
//            self.view.layoutIfNeeded()
            
//        }
    }
    
    @objc func sliderMoved(sender:UISlider){
        label.text=String(slider.value)
        print(slider.value)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Prepare label
//        label.text="TEXT"
        label.textAlignment=NSTextAlignment.center
        
        //Round the corners (which is done in a rounded corner mask seemingly) and then apply that rounded corner mask to the label:
        label.layer.cornerRadius=20
//        Make sure to apply the layer mask to apply those rounded corners:
        label.layer.masksToBounds=true
        
        label.backgroundColor=#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        view.addSubview(label)
        //Add label's constraints after calling view.addSubview to properly add autolayout to programmatic GUI. Make sure to set any of those Anchors to isActive=true
        
        //Next line disables something that would have interfered with adding autolayout programmatically
        label.translatesAutoresizingMaskIntoConstraints=false
        
        //Adding constraints to label and make sure to set .isActive to true:
        label.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        label.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        //Use the "safeAreaLayoutGuide to prevent GUI from overlapping the "notch" in some iPhone models
        labelLeadingAnchor=label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant:view.bounds.width/2)
        labelLeadingAnchor.isActive=true
        label.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: 0).isActive=true
        //Extra for later if want to use later:
        //        label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant:view.bounds.width/7).isActive=true
        //        label.leadingAnchor.constraint(equalToSystemSpacingAfter: view.safeAreaLayoutGuide.leadingAnchor, multiplier: 0.2).isActive=true
        //        button.heightAnchor.constraint(equalTo: button.widthAnchor, multiplier: 1.0/5.0).isActive = true
        //        (: view.safeAreaLayoutGuide.leadingAnchor, constant: view.bounds.width)
        //        label.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0).isActive=true
        
        //Prepare button
        button.backgroundColor=#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        button.titleLabel?.text="CONTROL"
        button.setTitle("CLICK", for: .normal)
        button.titleLabel?.textColor=#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        button.layer.cornerRadius=20
        //        Make sure to apply the layer mask to apply those rounded corners:
        button.layer.masksToBounds=true
        //Add a target selector style method to button to target clicked method defined at start of class (make sure the method has @objc bridging keyword before the func keyword in definition)
        button.addTarget(self, action: #selector(clicked), for: .touchUpInside)
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints=false
        
        button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        button.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
        button.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive=true
        button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive=true
        
        //Adding slider:
        
//        slider.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topanchor, multiplier: 100)
        
        view.addSubview(slider)
        slider.center.y=(view.frame.size.height/7)*6.5
        slider.center.x=view.center.x
        slider.addTarget(self, action: #selector(sliderMoved), for: .valueChanged)
        
        
        
        //Misc parts drawer
        //        let label2=UILabel()
        //               label2.text="NEXT"
        //               label2.textAlignment=NSTextAlignment.center
        //               //Round the corners and then apply that mask
        //               label2.layer.cornerRadius=20
        //               label2.layer.masksToBounds=true
        //               label2.backgroundColor=#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        //               view.addSubview(label)
        //               //Do these things after calling view.addSubview to properly add autolayout to programmatic GUI. Make sure to set any of those Anchors to isActive=true
        //               //Next line disables something that would have interfered with adding autolayout programmatically
        //               label2.translatesAutoresizingMaskIntoConstraints=false
        ////        label2.leadingAnchor.constraint(eq: view.bounds, multiplier: 0.2)
        ////        label2.leadingAnchor.constraint(equalToSystemSpacingAfter:view.safeAreaLayoutGuide.leftAnchor, multiplier: 1.2)
        //               label2.widthAnchor.constraint(equalTo: label.widthAnchor, multiplier: 0.5).isActive = true
        //               label2.heightAnchor.constraint(equalTo: label.heightAnchor, multiplier: 0.5).isActive = true
        ////        label2.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, multiplier: 0.5).isActive=true
        //               label2.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: 0).isActive=true
        //
        //
        //        label.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 0.2)
        //        label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive=true
        //        label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 100).isActive=true
        //        label.widthAnchor.constraint(equalToConstant: 200).isActive=true
        //        label.heightAnchor.constraint(equalToConstant: 100).isActive=true
        
    }
    
    
}

