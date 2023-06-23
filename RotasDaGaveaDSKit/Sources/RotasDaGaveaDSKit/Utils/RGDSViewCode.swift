//
//  RGDSViewCode.swift
//  
//
//  Created by caiomadeira on 23/06/23.
//

import Foundation

protocol RGDSViewCode: AnyObject {
    
    func setupHierarchy() -> Void
    func setupConfiguration() -> Void
    func setupConstraints() -> Void
    func setupAcessibility() -> Void
}

extension RGDSViewCode {
    
    func setupView() -> Void {
        setupHierarchy()
        setupConfiguration()
        setupConstraints()
        setupAcessibility()
    }
}
