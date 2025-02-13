//
//  LocationCellView.swift
//  Homebox iOS
//
//  Created by Brian Alberta on 9/29/24.
//

import SwiftUI

struct LocationCellView: View {
    @EnvironmentObject var _session: Session
//    @StateObject var viewModel: LocationViewModel
    var locationEntity: LocationTreeEntity
    var body: some View {
        HStack {
            Image(systemName: "mappin.and.ellipse")
            VStack(alignment: .leading) {
                Text(locationEntity.name)
                Text("Children: \(locationEntity.children?.count ?? 0)")
                    .font(.caption)
            }
            Spacer()
        }
    }
}

struct LocationCellView_Previews: PreviewProvider {
    
    static var session: Session {
        let session = Session()
        return session
    }
    
    static var previews: some View {
        Group {
            let sampleLocationEntity = LocationTreeEntity(id: "12345", name: "Basement", type: "Location", children: [LocationTreeEntity(id: "2345", name: "Office", type: "Location", children: nil)])
            LocationCellView(locationEntity: sampleLocationEntity)
                .environmentObject(Self.session)
        }
    }
}
