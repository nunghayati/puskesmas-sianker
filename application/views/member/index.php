<!-- Begin Page Content -->
<div class="container-fluid">
   <!-- informasi akun pasien  -->
   <div class="row">
   </div>
   <div class="card mb-3" style="max-width: 540px;">
      <div class="row no-gutters">
         <div class="col-md-4">
            <img src="<?= base_url('assets/img/profile/').$image ?>" class="card-img" alt="">
         </div>

         <div class="col-md-8">
            <div class="card-body">
               <h5 class="card-title"><?= $user; ?></h5>
               <p class="card-text"><?= $email ?></p>
               <p class="card-text">
                  <small class="text-muted">Jadi pasien sejak: <br> <b><?= date('d F Y', $tanggal_input) ?></b></small>
               </p>
            </div>
            <div class="btn btn-info ml-3 my-3">
               <a href="<?= base_url('member/ubahprofile') ?>" class="text-white"><i class="fa fa-user-edit"></i> Ubah Profile</a>
            </div>
         </div>
      </div>
   </div>
</div>
<!-- Container Fluid -->

</div>
<!-- End of main content -->