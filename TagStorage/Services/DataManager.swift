//
//  DataManager.swift
//  TagStorage
//
//  Created by Юрий Чекалюк on 29.09.2021.
//

class DataManager {
    static let shared = DataManager()
    
    let advicePreviewImages = ["one", "two", "three"]
    let adviceMainLabelTexts = [
        "Описание для первого совета",
        "Описание для второго совета",
        "Описание для третьего совета"
    ]
    
    private init() {}
}
