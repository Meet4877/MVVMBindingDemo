//
//  UserVM.swift
//  MVVMBindingDemo
//
//  Created by Meet Shingala on 13/06/23.
//

import Foundation

typealias setData = () -> Void

class UserVM {
    
    var userModel: [UserModel] = []
    var setdata : setData = {}
    
    func fetchData() {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data,_,_) in
            guard let data = data else { return }
            do {
                let userModel : [UserModel] = try JSONDecoder().decode([UserModel].self,from: data)
                self.userModel = userModel
                self.setdata()
            }
            catch {
                print(error)
            }
        }
        task.resume()
    }
}
