//
//  ViewController.swift
//  ToDo Advanced
//
//  Created by Jorge Gallardo on 8/25/15.
//  Copyright © 2015 Jorge Gallardo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource /*AddTodoViewControllerDelegate*/ {
    
//    var array = [TodoItem]()
    
    // MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBAction func editButtonTapped(sender: UIBarButtonItem) {
        tableView.editing = !tableView.editing
    }
    
    // MARK: Add Todo Delgate Methods
//    func addNew(todo: TodoItem) {
//        array.append(todo)
//        tableView.reloadData()
//    }
    
    
    
    // MARK: Segue Methods
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "AddTodoSegue" {
            let destinationVC = segue.destinationViewController as! AddTodoViewController
//            destinationVC.delegate = self
        } else if segue.identifier == "DetailSegue" {
            let destinationVC = segue.destinationViewController as! DetailViewController
            if let indexPath = tableView.indexPathForSelectedRow {
//                destinationVC.todo = array[indexPath.row]
                destinationVC.todo = TodoStore.sharedInstance.get(indexPath.row)
            }
        }
    }
    
    
    
    // MARK: Table View Delgate Methods
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return array.count
        return TodoStore.sharedInstance.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell!
//        let todo = array[indexPath.row]
        let todo = TodoStore.sharedInstance.get(indexPath.row)
        cell.textLabel?.text = todo.name
        cell.detailTextLabel?.text = todo.note
        
        if todo.completed {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        } else {
            cell.accessoryType = UITableViewCellAccessoryType.None
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
//            array.removeAtIndex(indexPath.row)
            TodoStore.sharedInstance.removeAt(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Left)
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        
//        tableView.deselectRowAtIndexPath(indexPath, animated: true)
//        let cell = tableView.cellForRowAtIndexPath(indexPath)
//        let todo = array[indexPath.row]
//        todo.completed = !todo.completed
//        if todo.completed {
//            cell?.accessoryType = UITableViewCellAccessoryType.Checkmark
//        } else {
//            cell?.accessoryType = UITableViewCellAccessoryType.None
//        }
    }
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
//        let todo = array.removeAtIndex(sourceIndexPath.row)
//        array.insert(todo, atIndex: destinationIndexPath.row)
    }
    
    
    // Mark: View Lifecycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        array.append(TodoItem(name: "Hello", note: "World"))
//        array.append(TodoItem(name: "Cork", note: "Soaker"))
//        array.append(TodoItem(name: "Play", note: "Cods"))
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
}