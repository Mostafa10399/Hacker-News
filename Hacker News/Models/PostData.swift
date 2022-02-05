
import Foundation
struct PostData:Codable
{
    let hits : [Post]
}
struct Post:Codable,Identifiable
{
    var id :String
    {
        return objectID
    }
    let title : String
    let url:String?
    let points:Int
    let objectID:String
    let author:String
    let num_comments:Int
    
}
