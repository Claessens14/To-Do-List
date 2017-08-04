//
//  FirstViewController.swift
//  toDoList2
//
//  Created by Jacob Claessens on 2016-05-19.
//  Copyright © 2016 Rover Studios. All rights reserved.
//

import UIKit

var toDoList = [String]() 

class FirstViewController: UIViewController, UITableViewDelegate {

    @IBOutlet var toDoListTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if UserDefaults.standard.object(forKey: "toDoList") != nil {
            toDoList = UserDefaults.standard.object(forKey: "toDoList") as! [String] //as array of strings
        }
    }
    //memory warnings
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = toDoList[indexPath.row]
        // only updates content when app is loaded ^^^ so must update
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: IndexPath) {
        //this method will be called when the user edits a item in the table
        
        if editingStyle == UITableViewCellEditingStyle.delete {
            //editing style is what the user is trying to do the table
            // == special swipe to the left style
            toDoList.remove(at: indexPath.row)
            
            UserDefaults.standard.set(toDoList, forKey: "toDoList")
            
            toDoListTable.reloadData() //reload the table
        }
    }
    
    override func viewDidAppear(_ animanted:Bool) {
        toDoListTable.reloadData()  //reloads the data
    
    }

}

