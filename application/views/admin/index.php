<!-- Begin Page Content -->
<div class="container-fluid">
   <!-- row ux-->
   <div class="row">
      <div class="col-xl-3 col-md-6 mb-4">
         <div class="card border-left-dark shadow h-100 py-2 bg-info">
            <div class="card-body">
               <div class="row no-gutters align-items-center">
                  <div class="col mr-2">
                     <div class="text-md font-weight-bold text-white text-uppercase mb-1">Jumlah Pasien</div>
                     <div class="h1 mb-0 font-weight-bold text-white">
                        <?= $this->ModelUser->getUserWhere(['role_id' => 2])->num_rows(); ?></div>
                  </div>
                  <div class="col-auto">
                     <a href="<?= base_url('user/anggota'); ?>"><i class="fas fa-users fa-3x text-white"></i></a>
                  </div>
               </div>
            </div>
         </div>
      </div>

      <div class="col-xl-3 col-md-6 mb-4">
         <div class="card border-left-info shadow h-100 py-2 bg-dark">
            <div class="card-body">
               <div class="row no-gutters align-items-center">
                  <div class="col mr-2">
                     <div class="text-md font-weight-bold text-white text-uppercase mb-1">Jumlah Dokter</div>
                     <div class="h1 mb-0 font-weight-bold text-white">
                        <?= $this->ModelPoli->DokterWhere(['dokter'])->num_rows(); ?></div>
                  </div>
                  <div class="col-auto">
                     <a href="<?= base_url('poli/dokter'); ?>"><i class="fas fa-users fa-3x text-white"></i></a>
                  </div>
               </div>
            </div>
         </div>
      </div>

      <div class="col-xl-3 col-md-6 mb-4">
         <div class="card border-left-dark shadow h-100 py-2 bg-info">
            <div class="card-body">
               <div class="row no-gutters align-items-center">
                  <div class="col mr-2">
                     <div class="text-md font-weight-bold text-white text-uppercase mb-1">Kuota Pasien Terdaftar</div>
                     <div class="h1 mb-0 font-weight-bold text-white">
                        <?php
                        $where = ['stok != 0'];
                        $totalstok = $this->ModelPoli->total('stok', $where); echo $totalstok;
                        ?>
                     </div>
                  </div>
                  <div class="col-auto">
                     <a href="<?= base_url('poli'); ?>"><i class="fas fa-book fa-3x text-white"></i></a>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <div class="col-xl-3 col-md-6 mb-4">
         <div class="card border-left-info shadow h-100 py-2 bg-dark">
            <div class="card-body">
               <div class="row no-gutters align-items-center">
                  <div class="col mr-2">
                     <div class="text-md font-weight-bold text-white text-uppercase mb-1">Poli yang dibooking</div>
                     <div class="h1 mb-0 font-weight-bold text-white">
                        <?php
                        $where = ['dibooking !=0'];
                        $totaldibooking = $this->ModelPoli->total('dibooking', $where); echo $totaldibooking;
                        ?>
                     </div>
                  </div>
                  <div class="col-auto">
                     <a href="<?= base_url('periksa/daftarBooking'); ?>"><i class="fas fa-newspaper fa-3x text-white"></i></a>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>

 <!-- end row ux-->
 <!-- Divider -->
 <hr class="sidebar-divider">
 <!-- row table-->
 <div class="row">
   <div class="table-responsive table-bordered col-sm-5 ml-auto mr-auto mt-2">
      <div class="page-header">
         <span class="fas fa-users text-dark mt-2 "> Data User</span>
         <a class="text-success" href="<?php echo base_url('user/anggota'); ?>"><i class="fas fa-search mt-2 float-right"> Tampilkan</i></a>
      </div>
      <table class="table mt-3">
         <thead>
            <tr>
               <th>#</th>
               <th>Nama Anggota</th>
               <th>Alamat</th>
               <th>Email</th>
               <th>Role ID</th>
               <th>Aktif</th>
               <th>Member Sejak</th>
            </tr>
         </thead>
         <tbody>
            <?php
            $i = 1;
            foreach ($anggota as $a) { ?>
               <tr>
                  <td><?= $i++; ?></td>
                  <td><?= $a['nama']; ?></td>
                  <td><?= $a['alamat']; ?></td>
                  <td><?= $a['email']; ?></td>
                  <td><?= $a['role_id']; ?></td>
                  <td><?= $a['is_active']; ?></td>
                  <td><?= date('Y', $a['tanggal_input']); ?></td>
               </tr>
            <?php } ?>
         </tbody>
      </table>
   </div>
   <div class="table-responsive table-bordered col-sm-5 ml-auto mr-auto mt-2">
      <div class="page-header">
         <span class="fas fa-book text-dark mt-2"> Data Poliklinik</span>
         <a href="<?= base_url('poli'); ?>"><i class="fas fa-search text-success mt-2 float-right"> Tampilkan</i></a>
      </div>
      <div class="table-responsive">
         <table class="table mt-3" id="table-datatable">
            <thead>
               <tr>
                  <th>#</th>
                  <th>Nama Poliklinik</th>
                  <th>Nama Dokter</th>
                  <th>Jadwal Prakter</th>
                  <th>Kuota Periksa</th>
               </tr>
            </thead>
            <tbody>
               <?php
               $i = 1;
               foreach ($poli as $p) { ?>
                  <tr>
                     <td><?= $i++; ?></td>
                     <td><?= $p['nama_poli']; ?></td>
                     <td><?= $p['dc']; ?></td>
                     <td><?= $p['jam_praktek']; ?></td>
                     <td><?= $p['stok']; ?></td>
                  </tr>
               <?php } ?>
            </tbody>
         </table>
      </div>
   </div>
</div>
</div>
