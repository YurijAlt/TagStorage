//
//  Extension + UITabBarItem.swift
//  TagStorage
//
//  Created by Юрий Чекалюк on 28.09.2021.
//

import UIKit

extension UIButton {
    
    func increase() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 1
        pulse.fromValue = 1
        pulse.toValue = 1.2
        layer.add(pulse, forKey: nil)
    }
}
