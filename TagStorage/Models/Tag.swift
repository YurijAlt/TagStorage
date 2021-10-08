//
//  Tag.swift
//  TagStorage
//
//  Created by Юрий Чекалюк on 19.09.2021.
//

import Foundation

struct Tag {
    let img: Data
    let name: String
    let brand: String
    let dateStamp: Date
    let wash30: Bool
    
    let wash40: Bool
    let wash50: Bool
    let wash60: Bool
    let handWash: Bool
    let doNotWash: Bool
    
    let bleachingWithChlorine: Bool
    let nonChlorineBleach: Bool
    let doNotBleach1: Bool
    let doNotBleach2: Bool
    
    let tumpleDryingLow: Bool
    let tumpleDryingNormal: Bool
    let doNotTumpleDry: Bool
    
    let lineDry: Bool
    let dryFlat: Bool
    let dripDry: Bool
    let dryInTheShade: Bool
    let lineDryInTheShade: Bool
    let dryFlatInShade: Bool
    let dripDryInShade: Bool
    
    let ironAtLowTemp: Bool
    let ironAtMediumTemp: Bool
    let ironAtHeightTemp: Bool
    let doNotIron: Bool
    
    let dryCleanHCSOnly: Bool
    let cleaningWithHCS: Bool
    let gentleCleaningWithHCS: Bool
    let dryCleanPCEOnly: Bool
    let gentleCleaningWithPCE: Bool
    let veryGentleCleaningWithPCE: Bool
    let doNotDryClean: Bool
    
    let gentleWetCleaning: Bool
    let veryGentleWetCleaning: Bool
    let doNotWetClean: Bool
    
    
}
