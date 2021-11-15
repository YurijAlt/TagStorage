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
    
    func fetchbyDate(completion: (Result<[SavedTag], Error>) -> Void) {
        let fetchRequest: NSFetchRequest<SavedTag> = SavedTag.fetchRequest()
        let sortbyDate = NSSortDescriptor(key: #keyPath(SavedTag.dateStamp), ascending: true)
        fetchRequest.sortDescriptors = [sortbyDate]
        do {
            let addedTags = try viewContext.fetch(fetchRequest)
            completion(.success(addedTags))
        } catch let error {
            completion(.failure(error))
        }
    }
    
    func fetchbyAZ(completion: (Result<[SavedTag], Error>) -> Void) {
        let fetchRequest: NSFetchRequest<SavedTag> = SavedTag.fetchRequest()
        let sortbyAZ = NSSortDescriptor(key: #keyPath(SavedTag.name), ascending: true)
        fetchRequest.sortDescriptors = [sortbyAZ]
        do {
            let addedTags = try viewContext.fetch(fetchRequest)
            completion(.success(addedTags))
        } catch let error {
            completion(.failure(error))
        }
    }
    
    

    //MARK: Save and delete Data
    
    func save(
        _ img: Data,
        _ name: String,
        _ brand: String,
        _ dateStamp: Date,
        _ wash30: Bool,
        _ wash40: Bool,
        _ wash50: Bool,
        _ wash60: Bool,
        _ handWash: Bool,
        _ doNotWash: Bool,
        _ bleachingWithChlorine: Bool,
        _ nonChlorineBleach: Bool,
        _ doNotBleach1: Bool,
        _ doNotBleach2: Bool,
        _ tumpleDryingLow: Bool,
        _ tumpleDryingNormal: Bool,
        _ doNotTumpleDry: Bool,
        _ lineDry: Bool,
        _ dryFlat: Bool,
        _ dripDry: Bool,
        _ dryInTheShade: Bool,
        _ lineDryInTheShade: Bool,
        _ dryFlatInShade: Bool,
        _ dripDryInShade: Bool,
        _ ironAtLowTemp: Bool,
        _ ironAtMediumTemp: Bool,
        _ ironAtHeightTemp: Bool,
        _ doNotIron: Bool,
        _ dryCleanHCSOnly: Bool,
        _ cleaningWithHCS: Bool,
        _ gentleCleaningWithHCS: Bool,
        _ dryCleanPCEOnly: Bool,
        _ gentleCleaningWithPCE: Bool,
        _ veryGentleCleaningWithPCE: Bool,
        _ doNotDryClean: Bool,
        _ gentleWetCleaning: Bool,
        _ veryGentleWetCleaning: Bool,
        _ doNotWetClean: Bool
    ) {
        let savedTag = SavedTag(context: viewContext)
        savedTag.img = img
        savedTag.name = name
        savedTag.brand = brand
        savedTag.dateStamp = dateStamp
        savedTag.wash30 = wash30
        savedTag.wash40 = wash40
        savedTag.wash50 = wash50
        savedTag.wash60 = wash60
        savedTag.handWash = handWash
        savedTag.doNotWash = doNotWash
        savedTag.bleachingWithChlorine = bleachingWithChlorine
        savedTag.nonChlorineBleach = nonChlorineBleach
        savedTag.doNotBleach1 = doNotBleach1
        savedTag.doNotBleach2 = doNotBleach2
        savedTag.tumpleDryingLow = tumpleDryingLow
        savedTag.tumpleDryingNormal = tumpleDryingNormal
        savedTag.doNotTumpleDry = doNotTumpleDry
        savedTag.lineDry = lineDry
        savedTag.dryFlat = dryFlat
        savedTag.dripDry = dripDry
        savedTag.dryInTheShade = dryInTheShade
        savedTag.lineDryInTheShade = lineDryInTheShade
        savedTag.dryFlatInShade = dryFlatInShade
        savedTag.dripDryInShade = dripDryInShade
        savedTag.ironAtLowTemp = ironAtLowTemp
        savedTag.ironAtMediumTemp = ironAtMediumTemp
        savedTag.ironAtHeightTemp = ironAtHeightTemp
        savedTag.doNotIron = doNotIron
        savedTag.dryCleanHCSOnly = dryCleanHCSOnly
        savedTag.cleaningWithHCS = cleaningWithHCS
        savedTag.gentleCleaningWithHCS = gentleCleaningWithHCS
        savedTag.dryCleanPCEOnly = dryCleanPCEOnly
        savedTag.gentleCleaningWithPCE = gentleCleaningWithPCE
        savedTag.veryGentleCleaningWithPCE = veryGentleCleaningWithPCE
        savedTag.doNotDryClean = doNotDryClean
        savedTag.gentleWetCleaning = gentleWetCleaning
        savedTag.veryGentleWetCleaning = veryGentleWetCleaning
        savedTag.doNotWetClean = doNotWetClean
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
