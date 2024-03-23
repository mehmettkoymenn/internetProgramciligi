<?php
<<<<<<< HEAD

class Welcome extends CI_Controller {

	public function index()
	{
		$this->load->model("Product_Category_Model");
		$items = $this->Product_Category_Model->getAll();

		$viewData = new stdClass();
		$viewData->items = $items;
		$this->load->view("welcome_message", $viewData);
	}
}




?>
=======
defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/userguide3/general/urls.html
	 */
	public function index()
	{
		$this->load->view('welcome_message');
	}
}
>>>>>>> 300a4c1d290256c896e6b28a651a677eeccd05fa
