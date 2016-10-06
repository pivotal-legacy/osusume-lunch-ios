import Foundation
import UIKit

class ConstraintChecker {

    class func superviewConstraintCount(subview: UIView) -> Int {

        let superview = subview.superview!
        var count = 0

        for constraint in superview.constraints {

            if let firstItem = constraint.firstItem as? NSObject {
                if firstItem == subview {
                    count += 1
                }
            }
            else if let secondItem = constraint.secondItem as? NSObject {
                if secondItem == subview {
                    count += 1
                }
            }
        }
        
        return count
    }
}
