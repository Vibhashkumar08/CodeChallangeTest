//
//  MusicListResource.swift
//  CodeChallangeTest
//
//  Created by Vibhash Kumar on 08/07/21.
//

import Foundation

struct MusicListResource {
    
    let countryURL = URL(string: ApiEndpoints.getMusicList)!
    
    func getMusicList(completion : @escaping(_ result : MusicResponseData?) -> Void){
         let httpUtility = HttpUtility()
    
        httpUtility.getApiData(requestUrl: countryURL, resultType: MusicResponseData.self) { (musicApiResponse) in
                _ = completion(musicApiResponse)
            }
         
    }
    
    
}
