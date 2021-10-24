//
//  Advice.swift
//  TagStorage
//
//  Created by Юрий Чекалюк on 29.09.2021.
//

struct Advice {
    let imageName: String
    let mainLabelText: String
    let detailLabelText: String
}

extension Advice {
    static func getAdviceList() -> [Advice] {
        var advices: [Advice] = []
        let imageNames = DataManager.shared.advicePreviewImages
        let mainLabelTexts = DataManager.shared.adviceMainLabelTexts
        let detailLabelTexts = DataManager.shared.adviceDetailLabelTexts
        for index in 0..<DataManager.shared.adviceMainLabelTexts.count {
            let advice = Advice(
                imageName: imageNames[index],
                mainLabelText: mainLabelTexts[index],
                detailLabelText: detailLabelTexts[index]
            )
            advices.append(advice)
        }
        return advices
    }
}
