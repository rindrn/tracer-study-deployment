cube(`DimProdi`, {
  sql_table: `public.dim_prodi`,

  // Catatan SCD:
  // id_prodi = natural key (business key)
  // id_prod  = surrogate key SERIAL (dipakai sebagai FK di semua fact table)
  // Cube.js primary_key harus pakai surrogate key agar join ke fact benar

  dimensions: {
    // ── Surrogate Key — dipakai sebagai FK di fact ────────────
    prodi_sk: {
      sql: `prodi_sk`,
      type: `number`,
      primary_key: true,    // FK di fact: prodi_sk → dim_prodi.id_prod
    },
    // ── Natural / Business Key ────────────────────────────────
    id_prodi: {
      sql: `id_prodi`,
      type: `number`,
    },
    kode_prodi: {
      sql: `kode_prodi`,
      type: `string`,
    },
    nama_prodi: {
      sql: `nama_prodi`,
      type: `string`,
    },
    jurusan: {
      sql: `jurusan`,
      type: `string`,
    },
    valid_from: {
      sql: `valid_from`,
      type: `time`,
    },
    valid_to: {
      sql: `valid_to`,
      type: `time`,
    },
    flag_prodi: {
      sql: `flag_prodi`,
      type: `boolean`,
    },
  },
});