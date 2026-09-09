Create Table rakamin-pbi-data-analytics.kimia_farma.tabel_analisa AS
Select
  ft.transaction_id,
  ft.date,
  ft.branch_id,
  kc.branch_name,
  kc.kota,
  kc.provinsi,
  kc.rating AS rating_cabang,
  ft.customer_name,
  ft.product_id,
  p.product_name,
  p.price AS actual_price,
  ft.discount_percentage,

  # Menghitung persentase_gross_laba berdasarkan actual_price
  Case
    When p.price <= 50000 Then 0.10
    When p.price > 50000 And p.price <= 100000 Then 0.15
    When p.price > 100000 And p.price <= 300000 Then 0.20
    When p.price > 300000 And p.price <= 500000 Then 0.25
    When p.price > 500000 Then 0.30
  End AS persentase_gross_laba,

  # Menghitung nett_sales atau harga setelah diskon
  p.price * (1 - ft.discount_percentage) AS nett_sales,

  # Menghitung nett_profit atau keuntungan yang diperoleh Kimia Farma
  (p.price * (1 - ft.discount_percentage)) *
  ( 
    Case
      When p.price <= 50000 Then 0.10
      When p.price > 50000 And p.price <= 100000 Then 0.15
      When p.price > 100000 And p.price <= 300000 Then 0.20
      When p.price > 300000 And p.price <= 500000 Then 0.25
      When p.price > 500000 Then 0.30
    End
  ) AS nett_profit,

  ft.rating AS rating_transaksi,

From rakamin-pbi-data-analytics.kimia_farma.kf_final_transaction AS ft
Left Join rakamin-pbi-data-analytics.kimia_farma.kf_kantor_cabang AS kc
  ON ft.branch_id = kc.branch_id
Left Join rakamin-pbi-data-analytics.kimia_farma.kf_product AS p
  ON ft.product_id = p.product_id;