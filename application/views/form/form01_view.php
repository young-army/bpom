<link rel="stylesheet" href="<?php echo base_url();?>assets/js/jquery-ui/css/ui-lightness/jquery-ui-1.9.2.custom.css">
<script src="<?php echo base_url();?>assets/js/jquery-ui/js/jquery-ui-1.9.2.custom.js"></script>
<script>
$(function() {
$( "#datepicker" ).datepicker({ dateFormat:'yy-mm-dd' });
});
</script>
<div class="row">
  	<div class="span12">      		
  		<div class="widget ">
  			<div class="widget-header">
  				<i class="icon-user"></i>
  				<h3>FORM 01</h3>
			</div> <!-- /widget-header -->
			<div class="widget-content">
				<div class="tabbable">
					<ul class="nav nav-tabs">
					  <li class="active"><a href="#formcontrols" data-toggle="tab">Form</a></li>
					  <li><a href="#data" data-toggle="tab">Data</a></li>
					  <li><a href="#report" data-toggle="tab">Report</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="formcontrols">
							<b><center>LAPORAN KEWASPADAAN KERACUNAN PANGAN</center></b><br>
							<form id="edit-profile" class="form-horizontal" method="post" action="<?php echo base_url();?>form/form01/save_n_gen">
								<fieldset>
									<div class="control-group  pull-right" style="margin-right:100px;">											
										<label class="control-label">No : </label>
										<div class="controls">
											<input type="text" style="text-align:center;" name="kode" class="span3 disable" id="" placeholder="Pelapor" value="PPL-<?php echo date('Y');?>-MTR-<?php echo date('m');?>-<?php echo $count;?>" readonly>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									<div class="control-group">											
										<label class="control-label">Pelapor</label>
										<div class="controls">
											<input type="text" class="span4" id="" name="pelapor" placeholder="Pelapor" value="">
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									<!--div class="control-group">											
										<label class="control-label">No Tlp</label>
										<div class="controls">
											<input type="text" class="span4" id="" placeholder="Tlp" value="">
										</div> <!-- /controls -->				
									<!--/div> <!-- /control-group -->
									<div class="control-group">											
										<label class="control-label">Alamat</label>
										<div class="controls">
											<textarea class="span4" id="" name="alamat" placeholder="Alamat" value=""></textarea>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									<div class="control-group">											
										<label class="control-label">Waktu Awal Kejadian</label>
										<div class="controls">
											<input type="text" class="span4" id="datepicker" name="tgl_kejadian" placeholder="Waktu Kejadian" value="">
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									<div class="span12">
										<div class="control-group">											
											<label class="control-label">Terdapat Kejadian :</label>				
										</div> <!-- /control-group -->
										<div class="span5">
											<div class="control-group">											
										<label class="control-label">Lokasi</label>
										<div class="controls">
											<input type="text" class="span4" id="" name="lokasi" placeholder="Lokasi" value="">
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									<div class="control-group">											
										<label class="control-label">Kelurahan</label>
										<div class="controls">
											<select name="kelurahan">
											<option></option>
											<?php foreach($kelurahan as $kel){?>
											<option value="<?php echo $kel->id_kelurahan;?>"><?php echo $kel->kelurahan;?></option>
											<?php } ?>
											</select>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									<div class="control-group">											
										<label class="control-label">Kecamatan</label>
										<div class="controls">
											<select name="kecamatan">
											<option></option>
											<?php foreach($kecamatan as $kec){?>
											<option value="<?php echo $kec->id_kecamatan;?>"><?php echo $kec->kecamatan;?></option>
											<?php } ?>
											</select>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									<div class="control-group">											
										<label class="control-label">Kabupaten / Kota</label>
										<div class="controls">
											<select name="kabupaten">
											<option></option>
											<?php foreach($kabupaten as $kab){?>
											<option value="<?php echo $kab->id_kabupaten;?>"><?php echo $kab->kabupaten_kota;?></option>
											<?php } ?>
											</select>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									<div class="control-group">											
										<label class="control-label">Provinsi</label>
										<div class="controls">
											<select name="provinsi">
											<option></option>
											<?php foreach($provinsi as $pro){?>
											<option value="<?php echo $pro->id_provinsi;?>"><?php echo $pro->provinsi;?></option>
											<?php } ?>
											</select>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									<div class="control-group">											
										<label class="control-label">Pangan Dugaan Penyebab</label>
										<div class="controls">
											<input type="text" class="span4" id="" name="dugaan_pangan" placeholder="Dugaan" value="">
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									<div class="control-group">											
										<label class="control-label">a. Jumlah Korban Sakit</label>
										<div class="controls">
											<input type="text" class="span3" id="" name="pas_skt" placeholder="Sakit" value=""> orang
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									<div class="control-group">											
										<label class="control-label">b. Jumlah Korban Meninggal</label>
										<div class="controls">
											<input type="text" class="span3" id="" name="pas_mgl" placeholder="Meninggal" value=""> orang
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
										</div>
										<div class="span5">
											<div class="control-group">											
											<label class="control-label">Gejala</label>
	                                        <div class="controls">
	                                        	<table>
													<tr>
													<?php $no = 1; foreach($gejala as $gej){?>
	                                        			<td><input type="checkbox" name="gejala<?php echo $no;?>" value="<?php echo $gej->kd_gejala;?>" style="margin-top:-2px">&nbsp;<span style=""><?php echo $gej->gejala;?></span>&nbsp;</td>
	                                        		<?php
													if($no%4==0){?>
													</tr>
													<tr>
													<?php } $no++; }  ?>
													</tr>
	                                        		<tr>
	                                        			<!--td><input type="checkbox" name="lain" id="lain"> Lainnya</td-->
	                                        			<td colspan="3"><input type="text" class="span2" id="" placeholder="Lainnya" value="" name="lainnya"></td>
	                                        		</tr>
													<input type="hidden" name="grow" value="<?php echo $no-1;?>">
	                                        	</table>
	                                        </div>		<!-- /controls -->		
										</div> <!-- /control-group -->
										</div>
									</div>
								
									
									<div class="form-actions">
										<input type="submit" class="btn btn-primary" value="Save"/> 
										<input type="reset" class="btn btn-warning" value="Reset"/>
									</div> <!-- /form-actions -->
								</fieldset>
							</form>
						</div>
						<div class="tab-pane" id="data">
							<div class="span11">
								<table id="example1" class="table table-bordered table-striped">
				                	<thead>
				                        <tr> 
				                        	<th>No</th>
				                        	<th>Kode Keluhan</th>
				                        	<th>Tanggal</th>
				                        	<th>Nama Pelapor</th>
				                        	<th>Lokasi</th>
			                                <th width="120">Aksi</th>
				                        </tr>
				                    </thead>
				                    <tbody>
										<?php $no = 1; foreach($keluhan as $row){?>
				                        <tr>
				                        	<td><?php echo $no;?></td>
				                        	<td><a href="<?php echo base_url();?>form/form01/result/<?php echo $row->kd_keluhan;?>"><?php echo $row->kd_keluhan;?></a></td>
				                        	<td><?php echo $row->tgl_laporan;?></td>
				                        	<td><?php echo $row->pelapor;?></td>
				                        	<td><?php echo $row->lokasi;?></td>
				                        	<td class="td-actions">
												<a  data-toggle="modal" class="btn btn-small btn-success" href="#menu"><i class="btn-icon-only icon-ok"> </i></a>
												<a class="btn btn-primary btn-small" href="#"><i class="btn-icon-only icon-pencil"> </i></a>
												<a class="btn btn-danger btn-small" onclick="return confirm('Apakah Anda Yakin?')" href="<?php echo base_url();?>form/form01/del_keluhan/<?php echo $row->kd_keluhan;?>">
												<i class="btn-icon-only icon-remove"> </i></a>
											</td>
				                        </tr>
										<?php $no++; } ?>
				                    </tbody>
				               	</table>
							</div>
						</div>
						<div class="tab-pane" id="report">
							<form id="edit-profile" class="form-horizontal" method="post" action="#">
								<fieldset>
									<div class="control-group">											
										<label class="control-label" for="username">From</label>
										<div class="controls">
											<input type="text" class="span6" id="tgl1" placeholder="dd/mm/yyyy" value="">
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									<div class="control-group">											
										<label class="control-label" for="firstname">To</label>
										<div class="controls">
											<input type="text" class="span6" id="tgl2" placeholder="dd/mm/yyyy" value="">
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									<div class="form-actions">
										<input type="submit" class="btn btn-primary" value="Save"/> 
										<input type="reset" class="btn btn-warning" value="Reset"/>
									</div> <!-- /form-actions -->
								</fieldset>
							</form>
						</div>
				</div>
			</div>
		</div>
	</div>
</div>