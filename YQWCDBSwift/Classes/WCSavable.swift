//
//  WCSavable.swift
//  WanderingEarth
//
//  Created by 王叶庆 on 2019/5/28.
//  Copyright © 2019 王叶庆. All rights reserved.
//

import Foundation
import WCDBSwift
import SwiftyBeaver

public extension Database {
    func saveOrUpdate<Object>(_ object: Object) where Object: TableCodable  {
        do {
            try WCDBManager.shared.db?.insertOrReplace(objects: object, intoTable: "\(Object.self)")
        } catch let error {
            SwiftyBeaver.error(error)
        }
    }
}
