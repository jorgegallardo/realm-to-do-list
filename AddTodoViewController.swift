//
//  AddTodoViewController.swift
//  ToDo Advanced
//
//  Created by Jorge Gallardo on 8/25/15.
//  Copyright © 2015 Jorge Gallardo. All rights reserved.
//

import UIKit

//protocol AddTodoViewControllerDelegate {
//    func addNew(todo: TodoItem)
//}

class AddTodoViewController: UIViewController {
    
//    var delegate: AddTodoViewControllerDelegate!

    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var noteText: UITextField!
    
    @IBAction func saveButtonTapped(sender: UIBarButtonItem) {
//        delegate.addNew(TodoItem(name: nameText.text!, note: noteText.text!))
        TodoStore.sharedInstance.addTodo(nameText.text!, note: noteText.text!)
        navigationController?.popViewControllerAnimated(true) // returns to table after hitting save, programatically
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
