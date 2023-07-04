<!-- Begin Page Content -->
<div class="container-fluid">
    <!-- Menampilkan data poli -->
    <div class="row">
        <div class="col-lg-12">
            <?php if(validation_errors()){?>
            <div class="alert alert-danger" role="alert">
                <?= validation_errors();?>
            </div>
            <?php }?>
            <a href="" class="btn btn-info  mb-3" data-toggle="modal" data-target="#poliBaruModal"><i class="fas fa-file-alt"></i> Tambah Poliklinik</a>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Nama Poliklinik</th>
                        <th scope="col">Nama Dokter</th>
                        <th scope="col">Kuota Periksa</th>
                        <th scope="col">Jadwal Praktek</th>
                        <th scope="col">Dibooking</th>
                        <th scope="col">Gambar</th>
                        <th scope="col">Pilihan</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    //memanggil data pada database
                    $a = 1;
                    foreach ($poli as $p) { ?>
                    <tr>
                        <th scope="row"><?= $a++; ?></th>
                        <td><?= $p['nama_poli']; ?></td>
                        <td><?= $p['dc']; ?></td>
                        <td><?= $p['stok']; ?></td>
                        <td><?= $p['jam_praktek']; ?></td>
                        <td><?= $p['dibooking']; ?></td>
                        <td>
                            <picture>
                                <source srcset="" type="image/svg+xml">
                                <img src="<?= base_url('assets/img/upload/') . $p['image'];?>" class="img-fluid img-thumbnail" alt="...">
                            </picture>
                        </td>
                        <td>
                            <a href="<?= base_url('poli/ubahPoli/').$p['id'];?>" class="badge badge-info"><i class="fas fa-edit"></i> Ubah</a>
                            <a href="<?= base_url('poli/hapusPoli/').$p['id'];?>" onclick="return confirm('Kamu yakin akan menghapus <?= $judul.' '.$p['nama_poli'];?> ?');" class="badge badge-danger"><i class="fas fa-trash"></i> Hapus</a>
                        </td>
                    </tr>
                    <?php } ?>
                </tbody>
            </table>
        </div>
    </div>
</div>
<!-- /.container-fluid -->
</div>
<!-- End of Main Content -->
<!-- Modal Tambah poliklinik-->
<div class="modal fade" id="poliBaruModal" tabindex="-1" role="dialog" aria-labelledby="poliBaruModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="poliBaruModalLabel">Tambah Poliklinik</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="<?= base_url('poli'); ?>" method="post" enctype="multipart/form-data">
                <div class="modal-body">
                    <div class="form-group">
                        <input type="text" class="form-control form-control-user" id="nama_poli" name="nama_poli" placeholder="Masukkan Nama Poliklinik">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control form-control-user" id="dc" name="dc" placeholder="Masukkan Nama Dokter">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control form-control-user" id="jam_praktek" name="jam_praktek" placeholder="Masukkan Jam Praktek">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control form-control-user" id="stok" name="stok" placeholder="Masukkan Kuota Periksa">
                    </div>
                    <div class="form-group">
                        <input type="file" class="form-control form-control-user" id="image" name="image">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-dark" data-dismiss="modal"><i class="fas fa-ban"></i>Close</button>
                    <button type="submit" class="btn btn-info"><i class="fas fa-plus-circle"></i> Tambah</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- End of Modal Tambah Mneu -->