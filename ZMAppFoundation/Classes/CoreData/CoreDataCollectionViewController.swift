//
//  CoreDataCollectionViewController.swift
//  FlashcardHero
//
//  Created by Jacob Foster Davis on 11/3/16.
//  Copyright © 2016 Zero Mu, LLC. All rights reserved.
//

import Foundation
import CoreData
import UIKit

open class CoreDataCollectionViewController: CoreDataViewController, UICollectionViewDelegate {
    
    /******************************************************/
    /******************* Properties **************/
    /******************************************************/
    //MARK: - Properties
    
    
    var collectionView: UICollectionView!
    
    
    /******************************************************/
    /******************* Life Cycle **************/
    /******************************************************/
    //MARK: - Life Cycle
    
    open override func viewDidLoad() {
        super.viewDidLoad()
     
        // Get the stack
//        let delegate = UIApplication.shared.delegate as! AppDelegate
//        stack = delegate.stack
    }
    
    /******************************************************/
    /******************* UIcollectionViewDelegate Delegate and Data Source **************/
    /******************************************************/
    //MARK: - UIcollectionViewDelegate Delegate and Data Source
    
    
    //When a user selects an item from the collection
   public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("This stub should be implimented by a child class")
    }
    
   public func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        print("This stub should be implimented by a child class")
    }
    
}

// MARK: - CoreDataCollectionViewController: NSFetchedResultsControllerDelegate

extension CoreDataCollectionViewController {
    
    override func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        //about to make updates.  wrapping actions with updates will allow for animation and auto reloading
        //self.collectionView.beginUpdates()
    }
    
    override func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        //stack.save()
        
//        if anObject is UnlockedCharacter {
//            
//            switch(type) {
//            case .insert:
//                //from apple documentation
//                stack.save()
//                //self.collectionView.insertItems(at: [newIndexPath!])
//                
//                //TODO: initiate download of terms?
//                //print("case insert")
//            case .delete:
//                //from apple documentation
//                //self.collectionView.deleteItems(at: [indexPath!])
//                //stack.save()
//                print("case delete")
//            case .update:
//                //from apple documentation
//                stack.save()
//                //nothing is needed here because when data is updated the collectionView displays datas current state
//                //print("case update")
//            case .move:
//                //TODO: move a cell... this may not be needed
//                //print("case move")
//                break
//            }
//            
//            //save
//            
//        } else if anObject is UnlockedPerk {
//            
//            switch(type) {
//            case .insert:
//                //from apple documentation
//                stack.save()
//                //self.collectionView.insertItems(at: [newIndexPath!])
//                
//                //TODO: initiate download of terms?
//            //print("case insert")
//            case .delete:
//                //from apple documentation
//                //self.collectionView.deleteItems(at: [indexPath!])
//                //stack.save()
//                print("case delete")
//            case .update:
//                //from apple documentation
//                stack.save()
//                //nothing is needed here because when data is updated the collectionView displays datas current state
//            //print("case update")
//            case .move:
//                //TODO: move a cell... this may not be needed
//                //print("case move")
//                break
//            }
//            
//            //save
//            
//        }

    }
    
    override func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        //finished with updates, allow table view to animate and reload
        //self.collectionView.endUpdates()
        if let cV = self.collectionView {
            cV.reloadData()
        }
        
        //self.collectionView!.reloadData()
    }
}
