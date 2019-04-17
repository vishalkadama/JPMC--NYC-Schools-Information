//
//  React.swift
//  20190416-[VishalKumarKadma]-NYCSchools
//
//  Created by VishalKumar Kadma on 4/16/19.
//  Copyright © 2019 VishalKumar Kadma. All rights reserved.
//

import Foundation
internal class React<T> {
    
    private let lock = NSRecursiveLock.init()
    
    typealias Listener = (T?) -> ()
    var listeners: [Listener]?
    
    private var _value:T?
    
    func bind(_ listener: Listener?) {
        if let listener = listener{
            self.listeners?.append(listener)
        }
    }
    
    func bindAndFire(_ listener: Listener?) {
        if let listener = listener{
            self.listeners?.append(listener)
        }
        listener?(value)
    }
    
    public var value: T?{
        
        get{
            lock.lock(); defer { lock.unlock() }
            return _value
        }
        
        set{
            lock.lock(); defer { lock.unlock() }
            _value = newValue
            
            for listener in listeners ?? []{
                listener(value)
            }
        }
        
    }
    
    init(_ v: T?=nil) {
        _value = v
        listeners = []
    }
    
    deinit {
        listeners?.removeAll()
        listeners = nil
    }
}
