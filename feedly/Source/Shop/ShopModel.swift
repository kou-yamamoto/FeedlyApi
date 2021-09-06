//
//  FirestoreModel.swift
//  feedly
//
//  Created by kou yamamoto on 2021/08/29.
//

import Foundation
import Alamofire
import RxSwift
import Firebase
import FirebaseFirestoreSwift

struct Food: Codable {
    let name: String
    let price: Int
    let documentID: String
}

protocol ShopModelProtocol {
    func resetLastDocument()
    func getShops() -> Single<[Shop]>
}

final class ShopModel: ShopModelProtocol {

    private var lastDocument: QueryDocumentSnapshot?

    // MARK: - Function

    func resetLastDocument() {
        self.lastDocument = nil
    }

    func getShops() -> Single<[Shop]> {

        let shopCollectionRef = FirestoreCosntant.getShopCollectionRef()
        let shopQuery = FirestoreCosntant.getShopQuery(collectionRef: shopCollectionRef, lastDocument: self.lastDocument)

        return Single<[Shop]>.create { single in

            shopQuery.getDocuments { [weak self] (documentSnapshots, error) in

                if let error = error {
                    single(.failure(error))
                }

                if let documentSnapshots = documentSnapshots {
                    let shops = documentSnapshots.documents.compactMap { FirestoreCosntant.generateShop(documentSnapshot: $0) }
                    self?.lastDocument = documentSnapshots.documents.last
                    single(.success(shops))
                }
            }
            return Disposables.create()
        }
    }
}
