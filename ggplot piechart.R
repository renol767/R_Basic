library(openxlsx)
library(ggplot2)
mahasiswa <- read.xlsx("https://storage.googleapis.com/dqlab-dataset/mahasiswa.xlsx",sheet = "Sheet 1")
# Menghitung Jumlah data by Fakultas
summarybyfakultas <- aggregate(x=mahasiswa$JUMLAH, by=list(kategori=mahasiswa$Fakultas, Tahun=mahasiswa$ANGKATAN), FUN=sum)
# Mengambil Mahasiswa Field Jumlah By/Berdasarkan Fakultas dan Angkatan trus di Jumlahkan dengan func SUM
summarybyfakultas <- setNames(summarybyfakultas, c("Fakultas", "tahun", "JumlahMahasiswa"))
# Membuat DataSet menggunakan isi dari summarybyfakultas trus buat vector untuk judul nya
summarybyfakultas

piechart <- ggplot(summarybyfakultas, aes(x="", y=JumlahMahasiswa, fill=Fakultas)) + geom_bar(width = 1, stat="identity")
piechart <- piechart + coord_polar("y", start=0) + guides(fill=guide_legend(title = "Fakultas")) + theme_minimal() + ggtitle("Disribusi Mahasiswa per Fakultas") + ylab("Jumlah Mahasiswa")
piechart