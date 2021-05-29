library(openxlsx)
library(ggplot2)
mahasiswa <- read.xlsx("https://storage.googleapis.com/dqlab-dataset/mahasiswa.xlsx",sheet = "Sheet 1")
# Menghitung Jumlah data by Fakultas
summarybyfakultas <- aggregate(x=mahasiswa$JUMLAH, by=list(kategori=mahasiswa$Fakultas, Tahun=mahasiswa$ANGKATAN), FUN=sum)
# Mengambil Mahasiswa Field Jumlah By/Berdasarkan Fakultas dan Angkatan trus di Jumlahkan dengan func SUM
summarybyfakultas <- setNames(summarybyfakultas, c("Fakultas", "tahun", "JumlahMahasiswa"))
# Membuat DataSet menggunakan isi dari summarybyfakultas trus buat vector untuk judul nya
summarybyfakultas
summarybyfakultas$tahun = as.factor(summarybyfakultas$tahun)
#Filter Dataset Hanya Ada Jurusan ICT dan Ilmu Komunikasi
filtering <- summarybyfakultas[summarybyfakultas$Fakultas %in% c("ICT", "Ilmu Komunikasi"),]
#Dataset to GGPLOT/Grafik
ggplot(filtering, aes(x=Fakultas, y=JumlahMahasiswa)) + geom_bar(stat="identity", aes(fill=tahun), width = 0.8, position =  position_dodge(width = 0.8)) + theme_classic()