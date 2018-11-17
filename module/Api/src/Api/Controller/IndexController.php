<?php

namespace Api\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Zend\View\Model\JsonModel;
use Zend\Mail;
use Zend\Mail\Message;
use Zend\Mail\Transport\Sendmail;

use Cart\Model\CartEntity;

class IndexController extends AbstractActionController
{
	public function getProductMapper()
	{
		$sm = $this->getServiceLocator();
		return $sm->get('ProductMapper');
	}

	public function getCartMapper()
  {
    $sm = $this->getServiceLocator();
    return $sm->get('CartMapper');
  }

	public function getUserMapper()
	{
		$sm = $this->getServiceLocator();
		return $sm->get('UserMapper');
	}

	public function getBrandMapper()
	{
		$sm = $this->getServiceLocator();
		return $sm->get('BrandMapper');
	}

	public function getCategoryMapper()
	{
		$sm = $this->getServiceLocator();
		return $sm->get('CategoryMapper');
	}

	/*
	* https://apitester.com/
	*
	*/
	public function indexAction()
	{
		$config = $this->getServiceLocator()->get('Config');

		$filter = array();
		$order = array();
		$brands = $this->getBrandMapper()->fetch(false, $filter, $order);

		$filter = array();
		$order = array();
		$categories = $this->getCategoryMapper()->fetch(false, $filter, $order);

		return new ViewModel(array(
			'config' => $config,
			'brands' => $brands,
			'categories' => $categories,
    ));
	}

	private function _getResponseWithHeader()
  {
      $response = $this->getResponse();
      $response->getHeaders()
               // make can accessed by *
               ->addHeaderLine('Access-Control-Allow-Origin','*')
               // set allow methods
               ->addHeaderLine('Access-Control-Allow-Methods','POST PUT DELETE GET')
							 // json
							 ->addHeaderLine('Content-Type', 'application/json');
      return $response;
  }

	/*
	* http://hackathon.gigamike.net/api/search
	*
	*/
	public function searchAction()
	{
		$results = array();

		$keyword = $this->params()->fromQuery('keyword');
		$category_id = $this->params()->fromQuery('search_category_id');
		$brand_id = $this->params()->fromQuery('search_brand_id');

		$searchFilter = array();
		if(!empty($category_id)){
			$searchFilter['category_id'] = $category_id;
		}
		if(!empty($brand_id)){
			$searchFilter['brand_id'] = $brand_id;
		}
		if(!empty($keyword)){
			$searchFilter['keyword'] = $keyword;
		}

		$order = array('product.name');
		$products = $this->getProductMapper()->getProducts(false, $searchFilter, $order);
		if(count($products)>0){
			foreach($products as $row){

				switch($row->discount_type){
					case 'amount':
						$finalPrice = $row->price - $row->discount;
						break;
					case 'percentage':
						$discount = $row->price * ($row->discount/100);
						$finalPrice = $row->price - $row->discount;
						break;
					default:
						$finalPrice = $row->price;
				}

				$results[] = array(
					'id' => $row['id'],
					'name' => $row['name'],
					'description' => $row['description'],
					'currency' => 'PHP',
					'price' => $row['price'],
					'discount_type' => $row['discount_type'],
					'discount' => $row['discount'],
					'final_price' => number_format($finalPrice, 2, '.' , ','),
					'stock' => $row['stock'],
				);
			}
		}

		$response = $this->_getResponseWithHeader()->setContent(json_encode($results));
    return $response;
	}

	/*
	* http://hackathon.gigamike.net/api/cart-add
	*
	*/
	public function cartAddAction()
	{
		$results = array();
		$errors = array();

		$config = $this->getServiceLocator()->get('Config');

		$userId = $this->params()->fromQuery('user_id');
		$productId = $this->params()->fromQuery('product_id');
		$quantity = $this->params()->fromQuery('quantity');

		if(!$productId){
			$errors['product_id'] = 'Invalid Product ID.';
		}else{
			$product = $this->getProductMapper()->getProduct($productId);
			if(!$product){
				$errors['product_id'] = 'Invalid Product ID.';
			}
		}

		$quantity = (int)$quantity;
		if(!$quantity) {
			$errors['quantity'] = 'Invalid Quantity.';
		}else if(!is_numeric($quantity)){
			$errors['quantity'] = 'Invalid Quantity.';
		}

		if(!$userId) {
			$errors['user_id'] = 'Invalid User ID.';
		}else{
			$user = $this->getUserMapper()->getUser($userId);
			if(!$user){
				$errors['user_id'] = 'Invalid User ID.';
			}
		}

		if(count($errors) <= 0){
			$filter = array(
				'product_id' => $product->getId(),
				'created_user_id' => $user->getId(),
			);
			$order = array();
			$carts = $this->getCartMapper()->getCarts(false, $filter, $order);
			if(count($carts) > 0){
				foreach ($carts as $cart) {
					$quantity = $cart['quantity'] + $quantity;

					$currentCart = $this->getCartMapper()->getCart($cart['id']);
					if($currentCart){
						$currentCart->setQuantity($quantity);
						$this->getCartMapper()->save($currentCart);
					}
				}
			}else{
				$cart = new CartEntity;
				$cart->setProductId($product->getId());
				$cart->setQuantity($quantity);
				$cart->setCreatedUserId($user->getId());
				$cart->setProductId($product->getId());
				$this->getCartMapper()->save($cart);
			}

			$message = "Partner Portal: Added to cart.";
			$subject = 'Partner Portal: Added to cart.';

			try {
				$mail = new Message();
				$mail->setFrom($config['email']);
				$mail->addTo($user->getEmail());
				$mail->setSubject($subject);
				$mail->setBody($message);

				// Send E-mail message
				$transport = new Sendmail('-f'. $config['email']);
				$transport->send($mail);
			} catch(\Exception $e) {
			}

			$results['success'] = 'Successfully added to cart.';
		}else{
			foreach ($errors as $error) {
				$results['error'] = $error;
			}
		}

		$response = $this->_getResponseWithHeader()->setContent(json_encode($results));
    return $response;

		/*
		if($this->getRequest()->isPost()) {
      $data = $this->params()->fromPost();

			$userId = $data['user_id'];
			$productId = $data['product_id'];
			$quantity = $data['quantity'];

			if(!$productId){
  			$errors['product_id'] = 'Invalid Product ID.';
  		}else{
				$product = $this->getProductMapper()->getProduct($productId);
				if(!$product){
					$errors['product_id'] = 'Invalid Product ID.';
				}
			}

			$quantity = (int)$data['quantity'];
      if(!$quantity) {
  			$errors['quantity'] = 'Invalid Quantity.';
  		}else if(!is_numeric($quantity)){
        $errors['quantity'] = 'Invalid Quantity.';
      }

			if(!$userId) {
				$errors['user_id'] = 'Invalid User ID.';
			}else{
				$user = $this->getUserMapper()->getUser($this->identity()->id);
	  		if(!$user){
	        $errors['user_id'] = 'Invalid User ID.';
	  		}
			}

			if(count($errors) < 0){
				$filter = array(
					'product_id' => $product->getId(),
					'created_user_id' => $user->id,
				);
				$order = array();
				$carts = $this->getCartMapper()->getCarts(false, $filter, $order);
				if(count($carts) > 0){
					foreach ($carts as $cart) {
						$quantity = $cart->getQuantity() + $quantity;
						$cart->setQuantity($quantity);
						$this->getCartMapper()->save($cart);
					}
				}else{
					$cart = new CartEntity;
					$cart->setProductId($product->getId());
					$cart->setQuantity($quantity);
					$cart->setCreatedUserId($this->identity()->id);
					$cart->setProductId($product->getId());
					$this->getCartMapper()->save($cart);
				}

				$message = "Partner Portal: Added to cart.";
				$subject = 'Partner Portal: Added to cart.';

				try {
					$mail = new Message();
					$mail->setFrom($config['email']);
					$mail->addTo($user->getEmail());
					$mail->setSubject($subject);
					$mail->setBody($message);

					// Send E-mail message
					$transport = new Sendmail('-f'. $config['email']);
					// $transport->send($mail);
				} catch(\Exception $e) {
				}

				$results['success'] = 'Successfully added to cart.';
			}else{
				foreach ($errors as $error) {
					$results['error'] = $error;
				}
			}
		}

		$response = $this->_getResponseWithHeader()->setContent(json_encode($results));
    return $response;
		*/
	}

	/*
	* http://aboitiz2018.gigamike.net/api/cart-delete
	*
	*/
	public function cartDeleteAction()
	{
		$results = array();

		$userId = $this->params()->fromQuery('user_id');
		$keyword = $this->params()->fromQuery('keyword');
		$cartId = $this->params()->fromQuery('cart_id');

		if(!$userId) {
			$errors['user_id'] = 'Invalid User ID.';
		}else{
			$user = $this->getUserMapper()->getUser($this->identity()->id);
			if(!$user){
				$errors['user_id'] = 'Invalid User ID.';
			}
		}

		if(empty($cartId) && empty($keyword)){
			$errors['product'] = 'Requires cartId or product keyword.';
		}else{
			if(!empty($cartId)){
				if(!$cartId){
					$errors['cart_id'] = 'Invalid Cart ID.';
				}else{
					$cart = $this->getCartMapper()->getCart($cartId);
					if($cart){
						$this->getCartMapper()->delete($id);
						$results['success'] = "Item successfully deleted.";
					}else{
						$errors['cart_id'] = 'Invalid Cart ID.';
					}
				}
			}else if(!empty($keyword)){

			}
		}

		$response = $this->_getResponseWithHeader()->setContent(json_encode($results));
    return $response;
	}
}
