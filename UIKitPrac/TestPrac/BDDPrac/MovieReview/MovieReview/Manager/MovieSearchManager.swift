//
//  MovieSearchManager.swift
//  MovieReview
//
//  Created by SUCHAN CHANG on 2023/11/08.
//

import Foundation
import Alamofire

protocol MovieSearchManagerProtocol {
    func request(form keyword: String, completionHandler: @escaping ([Movie]) -> Void)
}

struct MovieSearchManager: MovieSearchManagerProtocol {
    func request(form keyword: String, completionHandler: @escaping ([Movie]) -> Void) {
        guard let url = URL(string: "https://openapi.naver.com/v1/search/movie.json") else { return }
        
        let parameters = MovieSearchRequestModel(query: keyword)
        let headers: HTTPHeaders = [
            "X-Naver-Client-Id": "lyvL1_GKaV1ZK5J8UJwu",
            "X-Naver-Client-Secret": "1boRCjPrg1"
        ]

        AF.request(
            url,
            method: .get,
            parameters: parameters,
            headers: headers
        )
        .responseDecodable(of: MovieSearchResponseModel.self) { response in
            switch response.result {
            case .success(let result):
                completionHandler(result.item)
            case .failure(let error):
                print(error)
            }
        }
        .resume()
    }
}
