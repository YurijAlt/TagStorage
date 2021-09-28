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
        pulse.duration = 3
        pulse.fromValue = 0
        pulse.toValue = 1
        layer.add(pulse, forKey: nil)
    }
}
