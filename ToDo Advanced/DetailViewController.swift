//
//  DetailViewController.swift
//  ToDo Advanced
//
//  Created by Jorge Gallardo on 8/26/15.
//  Copyright © 2015 Jorge Gallardo. All rights reserved.
//

import UIKit
import Realm

class DetailViewController: UIViewController {
    
    var todo: TodoItem!

    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var noteText: UITextField!
    @IBOutlet weak var completedSwitch: UISwitch!
    
    @IBAction func saveButtonTapped(sender: UIBarButtonItem) {
        let realm = RLMRealm.defaultRealm()
        realm.beginWriteTransaction()
        
        todo.name = nameText.text!
        todo.note = noteText.text!
        todo.completed = completedSwitch.on
        
        realm.commitWriteTransaction()
        
        navigationController?.popViewControllerAnimated(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        nameText.text = todo.name
        noteText.text = todo.note
        completedSwitch.on = todo.completed
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
