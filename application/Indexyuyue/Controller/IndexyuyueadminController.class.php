<?php
namespace Indexyuyue\Controller;
use Common\Controller\AdminbaseController;
class IndexyuyueadminController extends AdminbaseController{
	
	protected $yuyue_model;
	
	function _initialize(){
		parent::_initialize();
		$this->yuyue_model=D("Common/Indextable");
	}

	function index($table=""){
		$where=array();
		if(!empty($table)){
			$where['post_table']=$table;
		}
		if(!empty($_GET["address"])){
		$where['address']=$_GET["address"];
		}
		
		$post_id=I("get.post_id");
		if(!empty($post_id)){
			$where['post_id']=$post_id;
		}
		$count=$this->yuyue_model->where($where)->count();
		$page = $this->page($count, 20);
		$comments=$this->yuyue_model
		->where($where)
		->limit($page->firstRow . ',' . $page->listRows)
		->order("createtime DESC")
		->select();
		$this->assign("comments",$comments);
		$this->assign("Page", $page->show('Admin'));
		$this->display(":index");
	}
	
	function delete(){
		if(isset($_GET['id'])){
			$id = intval(I("get.id"));
			if ($this->yuyue_model->where("id=$id")->delete()!==false) {
				$this->success("删除成功！");
			} else {
				$this->error("删除失败！");
			}
		}
		if(isset($_POST['ids'])){
			$ids=join(",",$_POST['ids']);
			if ($this->yuyue_model->where("id in ($ids)")->delete()!==false) {
				$this->success("删除成功！");
			} else {
				$this->error("删除失败！");
			}
		}
	}
	
	 
	
}