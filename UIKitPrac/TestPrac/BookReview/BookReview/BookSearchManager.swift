//
//  BookSearchManager.swift
//  BookReview
//
//  Created by SUCHAN CHANG on 2023/11/07.
//

import Alamofire
import Foundation

struct BookSearchManager {
    func request(from keyword: String, completionHanlder: @escaping ([Book]) -> Void) {
        guard let url = URL(string: "https://openapi.naver.com/v1/search/book.json") else { return }
        
        let parameters = BookSearchRequestModel(query: keyword)
        
        let headers: HTTPHeaders = [
            "X-Naver-Client-Id": "lyvL1_GKaV1ZK5J8UJwu",
            "X-Naver-Client-Secret": "1boRCjPrg1"
        ]
        
        AF
            .request(url, method: .get, parameters: parameters, headers: headers)
            .responseDecodable(of: BookSearchResponseModel.self) { response in
                switch response.result {
                case .success(let result):
                    completionHanlder(result.items)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            .resume()
    }
}
