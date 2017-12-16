//
//  ViewController.swift
//  AlertController
//
//  Created by dinesh danda on 09.10.16.
//  Copyright © 2016 dinesh danda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // ui obj
    @IBOutlet weak var myLabel: UILabel!
    var alertController : UIAlertController!
    
    
    // first load func
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Declaring AlertController
        alertController = UIAlertController(title: "Hello Alert", message: "It's my first Alert Controller", preferredStyle: UIAlertControllerStyle.alert)
        
        
        // Creating actions for AlertController
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action : UIAlertAction) in
            
            // retreiving text of Title of the current action
            // let actionTitle = action.title
            
            // retreiving text of 1st TextField
            let textFieldText_1 = self.alertController.textFields?[0].text
            let textFieldText_2 = self.alertController.textFields?[1].text
            
            self.myLabel.text = textFieldText_1! + " " + textFieldText_2!
        }
        
        // cancel
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
        
        // delete
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { (action:UIAlertAction) in
            
            // retreiving text of Title of the current action
            let actionTitle = action.title
            
            self.myLabel.text = "\(actionTitle!) is pressed"
        }
        
        // disabling action button
        deleteAction.isEnabled = false
        
        // adding actions to alertController
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        alertController.addAction(deleteAction)
        
        
        print(alertController.actions)
        
        
        // Adding UITextField to AlertController
        alertController.addTextField { (textfield : UITextField) in
            textfield.placeholder = "Some message :)"
        }
        
        alertController.addTextField(configurationHandler: nil)
        
    }

    
    // called when alert button is pressed
    @IBAction func alert_clicked(_ sender: AnyObject) {
        
        // Presenting AlertController
        // self.present(alertController, animated: true, completion: nil)
        self.present(alertController, animated: true) { 
            self.view.backgroundColor = UIColor.yellow
        }
        
    }
    
    
    // called when update button is pressed
    @IBAction func update_clicked(_ sender: AnyObject) {
        
        // changing / updating string values of AlertController
        alertController.title = "I AM ALERT PRO"
        alertController.message = "I'm becoming iOS Hero!"
        
    }
    
    
}
