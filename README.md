## Tentang Dataset
**Project ID**: 'rakamin-pbi-data-analytics'
**Dataset**: 'kimia_farma'
**Tabel**:
- 'kf_final_transaction' = Data transaksi
- 'kf_inventory' = Data inventory
- 'kf_kantor_cabang' = Data pada kantor cabang
- 'kf_product' = Data produk

## Logika Tabel Analisa
Tabel 'tabel_analisa' dibuat dari JOIN 3 tabel
- **JOIN**: 'kf_final_transaction' + 'kf_inventory' + 'kf_kantor_cabang' + 'kf_product'
- **Kolom Baru**:
  - 'persentase_gross_laba': dihitung berdasarkan range harga pakai CASE WHEN
  - 'nett_sales':'price * (1 - discount percentage)'
  - 'nett_profit': 'nett_sales * persentase_gross_laba'

## Author
Nama: Salma Meidina Putri
Tanggal: 9 September 2026
