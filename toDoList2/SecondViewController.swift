//
//  SecondViewController.swift
//  toDoList2
//
//  Created by Jacob Claessens on 2016-05-19.
//  Copyright © 2016 Rover Studios. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    @IBOutlet var item: UITextField!
    
    
    @IBAction func addItem(_ sender: AnyObject) {
        
        toDoList.append(item.text!)
        
        item.text = ""
        
        UserDefaults.standard.set(toDoList, forKey: "toDoList")   //update the default string array
    }
    
    
    //on boot up
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    //memory errors
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //close keyboard when sceen touch
    override func touchesBegan(_ touches: Set<UITouch>, with event : UIEvent?) {
        //what does Set mean, or all that event stuff
        self.view.endEditing(true) //let user tap outside to close keyboard
    }
    //close when return is pressed
    func textFieldShoudReturn(_ textField: UITextField!) -> Bool {
        item.resignFirstResponder()
        return true
    }


}

