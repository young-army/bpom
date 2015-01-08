<div class="row">
	<div class="span12">      		  		
  		<div class="widget ">
  			<div class="widget-header">
  				<i class="icon-user"></i>
  				<h3>Data User</h3>
			</div> <!-- /widget-header -->
			
			<div class="widget-content">
				<div class="span11">
					<a data-toggle="modal" href="#myModal" class="btn btn-primary"> New Data </a><br><hr>
					<table id="example1" class="table table-bordered table-striped">
	                	<thead>
	                        <tr> 
	                        	<th>No</th>
	                        	<th>Menu</th>
	                        	<th>Url</th>
	                        	<th>Parent</th>
	                        	<th>Icon</th>
	                            <th width="120">Aksi</th>
	                        </tr>
	                    </thead>
	                    <tbody>
	                        <tr>
	                        	<td>1</td>
	                        	<td>Dashboard</td>
	                        	<td>dashboard</td>
	                        	<td>0</td>
	                        	<td>icon-home </td>
	                        	<td class="td-actions">
									<a class="btn btn-small btn-success" href="#"><i class="btn-icon-only icon-ok"> </i></a>
									<a class="btn btn-primary btn-small" href="#"><i class="btn-icon-only icon-pencil"> </i></a>
									<a class="btn btn-danger btn-small" href="#"><i class="btn-icon-only icon-remove"> </i></a>
								</td>
	                        </tr>
	                      
	                    </tbody>
	               	</table>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">FORM DATA</h4>
            </div>
            <form class ='form-horizontal' action="#" method="post">
                <div class="modal-body" style="margin-left: -60px;">    
                    <div class="control-group" id="">
                        <label class="control-label">Menu</label>
                        <div class="controls">
                            <input type="text" class="span4" name="jabatan" placeholder="Input Menu" class="form-control" value="" required/>
                        </div>
                    </div>
                    <div class="control-group" id="">
                        <label class="control-label">Url</label>
                        <div class="controls">
                            <input type="text" class="span4" name="jabatan" placeholder="Input URL" class="form-control" value="" required/>
                        </div>
                    </div>
                    <div class="control-group" id="">
                        <label class="control-label">Icon</label>
                        <div class="controls">
                            <input type="text" class="span4" name="jabatan" placeholder="Icon" class="form-control" value="" required/>
                        </div>
                    </div>
                    <div class="control-group" id="">
                        <label class="control-label">Parent Menu</label>
                        <div class="controls">
                            <select class="span4" name="jabatan" class="form-control" value="" required>
                            	<option> -- Choose -- </option>
                            </select>
                        </div>
                    </div>
                </div> 
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <input type="submit" class="btn btn-primary" value="Save changes"/>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->