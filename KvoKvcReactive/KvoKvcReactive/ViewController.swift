//
//  ViewController.swift
//  KvoKvcReactive
//
//  Created by Vineeth Xavier on 11/30/17.
//  Copyright © 2017 Vineeth Xavier. All rights reserved.
//

//https://www.youtube.com/watch?v=xS7bvtGPiuU


import UIKit
class ViewController: UIViewController {
    var targetString = ""
    
    @IBOutlet weak var inputTextFIeld: UITextField!
    @IBOutlet weak var outputLblField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addObserver(self, forKeyPath: "targetString", options: [.old,.new], context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "targetString" {
            print("old:",change?[NSKeyValueChangeKey.oldKey] ?? "")
            print("new:",change?[NSKeyValueChangeKey.newKey] ?? "")
            
            outputLblField.text = self.value(forKey: "targetString") as! String
            //outputLblField.text = "hi"
        }
    }
   @IBAction func changeBtnAct(_ sender: Any) {
        guard let text = inputTextFIeld.text else {
            return
        }
        self.setValue(text, forKey: "targetString")
    }
    
//    @IBAction func changeBtnAct(_ sender: UIButton) {
//        guard let text = inputTextFIeld.text else {
//            return
//        }
//        outputLblField.text = text
//    }

}

