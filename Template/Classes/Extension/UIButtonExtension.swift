import UIKit

extension UIButton {
    func formatClear() {
        layer.borderColor = UIColor.clear.cgColor
        layer.borderWidth = 0
        layer.cornerRadius = 0
    }
    
    func formatHighlighted() {
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 5
    }
}
