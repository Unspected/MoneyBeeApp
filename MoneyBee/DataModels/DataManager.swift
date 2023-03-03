//
//  DataManager.swift
//  MoneyBee
//
//  Created by Pavel Andreev on 2/28/23.
//

import Foundation
import CoreData

class DataManager {
    static let shared = DataManager()
    lazy var persistentContainer: NSPersistentContainer = {
      let container = NSPersistentContainer(name: "MoneyBee")
      container.loadPersistentStores(completionHandler: { (storeDescription, error) in
        if let error = error as NSError? {
          fatalError("Unresolved error \(error), \(error.userInfo)")
        }
      })
      return container
    }()
    
    
    func registration(login: String, password: String, firstname: String, lastname: String) -> UserData {
        let newUser = UserData(context: persistentContainer.viewContext)
        newUser.login = login
        newUser.password = password
        newUser.firstName = firstname
        newUser.lastName = lastname
        return newUser
    }
    
    func loadUserData() -> [UserData] {
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<UserData>(entityName: "UserData")
        var userDataContainer = [UserData]()
        do {
            let result = try context.fetch(fetchRequest)
            userDataContainer = result
        } catch {
            print(error)
        }
        return userDataContainer
    }
    
    func checkExistedUser(login: String ) -> Bool {
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<UserData>(entityName: "UserData")
        fetchRequest.predicate = NSPredicate(format: "login = %@", login)
        do {
            let users = try context.fetch(fetchRequest)
            if !users.isEmpty {
                return false
            }
            return true
            
        } catch let error as NSError {
            print("Error fetching user: \(error.localizedDescription)")
            return false
        }
    }
        

    
    //Core Data Saving support
    func save () {
      let context = persistentContainer.viewContext
      if context.hasChanges {
        do {
            try context.save()
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
      }
    }
}



