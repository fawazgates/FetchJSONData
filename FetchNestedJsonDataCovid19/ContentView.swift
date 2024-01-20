import SwiftUI

struct ContentView: View {
    @ObservedObject var fetch = ApiServices()

    var body: some View {
        
        NavigationView {
            VStack {
                ForEach(fetch.datatotal) { data in
                    //kolom 1
                    HStack(spacing:10) {
                        HStack {
                            Spacer()
                            VStack {
                                Image(systemName: "heart.fill").foregroundColor(Color.white)
                                Text("Sembuh").font(.headline).foregroundColor(Color.white)
                                Text("\(data.jumlah_sembuh)").font(.headline).foregroundColor(Color.white)
                            }
                            Spacer()
                        }
                        .frame(height: 100)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(20)
                        
                        HStack {
                            Spacer()
                            VStack {
                                Image(systemName: "plus.circle.fill").foregroundColor(Color.white)
                                Text("Positif").font(.headline).foregroundColor(Color.white)
                                Text("\(data.jumlah_positif)").font(.headline).foregroundColor(Color.white)
                            }
                            Spacer()
                        }
                        .frame(height: 100)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(20)
                    }
                    
                    //kolom 2
                    
                    HStack(spacing:10) {
                        HStack {
                            Spacer()
                            VStack {
                                Image(systemName: "bed.double.fill").foregroundColor(Color.white)
                                Text("Dirawat").font(.headline).foregroundColor(Color.white)
                                Text("\(data.jumlah_dirawah)").font(.headline).foregroundColor(Color.white)
                            }
                            Spacer()
                        }
                        .frame(height: 100)
                        .padding()
                        .background(Color.orange)
                        .cornerRadius(20)
                        
                        HStack {
                            Spacer()
                            VStack {
                                Image(systemName: "waveform.patch.ecg").foregroundColor(Color.white)
                                Text("Meninggal").font(.headline).foregroundColor(Color.white)
                                Text("\(data.jumlah_meninggal)").font(.headline).foregroundColor(Color.white)
                            }
                            Spacer()
                        }
                        .frame(height: 100)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(20)
                    }
                    Spacer()
                    
                    if(fetch.isLoading){
                        VStack {
                            Indicator()
                            Text("Please wait...")
                        }.padding()
                            .background(Color.white)
                            .cornerRadius(20)
                            .shadow(color: Color.secondary, radius:20)
                    }
                }
            }.padding()
                .navigationTitle("Covid19 Data")
        }
    }
}

//komponen indicator
struct Indicator : UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<Indicator>) -> UIActivityIndicatorView {
        let indi = UIActivityIndicatorView(style: .large)
        indi.color = UIColor.red
        return indi
    }
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<Indicator>) {
        uiView.startAnimating()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
