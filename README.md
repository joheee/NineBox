# mati_murup

# Preface
Game MatiMurup Square didesain agar dimainkan oleh dua pemain secara bergantian dalam
satu device yang sama. Awal permainan memunculkan halaman Setup Permainan seperti
tampak pada gambar 1 dibawah ini. Pemain diharuskan memasukkan nama pemain 1 dan 2,
jumlah ronde, serta tingkat kesulitan yang terdiri dari tiga yakni:
* Tingkat kesulitan Gampang. Pemain harus menghapalkan sekuens / urutan kotak yang
menyala sebanyak 5 buah.
* Tingkat kesulitan Sedang. Pemain harus menghapalkan sekuens / urutan kotak yang
menyala sebanyak 8 buah.
* Tingkat kesulitan Susah. Pemain harus menghapalkan sekuens / urutan kotak yang
menyala sebanyak 12 buah.

# rules
* Matikan interaksi/listener untuk semua 9 kotak (button). Agar pemain tidak dapat
mengklik kotak manapun.
* Random urutan kotak yang akan menyala (pemain tidak boleh tahu urutan ini). Sebagai
contoh pada tingkat kesulitan sedang, terdapat 8 kotak dengan hasil random sebagai
berikut: kotak 4 - 9 - 1 - 3 - 3 - 1 - 7 - 9
* Kotak nomer 4 menyala selama 500 ms (millisecond). Gunakan warna cerah seperti
tampak pada gambar 2b.
* Kotak nomer 4 mati selama 300 ms (millisecond). Kembalikan ke warna default kotak.
* Kembali ke nomer 3 dengan kotak berikutnya sesuai urutan di nomer 2. Jika sudah habis,
maka tampilan berubah seperti pada gambar 2c. Tampilkan perintah “Tekan Tombol
Sesuai Urutan”
* Hidupkan interaksi/listener untuk semua 9 kotak (button), agar pemain mulai dapat
menekan kotak sesuai urutan dan menyelesaikan ronde ini.
* Pemain menekan salah satu kotak untuk memulai input urutan. Dalam kasus ini pemain
harus menekan tombol sesuai urutan: kotak 5 - 9 - 1 - 3 - 3 - 1 - 7 - 9
* Jika pemain salah menekan urutan kotak, maka giliran pemain tersebut berakhir dan
berganti ke pemain kedua.   

# Game that consists of 3 pages
* setup page
* game page
* result page

# setup page
* input pemain 1 dan 2
* input jumlah ronde
* input tingkat kesulitan (gampang, sedang, susah)
* save konfigurasi di shared preferences