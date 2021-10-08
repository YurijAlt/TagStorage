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
        let container = NSPersistentContainer(name: "Storage")
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
        addTag.img = tag.img
        addTag.name = tag.name
        addTag.brand = tag.brand
        addTag.dateStamp = tag.dateStamp
        addTag.wash30 = tag.wash30
        addTag.wash40 = tag.wash40
        addTag.wash50 = tag.wash50
        addTag.wash60 = tag.wash60
        addTag.handWash = tag.handWash
        addTag.doNotWash = tag.doNotWash
        addTag.bleachingWithChlorine = tag.bleachingWithChlorine
        addTag.nonChlorineBleach = tag.nonChlorineBleach
        addTag.doNotBleach1 = tag.doNotBleach1
        addTag.doNotBleach2 = tag.doNotBleach2
        addTag.tumpleDryingLow = tag.tumpleDryingLow
        addTag.tumpleDryingNormal = tag.tumpleDryingNormal
        addTag.doNotTumpleDry = tag.doNotTumpleDry
        addTag.lineDry = tag.lineDry
        addTag.dryFlat = tag.dryFlat
        addTag.dripDry = tag.dripDry
        addTag.dryInTheShade = tag.dryInTheShade
        addTag.lineDryInTheShade = tag.lineDryInTheShade
        addTag.dryFlatInShade = tag.dryFlatInShade
        addTag.dripDryInShade = tag.dripDryInShade
        addTag.ironAtLowTemp = tag.ironAtLowTemp
        addTag.ironAtMediumTemp = tag.ironAtMediumTemp
        addTag.ironAtHeightTemp = tag.ironAtHeightTemp
        addTag.doNotIron = tag.doNotIron
        addTag.dryCleanHCSOnly = tag.dryCleanHCSOnly
        addTag.cleaningWithHCS = tag.cleaningWithHCS
        addTag.gentleCleaningWithHCS = tag.gentleCleaningWithHCS
        addTag.dryCleanPCEOnly = tag.dryCleanPCEOnly
        addTag.gentleCleaningWithPCE = tag.gentleCleaningWithPCE
        addTag.veryGentleCleaningWithPCE = tag.veryGentleCleaningWithPCE
        addTag.doNotDryClean = tag.doNotDryClean
        addTag.gentleWetCleaning = tag.gentleWetCleaning
        addTag.veryGentleWetCleaning = tag.veryGentleWetCleaning
        addTag.doNotWetClean = tag.doNotWetClean
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
