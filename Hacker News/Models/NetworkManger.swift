
import Foundation
import SwiftUI
class NetworkManger:ObservableObject

{
    @Published var posts = [Post]()
    func fetchData()
    {
         let urlString =  "https://hn.algolia.com/api/v1/search?tags=front_page"
        performRequest(urlString: urlString)
      
    }
    
    func performRequest (urlString:String)
    {
        if let url = URL(string: urlString)
        {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url)
            { data, response, error in
                if let error = error {
                    print("error caused by :\(error)")
                    return
                }
                else if let safeData = data
                {
                   if let recivedData =  self.parseJSON(safeData)
                    {
                       DispatchQueue.main.async {
                           self.posts=recivedData.hits
                       }
                   }
                }
                
            }
            task.resume()
    }
    
    }
    func parseJSON(_ newsData:Data) ->PostData?
    {
        let decoder = JSONDecoder()
        do
        {
            let decodedData = try decoder.decode(PostData.self, from: newsData)
           return decodedData
        }
        catch
        {
            print(error)
            return nil
        }
    }
}
