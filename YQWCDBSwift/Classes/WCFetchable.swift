//
//  WCFetchable.swift
//  WanderingEarth
//
//  Created by 王叶庆 on 2019/4/23.
//  Copyright © 2019 王叶庆. All rights reserved.
//

import Foundation
import WCDBSwift
import SwiftyBeaver

protocol WCFetchable {
    associatedtype T: TableCodable
    static func fetchOne(where condition: Condition?) -> T?
    static func fetch(where condition: Condition?, orderBy orderList: [OrderBy]?, limit: Limit?, offset: Offset?) -> [T]?
}

extension WCFetchable {
    static func fetchOne(where condition: Condition? = nil) -> T? {
        guard let db = WCDBManager.shared.db else {
            return nil
        }
        do {
            return try db.getObject(on: T.Properties.all, fromTable: "\(T.self)", where: condition)
        } catch let error {
            SwiftyBeaver.error(error)
            return nil
        }
    }
    
    static func fetch(where condition: Condition? = nil, orderBy orderList: [OrderBy]? = nil, limit: Limit? = nil, offset: Offset? = nil) -> [T]? {
        guard let db = WCDBManager.shared.db else {
            return nil
        }
        do {
            return try db.getObjects(on: T.Properties.all, fromTable: "\(T.self)", where: condition, orderBy: orderList, limit: limit, offset: offset)
        } catch let error {
            SwiftyBeaver.error(error)
            return nil
        }
    }

}
