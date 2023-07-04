<div class="container">
   <div class="row">
      <div class="col-sm-12 col-md-11">
         <table>
            <?php foreach($agt_booking as $ab) { ?>
            <tr>
               <td>Data Pasien</td>
               <td> : </td>
               <td><?= $ab['nama'] ?></td>
            </tr>
            <?php } ?>
            <tr>
               <td colspan="3">&nbsp;</td>
            </tr>
            <tr>
               <td colspan="3">
                  <hr>
               </td>
            </tr>
         </table>
         
         <!-- menampilkan data poli yang dibooking  -->
         <table class="table table-bordered table-striped table-hover" id="table-datatable">
            <tr>
               <td>No.</td>
               <td>ID Poli</td>
               <td>Nama PoliKlinik</td>
               <td>Nama Dokter</td>
               <td>Jam Praktek</td>
            </tr>
            <!-- memanggil data pada database  -->
            <?php $no=1; foreach($detail as $d) { ?>
            <tr>
               <td><?= $no++ ?></td>
               <td><?= $d['id_poli'] ?></td>
               <td><?= $d['nama_poli'] ?></td>
               <td><?= $d['nama_dok'] ?></td>
               <td><?= $d['jam_praktek'] ?></td>
            </tr>
            <?php } ?>
         </table>
      </div>
      <div class="col-sm-12 col-md-11 text-center">
         <a href="#" onclick="window.history.go(-1)" class="btn btn-outline-dark"><i class="fas fa-fw fa-reply"></i> Kembali</a>
      </div>
   </div>
</div>