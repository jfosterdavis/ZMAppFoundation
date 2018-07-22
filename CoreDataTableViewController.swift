//
//  CoreDataTableViewController.swift
//  FlashcardHero
//
//  Created by Jacob Foster Davis on 11/1/16.
//  Copyright © 2016 Zero Mu, LLC. All rights reserved.
//

import Foundation
import CoreData
import UIKit

open class CoreDataTableViewController: CoreDataViewController, UITableViewDelegate {
    
    /******************************************************/
    /******************* Properties **************/
    /******************************************************/
    //MARK: - Properties
    public var tableView: UITableView!
    
    //    var stack: CoreDataStack!
    
    /******************************************************/
    /******************* Life Cycle **************/
    /******************************************************/
    //MARK: - Life Cycle
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    /******************************************************/
    /******************* UITableViewDelegate Delegate and Data Source **************/
    /******************************************************/
    //MARK: - UITableViewDelegate Delegate and Data Source
    
    
    //When a user selects an item from the collection
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("This stub should be implimented by a child class")
    }
    
    public func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("This stub should be implimented by a child class")
    }
    
}

// MARK: - CoreDataCollectionViewController: NSFetchedResultsControllerDelegate

extension CoreDataTableViewController {
    
    public func configureCell(cell: UITableViewCell, indexPath: IndexPath) {
        print("Stub for configureCell should be implimented by a child class")
    }
    
    override public func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        //about to make updates.  wrapping actions with updates will allow for animation and auto reloading
        self.tableView.beginUpdates()
    }
    
    override public func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        print("This stub should be implimented by a child class")
        
//        print("\(controller) didChange anObject \(anObject)")
//        //save
//        //stack.save()
//
//        if anObject is QuizletSet {
//
//            switch(type) {
//            case .insert:
//                stack.save()
//                //from apple documentation
//                self.tableView.insertRows(at: [newIndexPath!], with: UITableViewRowAnimation.automatic)
//
//                print("case insert")
//            case .delete:
//                //from apple documentation
//                self.tableView.deleteRows(at: [indexPath!], with: UITableViewRowAnimation.automatic)
//                print("case delete")
//            case .update:
//                stack.save()
//                //from apple documentation
//                configureCell(cell: tableView.cellForRow(at: indexPath!)!, indexPath: indexPath!)
//                print("case update")
//            case .move:
//                //TODO: move a cell... this may not be needed
//                print("case move")
//            }
//
//        }  else if anObject is TDPerformanceLog {
//
//            switch(type) {
//            case .insert:
//                //save
//                stack.save()
//                //from apple documentation
//                if let index = indexPath {
//                    configureCell(cell: tableView.cellForRow(at: index)!, indexPath: index)
//                }
//
//                print("case insert TDPerformanceLog")
//            case .delete:
//
//                print("case delete TDPerformanceLog")
//            case .update:
//                //save
//                stack.save()
//                //from apple documentation
//                configureCell(cell: tableView.cellForRow(at: indexPath!)!, indexPath: indexPath!)
//                print("case update TDPerformanceLog")
//            case .move:
//                //TODO: move a cell... this may not be needed
//                print("case move TDPerformanceLog")
//            }
//
//            //save
//            //stack.save()
//
//
//        } else
//        {
//            fatalError("Couldn't get a QuizletSet from anObject in didChange \(anObject)")
//        }
        
        
    }
    
    override public func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        //finished with updates, allow table view to animate and reload
        //print("\(controller) didchangecontent")
        self.tableView.endUpdates()
    }
}
