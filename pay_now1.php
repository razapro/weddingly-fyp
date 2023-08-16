<?php 

require('admin/inc/db_config.php');
require('admin/inc/essentials.php');

  date_default_timezone_set("Asia/Karachi");

  session_start();

  if(!(isset($_SESSION['login']) && $_SESSION['login']==true)){
    redirect('index.php');
  }

  if(isset($_POST['pay_now']))
  {
    header("Pragma: no-cache");
    header("Cache-Control: no-cache");
    header("Expires: 0");

    $checkSum = "";

    $ORDER_ID = 'ORD_'.$_SESSION['uId'].random_int(11111,9999999);    
    $CUST_ID = $_SESSION['uId'];
    $INDUSTRY_TYPE_ID = "1123";
    $CHANNEL_ID = "1123";
    $TXN_AMOUNT = $_SESSION['venue']['payment'];

    
    // Create an array having all required parameters for creating checksum.
    
    $paramList = array();
    $paramList["MID"] = "1123";
    $paramList["ORDER_ID"] = $ORDER_ID;
    $paramList["CUST_ID"] = $CUST_ID;
    $paramList["INDUSTRY_TYPE_ID"] = $INDUSTRY_TYPE_ID;
    $paramList["CHANNEL_ID"] = $CHANNEL_ID;
    $paramList["TXN_AMOUNT"] = $TXN_AMOUNT;
    $paramList["WEBSITE"] = "1123";
    $paramList["CALLBACK_URL"] = "1123";

        
    //Here checksum string will return by getChecksumFromArray() function.
    // $checkSum = getChecksumFromArray($paramList,PAYTM_MERCHANT_KEY);

    // Insert payment data into database

    $frm_data = filteration($_POST);
    $checkin_val = $frm_data['checkin'];
    $newDate = explode("-", $checkin_val);
    $newDatePlusOne = strval(intval($newDate[2]) + 1);
    $finalDate = array_slice($newDate, 0, 2);
    array_push($finalDate, $newDatePlusOne);
    $checkout_val = implode('-', $finalDate);
    $day = isset($frm_data['day']) ? $frm_data['day'] : 0;
    $night = isset($frm_data['night']) ? $frm_data['night'] : 0;


    $query1 = "INSERT INTO `booking_order`(`user_id`, `venue_id`, `check_in`, `check_out`,`order_id`, `day`, `night`) VALUES (?,?,?,?,?,?,?)";

    insert($query1,[$CUST_ID,$_SESSION['venue']['id'],$frm_data['checkin'],
      $checkout_val,$ORDER_ID,$day,$night],'issssii');
    
    $booking_id = mysqli_insert_id($con);

    $query2 = "INSERT INTO `booking_details`(`booking_id`, `venue_name`, `price`, `total_pay`,
      `user_name`, `phonenum`, `address`) VALUES (?,?,?,?,?,?,?)";

    insert($query2,[$booking_id,$_SESSION['venue']['name'],$_SESSION['venue']['price'],
      $TXN_AMOUNT,$frm_data['name'],$frm_data['phonenum'],$frm_data['address']],'issssss');


  }

?>

<html>
  <head>
    <title>Processing</title>
  </head>
  <body style="background-color: #f8f9fa!important">
  <div style="color: #2ec1ac;display: flex;justify-content: center;align-items: center;margin-top: 20%">
		<h1>BOOKED</h1>
</div>
<div style="display: flex;justify-content: center;align-items: center;margin-top: 5%" class="back">
<a href="http://localhost/weddingly/">
  <button >Go back to Weddingly</button>
</a>
</div>

  </body>
</html>

<style>

  button {
  background-color: #2ec1ac; 
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
}
</style>

