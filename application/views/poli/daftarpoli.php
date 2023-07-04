<? ?>

<div style="padding: 25px;">
  <div class="x-panel">
    <div class="x_content">
      <!-- Menampilkan data poli -->
      <div class="row">
        <!-- Looping Poli -->
        <?php foreach ($poli as $poli) { ?>
          <div class="col-md-2 col-md-3 mb-4">
            <div class="thumbnail" style="height: 370px;">
              <img src="<?= base_url('assets/img/upload/') . $poli->image; ?>" style="max-width:100%; max-height: 100%; height: 330px; width: 380px;">
              <div class="caption">
                <h5 class="mt-3" style="min-height: 40px"><?= $poli->nama_poli ?></h5>
                <p>
                  <?php if ($poli->stok < 1) { ?>
                    <i class="btn btn-outline-primary fas fw fa-shopping-cart">Booking&nbsp;&nbsp; 0</i>
                  <?php } else { ?>
                    <a class="btn btn-success fas fw fa-plus " href="<?= base_url('booking/tambahBooking/' . $poli->id.'/'. date('Y-m-d')) ?>"> Booking</a>
                  <?php } ?>
                  <a class="text-white btn btn-warning fas fw fa-list" href="<?= base_url('detail-poli/' . $poli->id) ?>"> Detail</a>
                </p>
              </div>
            </div>
          </div>
        <?php } ?>
        <!-- End looping -->
      </div>
    </div>
  </div>
</div>