//
//  ServiceClass.swift
//  CodeChallangeTest
//
//  Created by Vibhash Kumar on 08/07/21.
//

import Foundation

struct HttpUtility
{
    func getApiData<T:Decodable>(requestUrl: URL, resultType: T.Type, completionHandler:@escaping(_ result: T?)-> Void)
    {
        URLSession.shared.dataTask(with: requestUrl) { (responseData,
                                                        httpUrlResponse,
                                                        error) in
            if(error == nil && responseData != nil && responseData?.count != 0)
            {
                print(T.self)
                
                let decoder = JSONDecoder()
                if let value = String(data: responseData!, encoding: String.Encoding.ascii) {
                    if let jsonData = value.data(using: String.Encoding.utf8) {
                        do {
                            let jsonResponse = try JSONSerialization.jsonObject(with: jsonData, options: [])
                            
                            let convertedToData = try JSONSerialization.data(withJSONObject: jsonResponse)
                            
                            let response = try decoder.decode(T.self, from: convertedToData)
                            
                            _ = completionHandler(response)
                         }
                            catch let error{
                                debugPrint("error occured while decoding = \(error.localizedDescription)")
                            }
                        }
                        
                }
                
                
               
            }

        }.resume()
    }

    
}
