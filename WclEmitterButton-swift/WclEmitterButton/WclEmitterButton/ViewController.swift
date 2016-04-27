//
//  ViewController.swift
//  WclEmitterButton
//
//  Created by 王崇磊 on 16/4/26.
//  Copyright © 2016年 王崇磊. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func wclButtonAction(sender: UIButton) {
        sender.selected = !sender.selected
    }

}

