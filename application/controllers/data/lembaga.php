<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class lembaga extends CI_Controller {

	function __construct()
	{
		parent::__construct();
		if ($this->session->userdata('sess_login') != TRUE) {
		 	redirect('auth','refresh');
		}
	}

	function index()
	{	
		$data['kelurahan'] = $this->app_model->get_kelurahan();
		$data['kabupaten'] = $this->app_model->get_kabupaten();
		$data['lembaga'] = $this->app_model->get_lembaga();
		$data['page'] = 'data/lembaga_view';
		$this->load->view('template',$data);
	}
	
	function upload_photo($data,$name){
		$file = $data;
		$folder = "./assets/upload/photos/";
		$folder = $folder . basename($name);
		move_uploaded_file($data['tmp_name'], $folder);	
	}
	
	function get_listjab($id){
		$data = $this->app_model->getlistjab($id);
		$list = "<option> -- </option>";
		foreach($data as $row){
		$list .= "<option value='".$row->id_jabatan."'>".$row->jabatan."</option>";
		}
		die($list);
	}
	
	function save_karyawan(){
		$photo = date('Ymdhis').'_'.$_FILES['foto']['name'];
		$this->upload_photo($_FILES['foto'],$photo);
		$data = array(
		'nik'		  => $this->input->post('nik'),
		'nama'		  => $this->input->post('nama'),
		'jns_kel'	  => $this->input->post('jk'),
		'alamat'      => $this->input->post('alamat'),
		'hp'		  => '+62'.$this->input->post('telepon'),
		'email'		  => $this->input->post('email'),
		'jabatan_id'  => $this->input->post('jabatan'),
		'status'	  => $this->input->post('status'),
		'pictures'	  => $photo
		);
		$this->app_model->insertdata('tbl_karyawan',$data);
		echo "<script>alert('Sukses');
		document.location.href='".base_url()."data/karyawan';</script>";
	}
	
	function save_lembaga(){
		if($this->input->post('level')==1){
		$data = array(
		'kode_lembaga'	=> $this->input->post('kode'),
		'lembaga'		=> $this->input->post('lembaga'),
		'level'			=> $this->input->post('level'),
		'kelurahan_id'	=> $this->input->post('kelurahan'),
		'kabupaten_id'	=> $this->input->post('kabupaten'),
		'pusat'			=> 1
		);
		}else{
		$data = array(
		'kode_lembaga'	=> $this->input->post('kode'),
		'lembaga'		=> $this->input->post('lembaga'),
		'level'			=> $this->input->post('level'),
		'kelurahan_id'	=> $this->input->post('kelurahan'),
		'kabupaten_id'	=> $this->input->post('kabupaten'),
		'pusat'			=> 0
		);
		}
		$this->db->insert('tbl_lembaga',$data);
		echo "<script>alert('Berhasil');
		document.location.href='".base_url()."data/lembaga';</script>";
	}
	
	function del_lembaga($id){
		$this->app_model->deletedata('tbl_lembaga','id_lembaga',$id);
		echo "<script>alert('Berhasil');
		document.location.href='".base_url()."data/lembaga';</script>";
	}

}

/* End of file karyawan.php */
/* Location: ./application/controllers/karyawan.php */