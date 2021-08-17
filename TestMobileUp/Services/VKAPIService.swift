//
//  VKAPIService.swift
//  TestMobileUp
//
//  Created by Никита Дмитриев on 17.08.2021.
//

import Foundation

final class VkAPIService {
    
    let session = Session.shared
    
    enum ApiMethod {
        case photo
        
        var path: String {
            switch self {
            case .photo:
                return "/method/photos.get"
                
            }
        }
        
        var parameters: [String: String] {
            switch self {
            case .photo:
                return ["owner_id": "-128666765", "album_id": "266276915"]
                
            }
        }
    }
     func request(_ method: ApiMethod, completion: @escaping (Data?) -> Void) {

        DispatchQueue.global(qos:.utility).async {

            var components = URLComponents()
            components.scheme = "https"
            components.host = "api.vk.com"
            components.path = method.path
            let defaultQueryItems = [
                URLQueryItem(name: "access_token", value: self.session.token),
                URLQueryItem(name: "v", value: "5.131")
            ]
            let methodQueryItems = method.parameters.map {
                URLQueryItem(name: $0, value: $1)
            }
            components.queryItems = defaultQueryItems + methodQueryItems


            guard let url = components.url else {
                completion(nil)
                return
            }
            print(url)
            let session = URLSession.shared
            let task = session.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print(error)
                }
                completion(data)
            }
            task.resume()
            print(url)
        }
    }
}
