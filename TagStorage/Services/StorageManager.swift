//
//  StorageManager.swift
//  TagStorage
//
//  Created by Юрий Чекалюк on 20.09.2021.
//



import CoreData

class StorageManager {

    static let shared = StorageManager()

    // MARK: Core Data stack
    private let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "TagStorage")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    private let viewContext: NSManagedObjectContext
    private init() {
        viewContext = persistentContainer.viewContext
    }


    func fetchData(completion: (Result<[SavedTag], Error>) -> Void) {
        let fetchRequest: NSFetchRequest<SavedTag> = SavedTag.fetchRequest()
        do {
            let addedTags = try viewContext.fetch(fetchRequest)
            completion(.success(addedTags))
        } catch let error {
            completion(.failure(error))
        }
    }

    //MARK: Save and delete Data
    func save(_ tag: Tag) {
        let addTag = SavedTag(context: viewContext)
        addTag.name = tag.name
        addTag.brand = tag.brand
        addTag.stirka = tag.tagStirka
        saveContext()
    }
    


    func delete(_ tag: SavedTag) {
        viewContext.delete(tag)
        saveContext()
    }

    // MARK: CoreData saving support
    func saveContext() {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}
