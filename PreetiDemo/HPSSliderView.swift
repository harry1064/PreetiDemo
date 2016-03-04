//
//  HPSSliderView.swift
//  PreetiDemo
//
//  Created by Quinto Technologies Pvt. Ltd. on 04/03/16.
//  Copyright © 2016 Quinto Technologies Pvt. Ltd. All rights reserved.
//

import UIKit

class HPSSliderView: UIView,UIScrollViewDelegate {
    let baseScrollView:UIScrollView = UIScrollView()
    let firstView:UIView = UIView()
    let secondView:UIView = UIView()
    let thirdView:UIView = UIView()
    let firstButton:UIButton = UIButton()
    let secondButton:UIButton = UIButton()
    let thirdButton:UIButton = UIButton()
    let slidingLine:UIView = UIView()
    var leadingConstraintSlidingLabel:NSLayoutConstraint = NSLayoutConstraint()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.blackColor()
        self.addBaseScrollView()
        self.addButtons()
        self.addViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func addBaseScrollView() {
        baseScrollView.translatesAutoresizingMaskIntoConstraints = false
        baseScrollView.delegate = self
        self.addSubview(baseScrollView)
        
        // adding constraint on baseScrollView
        let leadingConstraintForBaseScrollView = NSLayoutConstraint.init(item: baseScrollView, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Leading, multiplier: 1.0, constant: 0)
        self .addConstraint(leadingConstraintForBaseScrollView)
        let trailingConstraintForBaseScrollView = NSLayoutConstraint.init(item: baseScrollView, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Trailing, multiplier: 1.0, constant: 0)
        self.addConstraint(trailingConstraintForBaseScrollView)
        let topConstraintForBaseScrollView = NSLayoutConstraint.init(item: baseScrollView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 44.0)
        self.addConstraint(topConstraintForBaseScrollView)
        let bottomConstraintForBaseScrollView = NSLayoutConstraint.init(item: baseScrollView, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0)
        self.addConstraint(bottomConstraintForBaseScrollView)
    }
    
    func addButtons() {
        // firstButton
        firstButton.translatesAutoresizingMaskIntoConstraints = false
        firstButton.setTitle("First", forState: UIControlState.Normal)
        firstButton.addTarget(self, action: "firstButtonTapped:", forControlEvents: UIControlEvents.TouchUpInside)
        self.addSubview(firstButton)
        //firstButton constraints
        let leadingConstraint = NSLayoutConstraint.init(item: firstButton, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Leading, multiplier: 1.0, constant: 0.0)
        self.addConstraint(leadingConstraint)
        let topConstraint = NSLayoutConstraint.init(item: firstButton, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 0)
        self.addConstraint(topConstraint)
        let widthConstraint = NSLayoutConstraint.init(item: firstButton, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: self.frame.size.width/3)
        self.addConstraint(widthConstraint)
        let heightConstraint = NSLayoutConstraint.init(item: firstButton, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: 44.0)
        self.addConstraint(heightConstraint)
        
        
        // secondButton
        secondButton.translatesAutoresizingMaskIntoConstraints = false
        secondButton.addTarget(self, action: "secondButtonTapped:", forControlEvents: UIControlEvents.TouchUpInside)
        secondButton.setTitle("Second", forState: UIControlState.Normal)
        self.addSubview(secondButton)
        //firstButton constraints
        let leadingConstraintSecond = NSLayoutConstraint.init(item: secondButton, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: firstButton, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: 0.0)
        self.addConstraint(leadingConstraintSecond)
        let topConstraintSecond = NSLayoutConstraint.init(item: secondButton, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 0)
        self.addConstraint(topConstraintSecond)
        let widthConstraintSecond = NSLayoutConstraint.init(item: secondButton, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: self.frame.size.width/3)
        self.addConstraint(widthConstraintSecond)
        let heightConstraintSecond = NSLayoutConstraint.init(item: secondButton, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: 44.0)
        self.addConstraint(heightConstraintSecond)
        
        
        // thirdButton
        thirdButton.translatesAutoresizingMaskIntoConstraints = false
        thirdButton.addTarget(self, action: "thirdButtonTapped:", forControlEvents: UIControlEvents.TouchUpInside)
        thirdButton.setTitle("Third", forState: UIControlState.Normal)
        self.addSubview(thirdButton)
        //thirdButton constraints
        let leadingConstraintThird = NSLayoutConstraint.init(item: thirdButton, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: secondButton, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: 0.0)
        self.addConstraint(leadingConstraintThird)
        let topConstraintThird = NSLayoutConstraint.init(item: thirdButton, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 0)
        self.addConstraint(topConstraintThird)
        let widthConstraintThird = NSLayoutConstraint.init(item: thirdButton, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: self.frame.size.width/3)
        self.addConstraint(widthConstraintThird)
        let heightConstraintThird = NSLayoutConstraint.init(item: thirdButton, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: 44.0)
        self.addConstraint(heightConstraintThird)

        //slidingLine
        slidingLine.translatesAutoresizingMaskIntoConstraints = false
        slidingLine.backgroundColor = UIColor.yellowColor()
        self.addSubview(slidingLine)
        leadingConstraintSlidingLabel = NSLayoutConstraint.init(item: slidingLine, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Leading, multiplier: 1.0, constant: 0)
        self.addConstraint(leadingConstraintSlidingLabel)
        let bottonConstraintSlidingLabel = NSLayoutConstraint.init(item: slidingLine, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: baseScrollView, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 0)
        self.addConstraint(bottonConstraintSlidingLabel)
        let widthConstraintSlidingLabel = NSLayoutConstraint.init(item: slidingLine, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: self.frame.size.width/3)
        self.addConstraint(widthConstraintSlidingLabel)
        let heightConstraintSlidingLabel = NSLayoutConstraint.init(item: slidingLine, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: 2)
        self.addConstraint(heightConstraintSlidingLabel)

        
    }
    
    func addViews() {
        baseScrollView.pagingEnabled = true
        firstView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height-44)
        firstView.backgroundColor = UIColor.brownColor()
        baseScrollView.addSubview(firstView)
        
        secondView.frame = CGRectMake(1*self.frame.size.width, 0, self.frame.size.width, self.frame.size.height-44)
        secondView.backgroundColor = UIColor.greenColor()
        baseScrollView.addSubview(secondView)
        
        thirdView.frame = CGRectMake(2*self.frame.size.width, 0, self.frame.size.width, self.frame.size.height-44)
        thirdView.backgroundColor = UIColor.magentaColor()
        baseScrollView.addSubview(thirdView)
        
        baseScrollView.contentSize = CGSizeMake(3*self.frame.size.width,self.frame.size.height-44)
        
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        leadingConstraintSlidingLabel.constant = (baseScrollView.contentOffset.x)*(1/3)
    }
    func firstButtonTapped(button:UIButton) {
        baseScrollView .setContentOffset(CGPointMake(0, 0), animated: true)
         leadingConstraintSlidingLabel.constant = (baseScrollView.contentOffset.x)*(1/3)
    }
    func secondButtonTapped(button:UIButton) {
         baseScrollView .setContentOffset(CGPointMake(320, 0), animated: true)
         leadingConstraintSlidingLabel.constant = (baseScrollView.contentOffset.x)*(1/3)
    }
    func thirdButtonTapped(button:UIButton) {
         baseScrollView .setContentOffset(CGPointMake(640, 0), animated: true)
         leadingConstraintSlidingLabel.constant = (baseScrollView.contentOffset.x)*(1/3)
    }
    
}
