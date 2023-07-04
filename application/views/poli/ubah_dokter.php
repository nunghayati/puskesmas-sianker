<!-- Begin Page Content -->
<div class="container-fluid">
    <!-- mengubah data dokter -->
    <div class="row">
        <div class="col-lg-6">
            <?php if (validation_errors()) { ?>
                <div class="alert alert-danger" role="alert">
                    <?= validation_errors(); ?>
                </div>
            <?php } ?>
            <!-- memanggil data dokter pada puskesmas -->
            <?php foreach ($dokter as $d) { ?>
                <form action="<?= base_url('poli/ubahDokter'); ?>" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <input type="hidden" name="id" id="id" value="<?php echo $d['id']; ?>">
                        <input type="text" class="form-control form-control-user" id="nama_dok" name="nama_dok" placeholder="Masukkan Nama Dokter" value="<?= $d['nama_dok']; ?>">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control form-control-user" id="ttl" name="ttl" placeholder="Masukkan Tanggal Lahir" value="<?= $d['ttl']; ?>">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control form-control-user" id="jenis_kel" name="jenis_kel" placeholder="Masukkan Jenis Kelamin" value="<?= $d['jenis_kel']; ?>">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control form-control-user" id="alamat" name="alamat" placeholder="Masukkan Alamat Anda" value="<?= $d['alamat']; ?>">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control form-control-user" id="email" name="email" placeholder="Masukkan Email Anda" value="<?= $d['email']; ?>">
                    </div>
                    <div class="form-group">
                        <input type="button" class="form-control form-control-user btn btn-dark col-lg-3 mt-3" value="Kembali" onclick="window.history.go(-1)">
                        <input type="submit" class="form-control form-control-user btn btn-primary col-lg-3 mt-3" value="Update">
                    </div>
                </form>
            <?php } ?>
        </div>
    </div>
</div>