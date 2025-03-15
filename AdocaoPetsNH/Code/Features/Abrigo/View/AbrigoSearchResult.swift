//
//  PetsSearchResult.swift
//  AdocaoPetsNH
//
//  Created by Roberto Edgar Geiss on 10/03/25.
//

// import SwiftData
// import SwiftUI
//
// struct AbrigoSearchResult: View {
//  @Environment(\.modelContext) private var context
//  @Binding var searchText: String
//  @Query private var abrigos: [Abrigo]
//
//  init(searchText: Binding<String>) {
//    _searchText = searchText
//    if searchText.wrappedValue.isEmpty {
//      _abrigos = Query(sort: \.creationDate)
//    } else {
//      let term = searchText.wrappedValue
//      _abrigos = Query(filter: #Predicate { abrigos in
//          abrigos.nome.contains(term)
//        }, sort: \.nome)
//    }
//  }
//
//  var body: some View {
//    ForEach(abrigos) { abrigo in
//      PetGridItem(abrigo: abrigo)
//        .padding([.trailing, .leading], 10)
//    }
//    .onDelete(perform: deletePets(indexes:))
//  }
//
//  private func deletePets(indexes: IndexSet) {
//    for index in indexes {
//      context.delete(abrigos[index])
//    }
//  }
// }
