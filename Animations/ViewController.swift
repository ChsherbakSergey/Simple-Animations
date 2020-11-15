//
//  ViewController.swift
//  Animations
//
//  Created by Sergey on 6/12/20.
//  Copyright © 2020 Chsherbak Sergey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Creating property for squareView Animation
    var isAnimated = false
    // Value that will allow us to watch animations and choose previus and next animations
    var animationNumber = 0
    
    //IBOutlet Constrains of squareView
    @IBOutlet weak var squareViewTrailingConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var squareViewLeadingConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var squareViewCenterYConstraint: NSLayoutConstraint!
    
    //IBOutlets
    @IBOutlet weak var squareView: UIView!
    
    @IBOutlet weak var numberOfAnimation: UILabel!
    
    @IBAction func previousButton(_ sender: Any) {
        //Subtract 1 to the animationNumber so we would be able to see next animations and move between them
        animationNumber -= 1
        isAnimated = !isAnimated
        // Check if animationNuber equals x then do necessary animation
        if animationNumber == 0 {
            //removing previous or next animations so they won't mix up.
            squareView.layer.removeAllAnimations()
            // Change the name of label to the name of an animation
            numberOfAnimation.text = "Choose Animation"
        } else if animationNumber == 1 {
            backgroundChange()
        } else if animationNumber == 2 {
            changeOfTheLocation()
        } else if animationNumber == 3 {
            changeOfCornerRadius()
        } else if animationNumber == 4 {
            rotation()
        } else if animationNumber == 5 {
            disappearence()
        } else if animationNumber == 6 {
            enlargment()
        } else if animationNumber == 7 {
            infiniteRotation()
        } else {
            if animationNumber < 0 {
                animationNumber += 1
            }
        }
    }
    
    @IBAction func nextButton(_ sender: Any) {
        //Add 1 to the animationNumber so we would be able to see next animations and move between them
        animationNumber += 1
        isAnimated = !isAnimated
        // Check if animationNuber equals x then do necessary animation
        if animationNumber == 0 {
            //removing previous or next animations so they won't mix up.
            squareView.layer.removeAllAnimations()
            // Change the name of label to the name of an animation
            numberOfAnimation.text = "Choose Animation"
        } else if animationNumber == 1 {
            backgroundChange()
        } else if animationNumber == 2 {
            changeOfTheLocation()
        } else if animationNumber == 3 {
            changeOfCornerRadius()
        } else if animationNumber == 4 {
            rotation()
        } else if animationNumber == 5 {
            disappearence()
        } else if animationNumber == 6 {
            enlargment()
        } else if animationNumber == 7 {
            infiniteRotation()
        } else {
            if animationNumber > 7 {
                animationNumber -= 1
            }
        }
    }
    
    @IBAction func repeatAnimationButton(_ sender: Any) {
        if animationNumber == 1 {
            backgroundChange()
        } else if animationNumber == 2 {
            changeOfTheLocation()
        } else if animationNumber == 3 {
            changeOfCornerRadius()
        } else if animationNumber == 4 {
            rotation()
        } else if animationNumber == 5 {
            disappearence()
        } else if animationNumber == 6 {
            enlargment()
        } else if animationNumber == 7 {
            infiniteRotation()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberOfAnimation.text = "Animation Name"
    }
    
    func enlargment() {
        //removing previous or next animations so they won't mix up.
        squareView.layer.removeAllAnimations()
        // Change the name of label to the name of an animation
        numberOfAnimation.text = "Enlargement"
        //Assign initial value of constraints
        squareViewTrailingConstraint.constant = 100
        squareViewLeadingConstraint.constant = 100
        view.layoutIfNeeded()
        //Animating
        UIView.animate(withDuration: 1, delay: 0, options: UIView.AnimationOptions.autoreverse, animations: {
            self.squareViewTrailingConstraint.constant = 0
            self.squareViewLeadingConstraint.constant = 0
            self.view.layoutIfNeeded()
        }) { (isCompleted) in
            self.squareViewTrailingConstraint.constant = 100
            self.squareViewLeadingConstraint.constant = 100
            self.view.layoutIfNeeded()
        }
    }
    
    func disappearence() {
        //removing previous or next animations so they won't mix up.
        squareView.layer.removeAllAnimations()
        // Change the name of label to the name of an animation
        numberOfAnimation.text = "Disappearence"
        //Set initial value of alpha
        self.squareView.alpha = 1
        //Animating
        UIView.animate(withDuration: 2, delay: 0, options: UIView.AnimationOptions.autoreverse, animations: {
            self.squareView.alpha = 0
        }) { (isCompleted) in
            self.squareView.alpha = 1
        }
    }
    
    func rotation() {
        //removing previous or next animations so they won't mix up.
        squareView.layer.removeAllAnimations()
        // Change the name of label to the name of an animation
        numberOfAnimation.text = "180° rotation"
        //Assign initial value
        self.squareView.transform = CGAffineTransform(rotationAngle: 0)
        //Animating
        UIView.animate(withDuration: 2, delay: 0, options: UIView.AnimationOptions.autoreverse, animations: {
            self.squareView.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        }) { (isCompleted) in
            self.squareView.transform = CGAffineTransform(rotationAngle: 0)
        }
    }
    
    func changeOfCornerRadius() {
        //removing previous or next animations so they won't mix up.
        squareView.layer.removeAllAnimations()
        // Change the name of label to the name of an animation
        numberOfAnimation.text = "Corner Radius"
        //Animating
        let animation = CABasicAnimation(keyPath: "cornerRadius")
        animation.fromValue = NSNumber(value: 0)
        animation.toValue = NSNumber(value: Int(squareView.frame.size.width) / 2)
        animation.duration = 1.0
        animation.autoreverses = true
        squareView.layer.add(animation, forKey: "cornerRadius")
    }
    
    func changeOfTheLocation() {
        //removing previous or next animations so they won't mix up.
        squareView.layer.removeAllAnimations()
        // Change the name of label to the name of an animation
        numberOfAnimation.text = "Location Change"
        //Assign initial value of constraints
        squareViewTrailingConstraint.constant = 100
        squareViewLeadingConstraint.constant = 100
        //do extension below the class and use it here so we would be able to change multiplier of CenterYConstraint
        let newsquareViewCenterYConstraint = squareViewCenterYConstraint.constraintWithMultiplier(1)
        view.removeConstraint(squareViewCenterYConstraint)
        view.addConstraint(newsquareViewCenterYConstraint)
        view.layoutIfNeeded()
        squareViewCenterYConstraint = newsquareViewCenterYConstraint
        //Animating
        UIView.animate(withDuration: 1, delay: 0, options: UIView.AnimationOptions.autoreverse, animations: {
            self.squareViewTrailingConstraint.constant = 0
            self.squareViewLeadingConstraint.constant = 200
            self.view.layoutIfNeeded()
            let new2squareViewCenterYConstraint = self.squareViewCenterYConstraint.constraintWithMultiplier(0.24)
            self.view.removeConstraint(self.squareViewCenterYConstraint)
            self.view.addConstraint(new2squareViewCenterYConstraint)
            self.view.layoutIfNeeded()
            self.squareViewCenterYConstraint = new2squareViewCenterYConstraint
        }) { (isCompleted) in
            self.squareViewTrailingConstraint.constant = 100
            self.squareViewLeadingConstraint.constant = 100
            let newsquareViewCenterYConstraint = self.squareViewCenterYConstraint.constraintWithMultiplier(1)
            self.view.removeConstraint(self.squareViewCenterYConstraint)
            self.view.addConstraint(newsquareViewCenterYConstraint)
            self.view.layoutIfNeeded()
            self.squareViewCenterYConstraint = newsquareViewCenterYConstraint
        }
    }

    func backgroundChange(){
        //removing previous or next animations so they won't mix up.
        squareView.layer.removeAllAnimations()
        // Change the name of label to the name of an animation
        numberOfAnimation.text = "BC Change"
        //Assign initial background color
        self.squareView.backgroundColor = UIColor.red
        //Animating
        UIView.animate(withDuration: 2, delay: 0, options: UIView.AnimationOptions.autoreverse, animations: {
            self.squareView.backgroundColor = UIColor.yellow
        }, completion: { (isCompleted) in
            self.squareView.backgroundColor = UIColor.red
        })
    }
    
    func infiniteRotation() {
        //removing previous or next animations so they won't mix up.
        squareView.layer.removeAllAnimations()
        // Change the name of label to the name of an animation
        numberOfAnimation.text = "Infinite rotation"
        //Animating
        UIView.animate(withDuration: 2, delay: 0, options: [UIView.AnimationOptions.repeat, UIView.AnimationOptions.curveLinear], animations: {
            self.squareView.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        }) { (isCompleted) in
            self.squareView.transform = CGAffineTransform(rotationAngle: 0)
        }
    }
}

extension NSLayoutConstraint {
    func constraintWithMultiplier(_ multiplier: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self.firstItem!, attribute: self.firstAttribute, relatedBy: self.relation, toItem: self.secondItem, attribute: self.secondAttribute, multiplier: multiplier, constant: self.constant)
    }
}
