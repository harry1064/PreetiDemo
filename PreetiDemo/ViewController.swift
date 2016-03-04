//
//  ViewController.swift
//  PreetiDemo
//
//  Created by Quinto Technologies Pvt. Ltd. on 04/03/16.
//  Copyright © 2016 Quinto Technologies Pvt. Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let myView:HPSSliderView = HPSSliderView.init(frame: CGRectMake(0,0, self.view.frame.size.width, self.view.frame.size.height))
        self.view.addSubview(myView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

