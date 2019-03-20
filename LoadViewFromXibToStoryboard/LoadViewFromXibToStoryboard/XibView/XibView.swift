//
//  XibView.swift
//  LoadViewFromXibToStoryboard
//
//  Created by Sergey Biloshkurskyi on 3/20/19.
//  Copyright © 2019 Sergey Biloshkurskyi. All rights reserved.
//

import UIKit

@IBDesignable
class XibView : UIView {
    
    var contentView: UIView?
    @IBInspectable
    var nibName: String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        xibSetup()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        xibSetup()
    }
    
    func xibSetup() {
        guard let view = loadViewFromNib() else { return }
        
        view.frame = bounds
        view.autoresizingMask =
            [.flexibleWidth, .flexibleHeight]
        addSubview(view)
        contentView = view
    }
    
    func loadViewFromNib() -> UIView? {
        guard let nibName = nibName else { return nil }
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(
            withOwner: self,
            options: nil).first as? UIView
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        xibSetup()
        contentView?.prepareForInterfaceBuilder()
    }
}
