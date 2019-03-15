//
//  UIStoryboard+Extension.swift
//  Assignment
//
//  Created by TapashM on 14/03/19.
//  Copyright © 2019 Tapash. All rights reserved.
//

import Foundation
import UIKit

extension UIStoryboard {
    class func main() -> UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
    
    class func initializeViewController<T>(_ viewController: T.Type) -> T where T: UIViewController {
        return UIStoryboard.main().instantiateViewController(withIdentifier: String(describing: viewController)) as! T
    }
}
