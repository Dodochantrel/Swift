//
//  Exercice3.swift
//  DorianChantrel
//
//  Created by Cours on 24/03/2023.
//

import SwiftUI

struct Exercice3: View {
    struct MovieDetails: Codable {
        let title: String
        let overview: String
        let posterPath: String?
    }
    
    @State var movieTitle: String = ""
    @State var movieDescription: String = ""
    @State var movieImage: UIImage? = nil

    func fetchMovieDetails() {
        let apiKey = "ee6b2b9e0970948e6741d6b7985191fb"
        let movieId = "671"
        let url = "https://api.themoviedb.org/3/movie/\(movieId)?api_key=\(apiKey)"
        let task = URLSession.shared.dataTask(with: URL(string: url)!) { data, response, error in
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let movieDetails = try decoder.decode(MovieDetails.self, from: data!)
                DispatchQueue.main.async {
                    self.movieTitle = movieDetails.title
                    self.movieDescription = movieDetails.overview
                    if let posterPath = movieDetails.posterPath {
                        self.fetchMovieImage(posterPath: posterPath)
                    }
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    func fetchMovieImage(posterPath: String) {
        let baseImageUrl = "https://image.tmdb.org/t/p/w500"
        let url = baseImageUrl + posterPath
        let task = URLSession.shared.dataTask(with: URL(string: url)!) { data, response, error in
            guard let imageData = data else { return }
            DispatchQueue.main.async {
                self.movieImage = UIImage(data: imageData)
            }
        }
        task.resume()
    }
    
    var body: some View {
        VStack {
            if let image = movieImage {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 250)
            } else {
                Color.gray.frame(height: 200)
            }
            Text(movieTitle)
                .fontWeight(.semibold)
                .padding(20)
            Text(movieDescription)
        }
        .onAppear() {
            fetchMovieDetails()
        }
    }
}

struct Exercice3_Previews: PreviewProvider {
    static var previews: some View {
        Exercice3()
    }
}
