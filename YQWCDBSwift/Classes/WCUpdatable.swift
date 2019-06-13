//
//  WCUpdatable.swift
//  WanderingEarth
//
//  Created by 王叶庆 on 2019/5/27.
//  Copyright © 2019 王叶庆. All rights reserved.
//

import Foundation
import WCDBSwift
import SwiftyBeaver

extension Database {
    func update<Object>(_ object: Object, where condition: Condition? = nil) where Object : TableEncodable {
        do {
            try WCDBManager.shared.db?.update(table: "\(Object.self)", on: Object.Properties.all, with: object, where: condition)
        } catch let error {
            SwiftyBeaver.error(error)
        }
    }
}
