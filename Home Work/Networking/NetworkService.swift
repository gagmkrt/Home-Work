//
//  NetworkService.swift
//  Home Work
//
//  Created by Gag Mkrtchyan on 7/10/20.
//  Copyright © 2020 Gag Mkrtchyan. All rights reserved.
//

import Foundation
import Alamofire

public class NewWorkService {
    
    static let baseUrl = "https://cityshopapi.abmdemo.me/api/"
    static let alamofireSessionWork = Alamofire.Session.default
    
    class func request<T: Codable>(url: String, method: HTTPMethod, params: Parameters?, encoding: JSONEncoding, complection: @escaping (T) -> Void) {
        
        alamofireSessionWork.request(baseUrl + url, method: method, parameters: params, encoding: encoding, headers: getHeaders()).responseJSON { (resp) in
            
            switch resp.result {
                
            case .success(let data):
                print(data)
                
                do {
                    
                    let jsonData = try JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)
                    let responseData = try JSONDecoder().decode(BaseResponseModel<T>.self, from: jsonData)
                    complection(responseData.data)
                    
                } catch {
                    print(error)
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    
    
    class func getHeaders() -> HTTPHeaders {
        return ["Authorization" : "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIzMGMzN2Y3NS03NjZjLTQ3OTAtOGFlZC1kMGY4ZWE5ZGViNjEiLCJ1bmlxdWVfbmFtZSI6IiszNzQ5NDE3MjgzOSIsImp0aSI6ImI0Zjg1YTU5LWE3ZDctNDFiMi1iNmNlLTdmOGY1Y2FmN2Q5MiIsImlhdCI6MTU5NDM4NjEyNywiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiVXNlciIsIm5iZiI6MTU5NDM4NjEyNywiZXhwIjoxNjAzMDI2MTI3LCJpc3MiOiJ3ZWJBcGkiLCJhdWQiOiJodHRwOi8vbG9jYWxob3N0OjUwMDIvIn0.Dz0lOGG3q4eLqMc3GEFx8Jwe9-uVvEUfYLcH8NDbaSY"]
    }
}



